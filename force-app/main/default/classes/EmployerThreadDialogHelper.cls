public with sharing class EmployerThreadDialogHelper {
    private static final Integer CACHING_CALCULATION_TIME = -60;
    public static boolean isCacheExpired;
    private static final LoggerUtility logger = new LoggerUtility();

    @AuraEnabled(cacheable=true)
    public static boolean getCacheExpired(String agreementNumber, String userId) {
        try {
            if (!InputValidator.isValidRecordId(userId)) {
                throw new AuraHandledException('Invalid input format: User Id is not a valid Id');
            }
            if (!InputValidator.isValidContractExternalId(agreementNumber)) {
                throw new AuraHandledException(
                    'Invalid input format: ' + agreementNumber + ' is not a valid Contract External Id'
                );
            }
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
            logWarning(logger, agreementNumber, e.getMessage(), e.getStackTraceString());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void saveTermsAccepted(String contractNumber, String user) {
        try {
            if (!InputValidator.isValidRecordId(user) || !InputValidator.isValidContractExternalId(contractNumber)) {
                throw new AuraHandledException('Invalid input format.');
            }
            Thread__c thread = getThread(contractNumber);
            thread.TAG_LastCachedTermsTime__c = DateTime.now();
            thread.TAG_LastCachedTermsUser__c = user;
            update thread;
        } catch (Exception e) {
            logWarning(logger, contractNumber, e.getMessage(), e.getStackTraceString());
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static Thread__c getThread(String contractNr) {
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

    /**
     * Helper method to log exceptions
     * @param logger LoggerUtility instance
     * @param referenceInfo Record id or external id
     * @param message Description of the error
     * @param stacktrace Error stacktrace indicating where it occured
     * */

    private static void logWarning(LoggerUtility logger, String referenceInfo, String message, String stacktrace) {
        LoggerUtility.LogLevel logLevel = LoggerUtility.LogLevel.Warning;
        logger.logMessage(logLevel, '', referenceInfo, message, stacktrace, null, CRM_ApplicationDomain.Domain.POAB);
        logger.publish();
    }
}
