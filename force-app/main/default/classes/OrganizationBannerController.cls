//Alle klasser med aura enabled methods skal ha with sharing. 
public without sharing class OrganizationBannerController {

    //AuraEnabled metoder må sanitere input parameters før de brukes i query.
    @AuraEnabled(cacheable=true)
    public static Account getRepresentedOrganization(String userId) {
        //ToDo: Valider format på userId
        try {
            //Kode må spesifikt sjekke tilgang til objekter og felt før Queries og DML
            String usersLastRepresentedOrganization = [
                SELECT AG_LastRepresentedOrganization__c
                FROM User
                WHERE Id = :userId
            ]
            ?.AG_LastRepresentedOrganization__c;
            //Kode må spesifikt sjekke tilgang til objekter og felt før Queries og DML
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

    //AuraEnabled metoder må sanitere input parameters før de brukes i query.
    @AuraEnabled(cacheable=true)
    public static Contract__c getContract(String contractNr) {
        //ToDo: Valider format på contractNr
        //Kode må spesifikt sjekke tilgang til objekter og felt før Queries og DML
        return [SELECT id, TAG_ExternalURL__c, TAG_MeasureParticipant__c FROM Contract__c WHERE ExternalId__c = :contractNr];
    }

    //AuraEnabled metoder må sanitere input parameters før de brukes i query.
    @AuraEnabled(cacheable=true)
    public static Account getOrganization(String orgNumber) {
        //ToDo: Valider format på orgNumber
        //Kode må spesifikt sjekke tilgang til objekter og felt før Queries og DML
        return [SELECT id, INT_OrganizationNumber__c, Name FROM Account WHERE INT_OrganizationNumber__c = :orgNumber];
    }
}
