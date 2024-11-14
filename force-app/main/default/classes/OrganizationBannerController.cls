//Should only have access if user have access to the thread
//Hent tråd som bruker har tilgang til. Kall priviliged klasse med threadId
public with sharing class OrganizationBannerController {
    @AuraEnabled(cacheable=true)
    public static BannerWrapper getBannerData(String threadId) {
        System.debug(threadId);
        if (String.isBlank(threadId)) {
            return null;
            //throw new AuraHandledException('No input');
        }
        if (!InputSanitizer.isValidRecordId(threadId)) {
            return null;
            //throw new AuraHandledException('Invalid input format');
        }
        List<Thread__c> threads = [
            SELECT Id
            FROM Thread__c
            WHERE Id = :threadId
            LIMIT 1
        ];
        if (threads.isEmpty()) {
            return null;
            //throw new AuraHandledException('Entity not found');
        }
        Contract__c contract = OrganizationBannerPriviligedHelper.getContract(threadId);

        BannerWrapper bannerWrapper = new BannerWrapper(contract);

        return bannerWrapper;
    }

    public class BannerWrapper {
        String accountName;
        String accountOrgNumber;
        String contractMeasureParticipant;
        String contractNumber;
        String contractUrl;

        @AuraEnabled
        public String getAccountName() {
            return this.accountName;
        }

        @AuraEnabled
        public String getAccountOrgNumber() {
            return this.accountOrgNumber;
        }

        @AuraEnabled
        public String getContractMeasureParticipant() {
            return this.contractMeasureParticipant;
        }

        @AuraEnabled
        public String getContractNumber() {
            return this.contractNumber;
        }

        @AuraEnabled
        public String getContractUrl() {
            return this.contractUrl;
        }

        public BannerWrapper(Contract__c contract) {
            this.accountName = contract.TAG_Account__r.Name;
            this.accountOrgNumber = contract.TAG_Account__r.INT_OrganizationNumber__c;
            this.contractMeasureParticipant = contract.TAG_MeasureParticipant__c;
            this.contractNumber = contract.ExternalId__c;
            this.contractUrl = contract.TAG_ExternalURL__c;
        }
    }
}
