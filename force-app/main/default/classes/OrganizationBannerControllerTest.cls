@isTest
public with sharing class OrganizationBannerControllerTest {
    @TestSetup
    static void createData() {
        myTriggers.disable(PersonHandler.class);
        myTriggers.disable(PersonAccessHandler.class);
        myTriggers.disable(CommunityUserUpdateHandler.class);
        User navEmployee = TestDataFactory_Community.getUsers(1, 'System Administrator', true, true)[0];

        System.runAs(navEmployee) {
            Account businessAccount = TestDataFactory.getAccounts(1, false)[0];
            businessAccount.INT_OrganizationNumber__c = '910825585';
            businessAccount.Name = 'TEST ACCOUNT';
            insert businessAccount;

            Account personAccount = TestDataFactory_Community.getPersonAccounts(1)[0];
            personAccount.INT_PersonIdent__c = '16120102137';
            update personAccount;

            User communityUser = TestDataFactory_Community.getEmployerCommunityUser(
                new Set<Id>{ personAccount.Id },
                'Customer Community Plus Login User',
                false
            )[0];

            Profile communityProfile = [
                SELECT Name, Id
                FROM Profile
                WHERE Name = 'Customer Community Plus Login User'
                LIMIT 1
            ];
            communityUser.FirstName = 'Community User';
            communityUser.ProfileId = communityProfile.Id;

            insert communityUser;

            Thread__c sharedThread = new Thread__c(
                CRM_Account__c = businessAccount.Id,
                AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDD',
                Name = 'Shared thread'
            );
            Thread__c unsharedThread = new Thread__c(
                CRM_Account__c = businessAccount.Id,
                AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDD',
                Name = 'Unshared thread'
            );
            insert new List<Thread__c>{ unsharedThread, sharedThread };

            Thread__Share ts = new Thread__Share(
                ParentId = sharedThread.Id,
                UserOrGroupId = communityUser.Id,
                AccessLevel = 'Edit'
            );
            insert ts;

            Contract__c contract1 = new Contract__c(
                TAG_Account__c = businessAccount.Id,
                TAG_ExternalURL__c = 'www.something.com',
                ExternalId__c = '1234',
                TAG_MeasureParticipant__c = 'Measure Participant1',
                Thread__c = sharedThread.id
            );
            Contract__c contract2 = new Contract__c(
                TAG_Account__c = businessAccount.Id,
                TAG_ExternalURL__c = 'www.somethingelse.com',
                ExternalId__c = '5678',
                TAG_MeasureParticipant__c = 'Measure Participant2',
                Thread__c = unsharedThread.id
            );
            insert new List<Contract__c>{ contract1, contract2 };
        }
    }

    @isTest
    static void should_Return_Data_For_Shared_Threads() {
        User user = [SELECT Id, AG_LastRepresentedOrganization__c FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread = [
            SELECT Id
            FROM Thread__c
            WHERE Name = 'Shared thread'
            LIMIT 1
        ];

        Contract__c contract;
        System.runAs(user) {
            Test.startTest();
            contract = OrganizationBannerController.getBannerData(thread.id);
            Test.stopTest();
        }

        Assert.areEqual(
            '910825585',
            contract.TAG_Account__r.INT_OrganizationNumber__c,
            'Fetched correct organization number.'
        );
        Assert.areEqual('1234', contract.ExternalId__c, 'Fetched correct contract number.');
        Assert.areEqual('TEST ACCOUNT', contract.TAG_Account__r.Name, 'Fetched account name.');
        Assert.areEqual('Measure Participant1', contract.TAG_MeasureParticipant__c, 'Fetched participant.');
        Assert.areEqual('www.something.com', contract.TAG_ExternalURL__c, 'Fetched url.');
    }

    @isTest
    static void should_Not_Return_Data_Without_Permission_On_Thread() {
        User user = [SELECT Id, AG_LastRepresentedOrganization__c FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread = [
            SELECT Id
            FROM Thread__c
            WHERE Name = 'Unshared thread'
            LIMIT 1
        ];

        Contract__c contract;
        System.runAs(user) {
            Test.startTest();
            contract = OrganizationBannerController.getBannerData(thread.id);
            Test.stopTest();
        }
        Assert.isNull(contract, 'Should be null when user have no access.');
    }
}
