@isTest
public class TAG_UpdExternalIdOnThreadsSchedulerTest {
    @testSetup
    static void setup() {
        String rt = [SELECT Id FROM RecordType WHERE DeveloperName = 'TAG_Thread' AND SObjectType = 'Thread__c' LIMIT 1].id;
        // Create test data for Contract__c
        List<Contract__c> contracts = new List<Contract__c>();
        for (Integer i = 0; i < 100; i++) {
            contracts.add(new Contract__c(
                ExternalId__c = 'ExtId' + i
            ));
        }
        insert contracts;

        // Create test data for Thread__c
        //String RecTypeId = Schema.SObjectType.Thread__c.getRecordTypeInfosByDeveloperName().get('TAG_Thread').getRecordTypeId();
        List<Thread__c> threads = new List<Thread__c>();
        for (Contract__c c : [SELECT Id FROM Contract__c]) {
            threads.add(new Thread__c(
                CRM_Related_Object__c = c.Id,
                RecordTypeId = rt
            ));
        }
        insert threads;
    }

    @isTest
    static void testScheduler() {
        // Schedule the job
        String jobId = System.schedule('Test TAG_UpdExternalIdOnThreadsScheduler', '0 0 0 * * ?', new TAG_UpdExternalIdOnThreadsScheduler());

        // Verify the job is scheduled
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.assertEquals('0 0 0 * * ?', ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);

        // Execute the scheduled job
        Test.startTest();
        Database.executeBatch(new TAG_UpdExternalIdOnThreads(), 200);
        Test.stopTest();

        // Verify the batch job results
        List<Thread__c> updatedThreads = [SELECT Id, TAG_RelatedObjectExternalId__c FROM Thread__c WHERE TAG_RelatedObjectExternalId__c != null];
        System.assertEquals(100, updatedThreads.size(), 'All threads should be updated with ExternalId');
    }
}