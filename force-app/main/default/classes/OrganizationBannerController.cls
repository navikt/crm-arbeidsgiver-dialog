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

    @AuraEnabled(cacheable=true)
    public static Contract__c getContract(String contractNr) {
        return [SELECT id, TAG_ExternalURL__c, TAG_MeasureParticipant__c FROM Contract__c WHERE ExternalId__c = :contractNr];
    }

    @AuraEnabled(cacheable=true)
    public static Account getOrganization(String orgNumber) {
        return [SELECT id, INT_OrganizationNumber__c, Name FROM Account WHERE INT_OrganizationNumber__c = :orgNumber];
    }
}
