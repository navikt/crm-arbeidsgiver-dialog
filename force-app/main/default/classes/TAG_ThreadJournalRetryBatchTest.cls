@isTest
public class TAG_ThreadJournalRetryBatchTest {
    @TestSetup
    static void makeData() {
        Account acc = (Account) CRM_HENV_TestDataFactory.createRecord(
            new Account(Name = 'Test Employer 1', INT_OrganizationNumber__c = '910825526')
        );

        Thread__c thread = (Thread__c) CRM_HENV_TestDataFactory.createRecord(
            new Thread__c(
                CRM_isActive__c = true,
                //CRM_Thread_Type__c = 'AG_MLØNN',
                CRM_Account__c = acc.Id,
                CRM_Date_Time_Registered__c = DateTime.Now(),
                TAG_RelatedObjectExternalId__c = '1234',
                CRM_Closed_Date__c = DateTime.Now()
            )
        );

        Common_Code__c aapCode = (Common_Code__c) CRM_HENV_TestDataFactory.createRecord(
            new Common_Code__c(CRM_Code__c = 'AAP', CRM_Code_Set__c = 'Tema', CRM_Active__c = true)
        );

        Message__c m = (Message__c) CRM_HENV_TestDataFactory.createRecord(
            new Message__c(CRM_Message_Text__c = 'TEST MESSAGE', CRM_Thread__c = thread.Id)
        );

        Journal_Entry__c je = (Journal_Entry__c) CRM_HENV_TestDataFactory.createRecord(
            new Journal_Entry__c(
                CRM_Thread__c = thread.Id,
                CRM_Created_By_NAV_Unit__c = '4100',
                CRM_Journal_Post_Type__c = 'INNGAAENDE',
                Journal_Entry_Status__c = 'Failed'
            )
        );

        thread.CRM_Thread_Type__c = 'AG_MLØNN';
        update thread;
    }

    @isTest
    static void testJournalBatch() {
        ApiMock.setTestMock('POST_CREATE_JOURNAL', 200, 'OK');

        System.assertEquals(1, [SELECT COUNT() FROM Journal_Entry__c]);
        System.assertEquals(2, [SELECT COUNT() FROM Thread__c]);

        Test.startTest();
        TAG_ThreadJournalRetryBatch.initThreadJournalBatcher();
        Test.stopTest();

        System.assertEquals(1, [SELECT COUNT() FROM Journal_Entry__c WHERE Journal_Entry_Status__c = 'Completed']);
        System.assertEquals(1, [SELECT COUNT() FROM Thread__c WHERE CRM_Journal_Status__c = 'Journal Started']);
    }
}
