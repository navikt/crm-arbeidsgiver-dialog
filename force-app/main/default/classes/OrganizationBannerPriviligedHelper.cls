public without sharing class OrganizationBannerPriviligedHelper {
    public static Contract__c getContract(Id threadId) {
        List<Contract__c> contracts = [
            SELECT
                TAG_Account__r.Name,
                TAG_Account__r.INT_OrganizationNumber__c,
                TAG_MeasureParticipant__c,
                ExternalId__c,
                TAG_ExternalURL__c
            FROM Contract__c
            WHERE Thread__c = :threadId
            LIMIT 1
        ];
        if (contracts.isEmpty()) {
            return null;
        } else {
            return contracts[0];
        }
    }
}
