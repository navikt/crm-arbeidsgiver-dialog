@isTest
public class RecordShareInitializerControllerTest {
    @TestSetup
    static void createData() {
        Account businessAccount = TestDataFactory.getAccounts(1, false)[0];
        businessAccount.INT_OrganizationNumber__c = '910825585';
        insert businessAccount;

        Account personAccount = TestDataFactory_Community.getPersonAccounts(1)[0];
        personAccount.INT_PersonIdent__c = '16120102137';
        update personAccount;

        User communityUser = TestDataFactory_Community.getEmployerCommunityUser(
            new Set<Id>{ personAccount.Id },
            'Customer Community Plus User',
            false
        )[0];

        Profile communityProfile = [SELECT Name, Id FROM Profile WHERE Name = :'Customer Community Plus User' LIMIT 1];
        communityUser.FirstName = 'Community User';
        communityUser.ProfileId = communityProfile.Id;

        insert communityUser;

        UserRole userrole = [SELECT Id, DeveloperName FROM UserRole WHERE DeveloperName = 'Default' Limit 1];
        User user = [SELECT Id, UserRoleId FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        user.UserRoleId = userrole.Id;

        update user;
    }

    @isTest
    static void testingThreadSharesCreated() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        String strId = Id.valueOf(user.Id);

        Thread__c newThread = new Thread__c(CRM_Account__c = businessAccount.Id, CRM_Thread_Type__c = 'AG_MLØNN');

        System.runAs(user) {
            Test.startTest();
            RecordShareInitializerController.calculateSharingForUser(strId, '910825585');
            Test.stopTest();
        
        List<Thread__Share> threadShare = [
            SELECT ParentId, UserOrGroupId, AccessLevel
            FROM Thread__Share
            WHERE UserOrGroupId =:strId LIMIT 1
        ];

        List<Thread__c> thread = [
            SELECT Id
            FROM Thread__c
            WHERE CRM_Account__c IN (SELECT Id FROM Account WHERE INT_OrganizationNumber__c = '910825585')
        ];
        
        System.assertEquals(threadShare[0].ParentId, thread[0].Id, 'No records shares created');
        }
    }

    @isTest
    static void testErrorHandling() {
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        String strId = Id.valueOf(user.Id);

        System.runAs(user) {
            Test.startTest();
            try {
                RecordShareInitializerController.calculateSharingForUser(strId, '910825586');
                System.assert(false, 'Expected an exception.');
            } catch(AuraHandledException e) {
                System.debug('AuraHandledException: ' +e.getMessage());
                System.assert(false, e.getMessage());
            }
                Test.stopTest();
                
        }
    }
}