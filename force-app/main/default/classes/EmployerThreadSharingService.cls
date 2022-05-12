public without sharing class EmployerThreadSharingService {
    private static final Map<String, String> THREAD_TOPIC_SERVICE_CODE = new Map<String, String>{
        '5719' => 'TILTAK',
        '1234' => 'TRENING'
    };
    private String organizationNumber;
    private String personIdent;

    public EmployerThreadSharingService(String organizationNumber, String personIdent) {
        this.organizationNumber = organizationNumber;
        this.personIdent = personIdent;
    }

    public void calculateSharing() {
        // Check service codes user has access to
        List<String> usersTopics = getUsersTopics();
        // Get threads related to organization number and topics
        List<Thread__c> threadsToShare = getShareableThreads(usersTopics);
        // Loop over threads if user has service code for thread topic then create share.
        List<Thread__Share> threadShares = createThreadShares(threadsToShare);
        // Get thread shares for topic that user no longer should have access to then delete shares.
        deleteOutdatedThreadShares(threadShares);
    }

    private List<String> getUsersTopics() {
        List<String> usersTopics = new List<String>();

        for (String code : THREAD_TOPIC_SERVICE_CODE.keySet()) {
            if (checkAccessToServiceCode(code) == true) {
                usersTopics.add(THREAD_TOPIC_SERVICE_CODE.get(code));
            }
        }
        return usersTopics;
    }

    public Boolean checkAccessToServiceCode(String serviceCode) {
        AltinnCalloutService altinn = new AltinnCalloutService();
        AltinnCalloutService.AltinnRightsResponse response = altinn.getRights(
            personIdent,
            organizationNumber,
            serviceCode
        );

        if (response.success == true && response.rights.size() >= 1) {
            return true;
        }

        return false;
    }

    private List<Thread__c> getShareableThreads(List<String> threadTopics) {
        List<Thread__c> threads = new List<Thread__c>();

        threads = [
            SELECT Id
            FROM Thread__c
            WHERE
                CRM_Account__c IN (SELECT Id FROM Account WHERE INT_OrganizationNumber__c = :organizationNumber)
                AND CRM_Thread_Type__c IN :threadTopics
        ];

        return threads;
    }

    private User getUsersFromPersonIdent() {
        return [
            SELECT Id
            FROM User
            WHERE AccountId IN (SELECT Id FROM Account WHERE INT_PersonIdent__c = :personIdent)
        ];
    }

    /**
     * If has rights for service code share all threads where CRM_Thread_Type__c AG_Tiltaksavtale
     *
     */
    public List<Thread__Share> createThreadShares(List<Thread__c> threads) {
        User user = getUsersFromPersonIdent();
        List<Thread__Share> threadShares = new List<Thread__Share>();

        for (Thread__c t : threads) {
            Thread__Share ts = new Thread__Share(ParentId = t.Id, UserOrGroupId = user.Id, AccessLevel = 'Edit');
            threadShares.add(ts);
        }

        insert threadShares;

        return threadShares;
    }

    public void deleteOutdatedThreadShares(List<Thread__Share> threadShares) {
        Map<Id, Thread__Share> threadSharesById = new Map<Id, Thread__Share>();
        User user = getUsersFromPersonIdent();
        for (Thread__Share ts : threadShares) {
            threadSharesById.put(ts.Id, ts);
        }

        List<Thread__Share> outdatedThreadShares = new List<Thread__Share>();

        /*

    select thread shares where UserOrGroupId is current user Id and ParentId = (SELECT Id FROM Account WHERE INT_OrganizationNumber__c = :organizationNumber)
                    AND CRM_Thread_Type__c IN :threadTopics and share id not in threadSharesById.keySet();
*/
        outdatedThreadShares = [
            SELECT Id, ParentId, UserOrGroupId
            FROM Thread__Share
            WHERE
                UserOrGroupId = :user.Id
                AND ParentId IN (
                    SELECT Id
                    FROM Thread__c
                    WHERE
                        CRM_Account__r.INT_OrganizationNumber__c = :organizationNumber
                        AND CRM_Thread_Type__c IN :THREAD_TOPIC_SERVICE_CODE.keySet()
                )
                AND id NOT IN :threadSharesById.keySet()
        ];

        delete outdatedThreadShares;
    }
}
