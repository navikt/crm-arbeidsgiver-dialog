public with sharing class RecordShareInitializerController {
    //AuraEnabled metoder må sanitere input parameters før de brukes i query.
    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        //ToDo: Valider format på userId og orgNumber
        try {
            String personIdent = [SELECT Contact.Account.INT_PersonIdent__c FROM User WHERE Id = :userId]
            ?.Contact.Account.INT_PersonIdent__c;
            EmployerThreadSharingService empThreadSharingService = new EmployerThreadSharingService();
            empThreadSharingService.calculateSharing(orgNumber, personIdent);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    //AuraEnabled metoder må sanitere input parameters før de brukes i query.
    @AuraEnabled
    public static String getAgreementThreadId(String agreementNumber) {
        //ToDo: Valider format på agreementNumber
        try {
            //Kode må spesifikt sjekke tilgang til objekter og felt før Queries og DML
            return [SELECT Id FROM Thread__c WHERE TAG_RelatedObjectExternalId__c = :agreementNumber].Id;
        } catch (Exception e) {
            throw new AuraHandledException('Thread not found for agreement ' + agreementNumber);
        }
    }
}
