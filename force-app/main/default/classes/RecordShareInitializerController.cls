public with sharing class RecordShareInitializerController {

    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        if(!InputSanitizer.isValidRecordId(userId) || !InputSanitizer.isValidNorwegianOrgNumber(orgNumber)){
            throw new AuraHandledException('Invalid input format.');
        }
        try {
            EmployerThreadSharingService empThreadSharingService = new EmployerThreadSharingService();
            empThreadSharingService.calculateSharing(orgNumber, userId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String getAgreementThreadId(String agreementNumber) {
        if(!InputSanitizer.isValidContractExternalId(agreementNumber)){
            throw new AuraHandledException('Invalid input format.');
        }
        try {
            List<Thread__c> threads = [SELECT Id FROM Thread__c WHERE TAG_RelatedObjectExternalId__c = :agreementNumber LIMIT 1];
            SObjectAccessDecision decision = Security.stripInaccessible(AccessType.READABLE, threads);
            if(!decision.getModifiedIndexes().isEmpty()){
                throw new AuraHandledException('Permission denied');
            }
            return threads[0].Id;
        } catch (Exception e) {
            throw new AuraHandledException('Thread not found for agreement ' + agreementNumber);
        }
    }
}
