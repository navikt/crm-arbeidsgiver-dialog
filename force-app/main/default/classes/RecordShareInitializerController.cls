public with sharing class RecordShareInitializerController {
    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        if (!InputValidator.isValidRecordId(userId) || !InputValidator.isValidNorwegianOrgNumber(orgNumber)) {
            throw new AuraHandledException('Invalid input format.');
        }
        try {
            String personIdent = [SELECT Contact.Account.INT_PersonIdent__c FROM User WHERE Id = :userId]
            ?.Contact.Account.INT_PersonIdent__c;
            EmployerThreadSharingService empThreadSharingService = new EmployerThreadSharingService();
            empThreadSharingService.calculateSharing(orgNumber, personIdent);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String getAgreementThreadId(String agreementNumber) {
        if (!InputValidator.isValidContractExternalId(agreementNumber)) {
            throw new AuraHandledException('Invalid input format.');
        }
        try {
            List<Thread__c> threads = [
                SELECT Id
                FROM Thread__c
                WHERE TAG_RelatedObjectExternalId__c = :agreementNumber
                LIMIT 1
            ];
            SObjectAccessDecision decision = Security.stripInaccessible(AccessType.READABLE, threads);
            if (!decision.getModifiedIndexes().isEmpty()) {
                throw new AuraHandledException('Permission denied');
            }
            return threads[0].Id;
        } catch (Exception e) {
            throw new AuraHandledException('Thread not found for agreement ' + agreementNumber);
        }
    }
}
