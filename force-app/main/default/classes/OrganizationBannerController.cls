public with sharing class OrganizationBannerController {
    private static final LoggerUtility logger = new LoggerUtility();

    @AuraEnabled(cacheable=true)
    public static Contract__c getBannerData(String threadId) {
        if (String.isBlank(threadId) || !InputValidator.isValidRecordId(threadId)) {
            logWarning(
                logger,
                threadId,
                'Method called with invalid input',
                'OrganizationBannerController.getBannerData'
            );
            return null;
        }
        try {
            //Check if running user have access to the record by querying it
            Thread__c thread = [
                SELECT Id
                FROM Thread__c
                WHERE Id = :threadId
                LIMIT 1
            ];
            Contract__c contract = OrganizationBannerPriviligedHelper.getContract(threadId);
            if (contract == null) {
                logWarning(
                    logger,
                    threadId,
                    'No contract found for thread ' + threadId,
                    'OrganizationBannerController.getBannerData'
                );
                return null;
            }
            return contract;
        } catch (System.QueryException e) {
            logWarning(
                logger,
                threadId,
                'No records returned. User may not have access or record may not exist',
                e.getStackTraceString()
            );
            return null;
        } catch (Exception e) {
            logWarning(logger, threadId, e.getMessage(), e.getStackTraceString());
            return null;
        }
    }
    /**
     * Helper method to log warnings with LoggerUtility.
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
