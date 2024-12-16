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
                'Customer Community Plus Login User',
                false
            )[0];

            Profile communityProfile = [
                SELECT Name, Id
                FROM Profile
                WHERE Name = :'Customer Community Plus Login User'
                LIMIT 1
            ];
            communityUser.FirstName = 'Community User';
            communityUser.ProfileId = communityProfile.Id;

            insert communityUser;

            Thread__c sharedThread = new Thread__c(name = 'Test thread', TAG_RelatedObjectExternalId__c = '1234');
            insert sharedThread;

            Thread__Share ts = new Thread__Share(
                ParentId = sharedThread.Id,
                UserOrGroupId = communityUser.Id,
                AccessLevel = 'Edit'
            );
            insert ts;

            PermissionSet ps = [
                SELECT Id
                FROM PermissionSet
                WHERE Name = 'Arbeidsgiver_Dialog_Eksterne'
            ];
            insert new PermissionSetAssignment(AssigneeId = communityUser.id, PermissionSetId = ps.Id);
        }

    }

    @isTest
    static void saveTermsAccepted() {
        Thread__c thread = [
            SELECT Id, TAG_RelatedObjectExternalId__c
            FROM Thread__c
            WHERE Name = 'Test thread'
            LIMIT 1
        ];

        User user = [SELECT Name, Id FROM User WHERE FirstName = 'Community User' LIMIT 1];
        System.runAs(user) {
            Test.StartTest();
            EmployerThreadDialogHelper.saveTermsAccepted(thread.TAG_RelatedObjectExternalId__c, user.Id);
            Test.StopTest();
        }
        Thread__c threadObject = [
            SELECT Id, TAG_RelatedObjectExternalId__c, TAG_LastCachedTermsTime__c, TAG_LastCachedTermsUser__c
            FROM Thread__c
        ];

        System.assertEquals('1234', threadObject.TAG_RelatedObjectExternalId__c, 'Correct thread retrieved');
        System.assertEquals(user.id, threadObject.TAG_LastCachedTermsUser__c, 'Correct User saved');
    }

    @isTest
    static void checkCachedData() {
        User user = [SELECT Name, Id FROM User WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread = [
            SELECT Id, TAG_LastCachedTermsUser__c, TAG_LastCachedTermsTime__c, TAG_RelatedObjectExternalId__c
            FROM Thread__c
            WHERE Name = 'Test thread'
            LIMIT 1
        ];
        thread.TAG_LastCachedTermsUser__c = user.id;
        thread.TAG_LastCachedTermsTime__c = system.now();
        update thread;

        Boolean resultTest;

        System.runAs(user) {
            Test.StartTest();
            resultTest = EmployerThreadDialogHelper.getCacheExpired(thread.TAG_RelatedObjectExternalId__c, user.Id);
            Test.StopTest();
        }

        System.assertEquals(true, resultTest, 'Correct result');
    }

    @isTest
    static void checkCachedDataExpired() {
        User user = [SELECT Name, Id FROM User WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread = [
            SELECT Id, TAG_LastCachedTermsUser__c, TAG_LastCachedTermsTime__c, TAG_RelatedObjectExternalId__c
            FROM Thread__c
            WHERE Name = 'Test thread'
            LIMIT 1
        ];
        thread.TAG_LastCachedTermsUser__c = user.id;
        thread.TAG_LastCachedTermsTime__c = system.now().addMinutes(-61);
        update thread;

        Boolean resultTest;

        System.runAs(user) {
            Test.StartTest();
            resultTest = EmployerThreadDialogHelper.getCacheExpired(thread.TAG_RelatedObjectExternalId__c, user.Id);
            Test.StopTest();
        }

        System.assertEquals(false, resultTest, 'Correct result');
    }
}
