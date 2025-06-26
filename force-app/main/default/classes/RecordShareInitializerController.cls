public with sharing class RecordShareInitializerController {
    /*private static final LoggerUtility logger = new LoggerUtility();

    @AuraEnabled
    public static void calculateSharingForUser(String userId, String orgNumber) {
        if (!InputValidator.isValidRecordId(userId) || !InputValidator.isValidNorwegianOrgNumber(orgNumber)) {
            throw new AuraHandledException('Invalid input format.');
        }
        try {
            EmployerThreadSharingService empThreadSharingService = new EmployerThreadSharingService();
            empThreadSharingService.calculateSharing(orgNumber, userId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String getAgreementThreadId(String agreementNumber) {
        if (!InputValidator.isValidContractExternalId(agreementNumber)) {
            throw new AuraHandledException('Invalid input format.');
        }
        try {
            Thread__c thread = [
                SELECT Id
                FROM Thread__c
                WHERE TAG_RelatedObjectExternalId__c = :agreementNumber
                LIMIT 1
            ];
            return thread.Id;
        } catch (System.QueryException e) {
            logger.logMessage(
                LoggerUtility.LogLevel.Warning,
                '',
                agreementNumber,
                'No threads returned. User may not have access or thread with requested external id may not exist',
                e.getStackTraceString(),
                null,
                CRM_ApplicationDomain.Domain.POAB
            );
            logger.publish();
            throw new AuraHandledException('Thread not found for agreement ' + agreementNumber);
        } catch (Exception e) {
            logger.logMessage(
                LoggerUtility.LogLevel.Warning,
                '',
                agreementNumber,
                e.getMessage(),
                e.getStackTraceString(),
                null,
                CRM_ApplicationDomain.Domain.POAB
            );
            logger.publish();
            throw new AuraHandledException('Thread not found for agreement ' + agreementNumber);
        }
    }*/
}
