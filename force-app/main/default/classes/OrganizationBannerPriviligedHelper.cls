/**
 * Helper class for retrieving privileged information related to organization banners.
 * This class contains methods to assist with data fetching and processing for organization-related banners.
 *
 * Note: The class is declared as "without sharing" to ensure it runs without respecting the user's sharing rules.
 * Use caution and validate access appropriately when using this class.
 */
public without sharing class OrganizationBannerPriviligedHelper {
    /**
     * Retrieves a single Contract__c record associated with the given thread ID.
     * The query fetches specific fields from the Contract__c object, including related account information.
     *
     * @param threadId The ID of the thread to retrieve the associated contract for.
     * @return Returns the first Contract__c record found that matches the thread ID,
     *         or null if no matching record is found.
     */
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