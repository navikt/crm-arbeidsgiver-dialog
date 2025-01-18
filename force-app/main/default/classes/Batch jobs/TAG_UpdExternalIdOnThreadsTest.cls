@isTest
public class TAG_UpdExternalIdOnThreadsTest {
    @testSetup
    static void setup() {
        String rt = [SELECT Id FROM RecordType WHERE DeveloperName = 'TAG_Thread' AND SObjectType = 'Thread__c' LIMIT 1].id;
        // Create test data for Contract__c
        List<Contract__c> contracts = new List<Contract__c>();
        for (Integer i = 0; i < 10; i++) {
            contracts.add(new Contract__c(
                ExternalId__c = 'ExtId' + i
            ));
        }
        insert contracts;

        // Create test data for Thread__c
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
    static void testBatchJob() {
        // Execute the batch job
        Test.startTest();
        TAG_UpdExternalIdOnThreads batch = new TAG_UpdExternalIdOnThreads();
        Database.executeBatch(batch);
        Test.stopTest();

        // Verify the results
        List<Thread__c> updatedThreads = [SELECT Id, TAG_RelatedObjectExternalId__c FROM Thread__c WHERE TAG_RelatedObjectExternalId__c != null];
        System.assertEquals(10, updatedThreads.size(), 'All threads should be updated with ExternalId');
    }
}