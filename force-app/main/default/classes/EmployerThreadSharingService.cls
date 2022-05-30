public without sharing class EmployerThreadSharingService {
    private static final Map<String, EmployerAltinnRight> THREAD_TOPIC_SERVICE_CODE = new Map<String, EmployerAltinnRight>{
        'AG_MLØNN' => new EmployerAltinnRight('5516', '1')
    };
    private static final LoggerUtility logger = new LoggerUtility();

    public void calculateSharing(String organizationNumber, String personIdent) {
        try {
            List<String> usersTopics = getUsersAccessibleTopics(organizationNumber, personIdent);
            List<Thread__c> threadsToShare = getThreadsToShare(usersTopics, organizationNumber);
            User user = getUserFromPersonIdent(personIdent);
            deleteOutdatedThreadShares(user);
            createThreadShares(threadsToShare, user);
        } catch (Exception e) {
            logger.logMessage(
                LoggerUtility.LogLevel.Error,
                '',
                null,
                e.getMessage(),
                null,
                null,
                CRM_ApplicationDomain.Domain.POAB
            );
            logger.publish();
            throw new EmployerThreadSharingException('Failed to calculate employer thread share', e);
        }
    }

    private List<String> getUsersAccessibleTopics(String organizationNumber, String personIdent) {
        List<String> usersTopics = new List<String>();

        for (String code : THREAD_TOPIC_SERVICE_CODE.keySet()) {
            if (
                checkAccessToServiceCode(THREAD_TOPIC_SERVICE_CODE.get(code), organizationNumber, personIdent) == true
            ) {
                usersTopics.add(code);
            }
        }

        return usersTopics;
    }

    private Boolean checkAccessToServiceCode(
        EmployerAltinnRight altinnRight,
        String organizationNumber,
        String personIdent
    ) {
        AltinnCalloutService.AltinnRightsResponse response = new AltinnCalloutService()
            .getRights(personIdent, organizationNumber, altinnRight.serviceCode);

        if (response.success == true) {
            for (AltinnCalloutService.Right right : response.rights) {
                if (
                    right.ServiceCode == altinnRight.serviceCode &&
                    right.ServiceEditionCode == String.valueOf(altinnRight.serviceEditionCode)
                ) {
                    return true;
                }
            }
        }

        return false;
    }

    private List<Thread__Share> createThreadShares(List<Thread__c> threads, User user) {
        List<Thread__Share> threadShares = new List<Thread__Share>();

        for (Thread__c t : threads) {
            Thread__Share ts = new Thread__Share(ParentId = t.Id, UserOrGroupId = user.Id, AccessLevel = 'Edit');
            threadShares.add(ts);
        }

        insert threadShares;

        return threadShares;
    }

    private void deleteOutdatedThreadShares(User user) {
        delete [
            SELECT Id, ParentId, UserOrGroupId
            FROM Thread__Share
            WHERE
                UserOrGroupId = :user.Id
                AND ParentId IN (
                    SELECT Id
                    FROM Thread__c
                    WHERE CRM_isActive__c = TRUE AND CRM_Thread_Type__c IN :THREAD_TOPIC_SERVICE_CODE.keySet()
                )
        ];
    }

    private List<Thread__c> getThreadsToShare(List<String> threadTopics, String organizationNumber) {
        return [
            SELECT Id
            FROM Thread__c
            WHERE
                CRM_Account__c IN (SELECT Id FROM Account WHERE INT_OrganizationNumber__c = :organizationNumber)
                AND CRM_Thread_Type__c IN :threadTopics
        ];
    }

    private User getUserFromPersonIdent(String personIdent) {
        return [
            SELECT Id
            FROM User
            WHERE AccountId IN (SELECT Id FROM Account WHERE INT_PersonIdent__c = :personIdent)
        ];
    }
}

