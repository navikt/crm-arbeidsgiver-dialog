@isTest
public with sharing class EmployerThreadDialogHelperTest {
    @TestSetup
    static void makeData() {
        myTriggers.disable(PersonHandler.class);
        myTriggers.disable(PersonAccessHandler.class);
        myTriggers.disable(CommunityUserUpdateHandler.class);
        User navEmployee = TestDataFactory_Community.getUsers(1, 'System Administrator', true, true)[0];

        System.runAs(navEmployee) {
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

            Profile communityProfile = [
                SELECT Name, Id
                FROM Profile
                WHERE Name = :'Customer Community Plus User'
                LIMIT 1
            ];
            communityUser.FirstName = 'Community User';
            communityUser.ProfileId = communityProfile.Id;

            insert communityUser;
        }

    }

    @isTest
    static void saveTermsAccepted() {
        Thread__c thread = new Thread__c(name = 'Test thread', TAG_RelatedObjectExternalId__c = '1234');
        insert thread;

        User user = [SELECT Name, Id FROM User LIMIT 1];

        Test.StartTest();
        EmployerThreadDialogHelper.saveTermsAccepted(thread.TAG_RelatedObjectExternalId__c, user.Id);
        Test.StopTest();

        Thread__c threadObject = [
            SELECT Id, TAG_RelatedObjectExternalId__c, TAG_LastCachedTermsTime__c, TAG_LastCachedTermsUser__c
            FROM Thread__c
        ];

        System.assertEquals('1234', threadObject.TAG_RelatedObjectExternalId__c, 'Correct thread retrieved');
        System.assertEquals(user.id, threadObject.TAG_LastCachedTermsUser__c, 'Correct User saved');
    }

    @isTest
    static void checkCachedData() {
        User user = [SELECT Name, Id FROM User LIMIT 1];

        Thread__c thread = new Thread__c(
            name = 'Test thread',
            TAG_RelatedObjectExternalId__c = '1234',
            TAG_LastCachedTermsUser__c = user.id,
            TAG_LastCachedTermsTime__c = system.now()
        );
        insert thread;

        Boolean resultTest = EmployerThreadDialogHelper.getCacheExpired(thread.TAG_RelatedObjectExternalId__c, user.Id);

        System.assertEquals(true, resultTest, 'Correct result');
    }

    @isTest
    static void checkCachedDataExpired() {
        User user = [SELECT Name, Id FROM User LIMIT 1];

        Thread__c thread = new Thread__c(
            name = 'Test thread',
            TAG_RelatedObjectExternalId__c = '1234',
            TAG_LastCachedTermsUser__c = user.id,
            TAG_LastCachedTermsTime__c = system.now().addMinutes(-61)
        );
        insert thread;

        Boolean resultTest = EmployerThreadDialogHelper.getCacheExpired(thread.TAG_RelatedObjectExternalId__c, user.Id);

        System.assertEquals(false, resultTest, 'Correct result');
    }
}
