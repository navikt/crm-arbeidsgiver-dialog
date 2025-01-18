public with sharing class TAG_UpdExternalIdOnThreads implements Database.Batchable<sObject> {

    private String recordTypeId;

        public TAG_UpdExternalIdOnThreads() {
            recordTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = 'TAG_Thread' AND SObjectType = 'Thread__c' LIMIT 1].Id;
        }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT Id, RelatedObjectURL__c, TAG_RelatedObjectExternalId__c
            FROM Thread__c
            WHERE TAG_RelatedObjectExternalId__c = null
            AND RecordTypeId = :recordTypeId
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Thread__c> threads) {
        Set<String> contractIds = new Set<String>();
        Map<String, Thread__c> threadMap = new Map<String, Thread__c>();

        for (Thread__c t : threads) {
            String fieldValue = t.RelatedObjectURL__c;
            Pattern pattern = Pattern.compile('/([a-zA-Z0-9]+)"');
            Matcher matcher = pattern.matcher(fieldValue);
            String extractedValue;
            if (matcher.find()) {
                extractedValue = matcher.group(1);
                contractIds.add(extractedValue);
                threadMap.put(extractedValue, t);
            }
        }

        Map<String, Contract__c> contractMap = getExternalId(contractIds);
        List<Thread__c> threadsToUpdate = new List<Thread__c>();
        List<Contract__c> contractsToUpdate = new List<Contract__c>();

        for (String contractId : contractMap.keySet()) {
            if (threadMap.containsKey(contractId)) {
                Thread__c threadToUpdate = threadMap.get(contractId);
                threadToUpdate.TAG_RelatedObjectExternalId__c = contractMap.get(contractId).ExternalId__c;
                threadsToUpdate.add(threadToUpdate);

                Contract__c contractToUpdate = contractMap.get(contractId);
                contractToUpdate.Thread__c = threadToUpdate.Id;
                contractsToUpdate.add(contractToUpdate);
            }
        }

        if (!threadsToUpdate.isEmpty()) {
            update threadsToUpdate;
        }
        if (!contractsToUpdate.isEmpty()) {
            update contractsToUpdate;
        }
    }

    public void finish(Database.BatchableContext bc) {
        return;
    }

    public static Map<String, Contract__c> getExternalId(Set<String> contractIds) {
        Map<String, Contract__c> navContractMap = new Map<String, Contract__c>();
        List<Contract__c> contracts = [
            SELECT Id, ExternalId__c, Thread__c
            FROM Contract__c
            WHERE Id IN :contractIds
        ];
        for (Contract__c c : contracts) {
            navContractMap.put(c.Id, c);
        }
        return navContractMap;
    }
}
