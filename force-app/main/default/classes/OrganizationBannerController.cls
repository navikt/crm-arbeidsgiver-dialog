public without sharing class OrganizationBannerController {
    @AuraEnabled(cacheable=true)
    public static Account getRepresentedOrganization(String userId) {
        try {
            String usersLastRepresentedOrganization = [
                SELECT AG_LastRepresentedOrganization__c
                FROM User
                WHERE Id = :userId
            ]
            ?.AG_LastRepresentedOrganization__c;

            Account account = [
                SELECT Name, INT_OrganizationNumber__c
                FROM Account
                WHERE INT_OrganizationNumber__c = :usersLastRepresentedOrganization
            ];

            return account;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
