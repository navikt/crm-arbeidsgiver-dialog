//Alle klasser med aura enabled methods skal ha with sharing. 
public without sharing class EmployerThreadDialogHelper {
    private static final Integer CACHING_CALCULATION_TIME = -60;
    public static boolean isCacheExpired;

    @AuraEnabled(cacheable=true)
    public static boolean getCacheExpired(String agreementNumber, String userId) {
        //ToDo: Valider format på agreementNumber og UserId
        try {
            Thread__c thread = getThread(agreementNumber);
            isCacheExpired = true;
            if (
                !cacheExpired(DateTime.valueOf(thread.TAG_LastCachedTermsTime__c)) &&
                thread.TAG_LastCachedTermsUser__c == userId
            ) {
                isCacheExpired = false;
            }
            return isCacheExpired ? false : true; //Terms accepted in LWC
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void saveTermsAccepted(String contractNumber, String user) {
        //ToDo: Valider format på contractNumber og user
        try {
            Thread__c thread = getThread(contractNumber);
            thread.TAG_LastCachedTermsTime__c = DateTime.now();
            thread.TAG_LastCachedTermsUser__c = user;
            update thread;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static Thread__c getThread(String contractNr) {
        //ToDo: Valider format på contractNr
        //Kode må spesifikt sjekke tilgang til objekter og felt før Queries og DML
        return [
            SELECT Id, TAG_LastCachedTermsUser__c, TAG_LastCachedTermsTime__c
            FROM Thread__c
            WHERE TAG_RelatedObjectExternalId__c = :contractNr
            LIMIT 1
        ];
    }

    private static boolean cacheExpired(DateTime lastCacheCalculation) {
        boolean expired = true;
        if (lastCacheCalculation > DateTime.now().addMinutes(CACHING_CALCULATION_TIME)) {
            expired = false;
        }
        return expired;
    }
}
