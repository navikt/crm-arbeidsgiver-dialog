public with sharing class RecordShareInitializerController {
    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        try {
            System.debug('Calculating Sharing for...' + ' ' + userId + ' ' + orgNumber);

            String personIdent = [SELECT Contact.Account.INT_PersonIdent__c FROM User WHERE Id = :userId];
            EmployerThreadSharingService.calculateSharing(orgNumber, personIdent);

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
