public with sharing class RecordShareInitializerController {
    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        try {
            System.debug('Calculating Sharing for...' + ' ' + userId + ' ' + orgNumber);

            // calculate sharing
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
