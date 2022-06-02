public without sharing class RecordShareInitializerController {
    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        try {
            System.debug('Calculating Sharing for...' + ' ' + userId + ' ' + orgNumber);

            List<User> personIdent = [SELECT Contact.Account.INT_PersonIdent__c FROM User WHERE Id = :userId];
            EmployerThreadSharingService EmpThreadSharingService = new EmployerThreadSharingService();
            EmpThreadSharingService.calculateSharing(orgNumber, personIdent[0].Contact.Account.INT_PersonIdent__c);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String getAgreementThreadId(String agreementNumber){
        try{
            return [SELECT Id FROM Thread__c WHERE TAG_RelatedObjectExternalId__c = :agreementNumber].Id;
        } catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}
