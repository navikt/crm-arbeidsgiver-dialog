/**
 * Helper class for running privileged operations related to thread. Contains method that
 * checks is provided user should have access to provided organizations threads.
 * If access is permitted, sharing records are created.
 *
 * Note: The class is declared as "without sharing" to ensure it runs without respecting the user's sharing rules.
 * Use caution and validate access appropriately when using this class.
 */
public without sharing class EmployerThreadSharingService {
    private static final Map<String, EmployerAltinnRight> THREAD_TOPIC_SERVICE_CODE = new Map<String, EmployerAltinnRight>{
        'MIDLERTIDIG_LONNSTILSKUDD' => new EmployerAltinnRight('5516', '1'),
        'ARBEIDSTRENING' => new EmployerAltinnRight('5332', '2')
    };
    private static final Integer SHARING_CALCULATION_CACHE_TIME = -2;
    private static final LoggerUtility logger = new LoggerUtility();

    public void calculateSharing(String organizationNumber, String userId) {
        try {
            User user = getUserFromId(userId);
            String personIdent = user.Account.INT_PersonIdent__c;
            //if (cacheExpired(DateTime.valueOf(user.AG_LastSharingCalculation__c))) {
            List<String> usersTopics = getUsersAccessibleTopics(organizationNumber, personIdent);
            List<Thread__c> threadsToShare = getThreadsToShare(usersTopics, organizationNumber);
            deleteOutdatedThreadShares(user);
            createThreadShares(threadsToShare, user);
            cacheUsersLastShareCalculationTimeForOrganization(organizationNumber, user.Id);
            //}
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

    private boolean cacheExpired(DateTime lastShareCalculation) {
        boolean expired = true;
        if (lastShareCalculation > DateTime.now().addMinutes(SHARING_CALCULATION_CACHE_TIME)) {
            expired = false;
        }
        return expired;
    }

    private void cacheUsersLastShareCalculationTimeForOrganization(String organizationNumber, String userId) {
        User user = new User(
            id = userId,
            AG_LastSharingCalculation__c = DateTime.now(),
            AG_LastRepresentedOrganization__c = organizationNumber
        );

        update user;
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
                    WHERE AAREG_Thread_Subject__c IN :THREAD_TOPIC_SERVICE_CODE.keySet()
                )
        ];
    }

    private List<Thread__c> getThreadsToShare(List<String> threadTopics, String organizationNumber) {
        return [
            SELECT Id
            FROM Thread__c
            WHERE
                CRM_Account__c IN (SELECT Id FROM Account WHERE INT_OrganizationNumber__c = :organizationNumber)
                AND AAREG_Thread_Subject__c IN :threadTopics
        ];
    }

    private User getUserFromPersonIdent(String personIdent) {
        return [
            SELECT Id, AG_LastSharingCalculation__c, Account.INT_PersonIdent__c
            FROM User
            WHERE AccountId IN (SELECT Id FROM Account WHERE INT_PersonIdent__c = :personIdent)
        ];
    }

    private User getUserFromId(String userId) {
        List<User> users = [
            SELECT Id, Account.INT_PersonIdent__c, AG_LastSharingCalculation__c
            FROM User
            WHERE Id = :userId
            LIMIT 1
        ];
        if (users.isEmpty()) {
            return null;
        }
        return users[0];
    }
}
