@IsTest
public with sharing class EmployerThreadSharingServiceTest {
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
    static void calculateSharing_successAccessGrant() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread1 = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDDN'
        );
        insert thread1;

        Thread__c thread2 = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'ARBEIDSTRENING'
        );
        insert thread2;

        List<Thread__Share> recordAccessBefore = [
            SELECT Id
            FROM Thread__Share
            WHERE UserOrGroupId = :user.Id AND ParentId = :thread1.Id AND AccessLevel = 'Edit'
        ];

        System.assert(recordAccessBefore.size() == 0, 'No pre-existing record share');

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Test.startTest();
            EmployerThreadSharingService service = new EmployerThreadSharingService();
            service.calculateSharing('910825585', '16120102137');
            Test.stopTest();

            List<Thread__Share> recordAccessAfter = [
                SELECT Id
                FROM Thread__Share
                WHERE UserOrGroupId = :user.Id AND ParentId IN (:thread1.Id, :thread2.Id) AND AccessLevel = 'Edit'
            ];

            System.assertEquals(2, recordAccessAfter.size(), 'Record share created');
        }
    }

    @isTest
    static void calculateSharing_missingAccess() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDDN'
        );
        insert thread;

        List<Thread__Share> recordAccessBefore = [
            SELECT Id
            FROM Thread__Share
            WHERE UserOrGroupId = :user.Id AND ParentId = :thread.Id AND AccessLevel = 'Edit'
        ];

        System.assert(recordAccessBefore.size() == 0, 'No pre-existing record share');

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 500, 'Internal Server Error');

        System.runAs(user) {
            Test.startTest();
            EmployerThreadSharingService service = new EmployerThreadSharingService();
            service.calculateSharing('910825585', '16120102137');
            Test.stopTest();

            List<Thread__Share> recordAccessAfter = [
                SELECT Id
                FROM Thread__Share
                WHERE UserOrGroupId = :user.Id AND ParentId = :thread.Id AND AccessLevel = 'Edit'
            ];

            System.assert(recordAccessAfter.size() == 0, 'No record share created');
        }
    }

    @isTest
    static void calculateSharing_accessOnlyCorrectTopics() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];

        Thread__c thread1 = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDDN'
        );
        Thread__c thread2 = new Thread__c(CRM_Account__c = businessAccount.Id, AAREG_Thread_Subject__c = 'DEFAULT');
        Thread__c thread3 = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'ARBEIDSTRENING'
        );

        insert new List<Thread__c>{ thread1, thread2, thread3 };

        List<Thread__Share> recordAccessBefore = [
            SELECT Id
            FROM Thread__Share
            WHERE UserOrGroupId = :user.Id AND AccessLevel = 'Edit'
        ];

        System.assert(recordAccessBefore.size() == 0, 'No pre-existing record share');

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Test.startTest();
            EmployerThreadSharingService service = new EmployerThreadSharingService();
            service.calculateSharing('910825585', '16120102137');
            Test.stopTest();

            List<Thread__Share> recordAccessAfter = [
                SELECT Id, ParentId
                FROM Thread__Share
                WHERE UserOrGroupId = :user.Id AND AccessLevel = 'Edit'
            ];

            System.assertEquals(2, recordAccessAfter.size(), 'Record Share created');
        }

    }

    @isTest
    static void calculateSharing_deleteOutdatedThreadShares() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];

        Account businessAccount2 = TestDataFactory.getAccounts(1, false)[0];
        businessAccount.INT_OrganizationNumber__c = '123456789';
        insert businessAccount2;

        Thread__c thread1 = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDDN'
        );
        Thread__c thread2 = new Thread__c(
            CRM_Account__c = businessAccount2.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDDN'
        );

        insert new List<Thread__c>{ thread1, thread2 };

        Thread__Share threadShare = new Thread__Share(
            ParentId = thread2.Id,
            UserOrGroupId = user.Id,
            AccessLevel = 'Edit'
        );
        insert threadShare;

        List<Thread__Share> recordAccessBefore = [
            SELECT Id, ParentId
            FROM Thread__Share
            WHERE UserOrGroupId = :user.Id AND AccessLevel = 'Edit'
        ];

        System.assertEquals(1, recordAccessBefore.size(), 'User only has access to 1 thread');
        System.assertEquals(thread2.Id, recordAccessBefore[0].ParentId, 'No pre-existing record share');

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Test.startTest();
            EmployerThreadSharingService service = new EmployerThreadSharingService();
            service.calculateSharing('910825585', '16120102137');
            Test.stopTest();

            List<Thread__Share> recordAccessAfter = [
                SELECT Id, ParentId
                FROM Thread__Share
                WHERE UserOrGroupId = :user.Id AND AccessLevel = 'Edit'
            ];

            System.assertEquals(1, recordAccessAfter.size(), 'User only has access to 1 thread');
            System.assertEquals(thread1.Id, recordAccessAfter[0].ParentId, 'Record Share created');
            System.assertNotEquals(thread2.Id, recordAccessAfter[0].ParentId, 'Outdated record share deleted');
        }
    }

    @isTest
    static void calculateSharing_CalculationError() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        Thread__c thread = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDDN'
        );
        insert thread;

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Exception expectedException = null;
            Test.startTest();
            try {
                EmployerThreadSharingService service = new EmployerThreadSharingService();
                service.calculateSharing('910825585', '12345678');
            } catch (Exception e) {
                expectedException = e;
            }
            Test.stopTest();

            System.assertEquals(
                true,
                expectedException instanceof EmployerThreadSharingException,
                'Invalid personIdent. Correct exception thrown'
            );
        }
    }

    @isTest
    static void calculateSharing_noThreadsToShare() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];

        List<Thread__Share> recordAccessBefore = [
            SELECT Id
            FROM Thread__Share
            WHERE UserOrGroupId = :user.Id AND AccessLevel = 'Edit'
        ];

        System.assert(recordAccessBefore.size() == 0, 'No pre-existing record share');

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Test.startTest();
            EmployerThreadSharingService service = new EmployerThreadSharingService();
            service.calculateSharing('910825585', '16120102137');
            Test.stopTest();

            List<Thread__Share> recordAccessAfter = [
                SELECT Id
                FROM Thread__Share
                WHERE UserOrGroupId = :user.Id AND AccessLevel = 'Edit'
            ];

            System.assertEquals(0, recordAccessAfter.size(), 'No records shares created');
        }
    }
}
