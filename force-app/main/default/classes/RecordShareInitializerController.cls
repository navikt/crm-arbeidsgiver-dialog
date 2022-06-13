public with sharing class RecordShareInitializerController {
    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
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
        try {
            return [SELECT Id FROM Thread__c WHERE TAG_RelatedObjectExternalId__c = :agreementNumber].Id;
        } catch (Exception e) {
            throw new AuraHandledException('Thread not found for agreement ' + agreementNumber);
        }
    }
}
