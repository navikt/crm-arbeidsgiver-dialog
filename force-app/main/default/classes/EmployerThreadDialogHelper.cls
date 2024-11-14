//Alle klasser med aura enabled methods skal ha with sharing.
public with sharing class EmployerThreadDialogHelper {
    private static final Integer CACHING_CALCULATION_TIME = -60;
    public static boolean isCacheExpired;

    @AuraEnabled(cacheable=true)
    public static boolean getCacheExpired(String agreementNumber, String userId) {
        if (!InputSanitizer.isValidRecordId(userId) || !InputSanitizer.isValidContractExternalId(agreementNumber)) {
            throw new AuraHandledException('Invalid input format.');
        }
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
        if (!InputSanitizer.isValidRecordId(user) || !InputSanitizer.isValidContractExternalId(contractNumber)) {
            throw new AuraHandledException('Invalid input format.');
        }
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
        if (!InputSanitizer.isValidContractExternalId(contractNr)) {
            throw new AuraHandledException('Invalid input format.');
        }
        // Enforce FLS for select
        List<Thread__c> thread = [
            SELECT Id, TAG_LastCachedTermsUser__c, TAG_LastCachedTermsTime__c
            FROM Thread__c
            WHERE TAG_RelatedObjectExternalId__c = :contractNr
            LIMIT 1
        ];
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.READABLE, thread);
        if (!decision.getModifiedIndexes().isEmpty()) {
            throw new AuraHandledException('Permission denied');
        }
        if (thread.isEmpty()) {
            return null;
        } else {
            return thread[0];
        }
    }

    private static boolean cacheExpired(DateTime lastCacheCalculation) {
        boolean expired = true;
        if (lastCacheCalculation > DateTime.now().addMinutes(CACHING_CALCULATION_TIME)) {
            expired = false;
        }
        return expired;
    }
}
