@isTest
public class RecordShareInitializerControllerTest {
    @TestSetup
    static void createData() {
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
    static void testingThreadSharesCreated() {
        Account businessAccount = [SELECT Id FROM Account WHERE isPersonAccount = FALSE LIMIT 1];
        User user = [SELECT Id, UserRoleId FROM USER WHERE FirstName = 'Community User' LIMIT 1];

        Thread__c thread = new Thread__c(
            CRM_Account__c = businessAccount.Id,
            AAREG_Thread_Subject__c = 'MIDLERTIDIG_LONNSTILSKUDD'
        );
        insert thread;

        List<Thread__Share> recordAccessBefore = [
            SELECT Id
            FROM Thread__Share
            WHERE UserOrGroupId = :user.Id AND ParentId = :thread.Id AND AccessLevel = 'Edit'
        ];

        System.assert(recordAccessBefore.size() == 0, 'No pre-existing record share');

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Test.startTest();
            RecordShareInitializerController.calculateSharingForUser(user.Id, '910825585');
            Test.stopTest();

            List<Thread__Share> recordAccessAfter = [
                SELECT Id
                FROM Thread__Share
                WHERE UserOrGroupId = :user.Id AND ParentId = :thread.Id AND AccessLevel = 'Edit'
            ];

            System.assertEquals(1, recordAccessAfter.size(), 'Record share created');
        }
    }

    @isTest
    static void testErrorHandling() {
        User user = [SELECT Id FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        Boolean exceptionOccured = false;

        ApiMock.setTestMock('GET_ALTINN_RIGHTS', 200, 'OK');

        System.runAs(user) {
            Test.startTest();
            try {
                RecordShareInitializerController.calculateSharingForUser('1234', '910825586');
            } catch (AuraHandledException e) {
                exceptionOccured = true;
            }
            Test.stopTest();

            System.assertEquals(true, exceptionOccured, 'Invalid userId, an exception was thrown');
        }
    }

    @isTest
    static void getAgreementThreadId_Success() {
        Thread__c thread = new Thread__c(name = 'Test thread', TAG_RelatedObjectExternalId__c = '1234');
        insert thread;

        String threadId = RecordShareInitializerController.getAgreementThreadId('1234');

        System.assertEquals(thread.Id, threadId, 'Correct thread retrieved');
    }

    @isTest
    static void getAgreementThreadId_NotFound() {
        Exception expectedException;

        try {
            String threadId = RecordShareInitializerController.getAgreementThreadId('1234');
        } catch (Exception e) {
            expectedException = e;
        }

        System.assertEquals(true, expectedException instanceof AuraHandledException, 'Thread not found');
    }
}
