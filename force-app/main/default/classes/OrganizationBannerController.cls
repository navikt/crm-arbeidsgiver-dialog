public with sharing class OrganizationBannerController {
    @AuraEnabled(cacheable=true)
    public static Contract__c getBannerData(String threadId) {
        System.debug(threadId);
        if (String.isBlank(threadId)) {
            return null;
        }
        if (!InputValidator.isValidRecordId(threadId)) {
            return null;
        }
        List<Thread__c> threads = [
            SELECT Id
            FROM Thread__c
            WHERE Id = :threadId
            LIMIT 1
        ];
        if (threads.isEmpty()) {
            return null;
        }
        Contract__c contract = OrganizationBannerPriviligedHelper.getContract(threadId);

        return contract;
    }
}
