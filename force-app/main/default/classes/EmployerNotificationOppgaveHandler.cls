public without sharing class EmployerNotificationOppgaveHandler {
    private static LoggerUtility logger = new LoggerUtility('Oppgave');

    @InvocableMethod(label='Create Oppgave Notification' category='Task Handling')
    public static List<NotificationOppgaveResponse> handleNotificationOppgaveRequests(
        List<NotificationOppgaveRequest> taskRequests
    ) {
        List<NotificationOppgaveResponse> responseList = new List<NotificationOppgaveResponse>();

        for (NotificationOppgaveRequest taskRequest : taskRequests) {
            responseList.add(postTask(taskRequest));
        }
        return responseList;
    }

    public static NotificationOppgaveResponse postTask(NotificationOppgaveRequest taskRequest) {
        NotificationOppgaveResponse resp = new NotificationOppgaveResponse();
        Message__c message = taskRequest.message;

        try {
            EmployerNotificationOppgaveService oppgaveService = new EmployerNotificationOppgaveService();
            HttpResponse response = oppgaveService.postTask(createOppgaveRequest(taskRequest));
            Integer statusCode = response.getStatusCode();

            if (statusCode == 200 || statusCode == 201) {
                OppgaveResponse apiResp = (OppgaveResponse) JSON.deserialize(response.getBody(), OppgaveResponse.class);
                message.TAG_NotificationOppgaveId__c = String.valueOf(apiResp.id);
                resp.setResponse(true, null, message);
                update message;
            } else {
                logger.httpError(
                    'Error posting oppgave',
                    response,
                    message,
                    CRM_ApplicationDomain.Domain.POAB,
                    oppgaveService.getTransactionId()
                );
                resp.setResponse(false, oppgaveService.getTransactionId(), message);
            }
        } catch (Exception ex) {
            logger.exception(ex, message, CRM_ApplicationDomain.Domain.POAB);
            resp.setResponse(false, logger.peek().UUID__c, message);
        } finally {
            logger.publish();
        }
        return resp;
    }

    private static EmployerNotificationOppgaveWrapper createOppgaveRequest(NotificationOppgaveRequest taskRequest) {
        return new EmployerNotificationOppgaveWrapper(taskRequest);
    }

    public class NotificationOppgaveResponse {
        @invocableVariable
        public Boolean success;
        @invocableVariable
        public String errorMessage;
        @invocableVariable
        public Message__c message;

        public NotificationOppgaveResponse() {
            this.success = false;
            this.errorMessage = null;
            this.message = null;
        }

        public void setResponse(Boolean success, String errorMessage, Message__c message) {
            this.success = success;
            this.errorMessage = errorMessage;
            this.message = message;
        }

        public NotificationOppgaveResponse(Boolean success, String errorMessage, Message__c message) {
            this.success = success;
            this.errorMessage = errorMessage;
            this.message = message;
        }
    }

    public class NotificationOppgaveRequest {
        @invocableVariable(label='Request type for Notification Oppgave, valid value is POST' required=true)
        public String requestType;
        @invocableVariable
        public Message__c message;
        @invocableVariable
        public String organizationNumber;
        @invocableVariable
        public String assignedResource;
        @invocableVariable
        public String description;
        @invocableVariable(label='REQUIRED- TIL for Tiltak')
        public String theme;
        @invocableVariable(label='ab0336 for "Midlertidig lønnstilskudd"')
        public String processingTheme;
        @invocableVariable(label='KONT_BRUK, term: Kontakt bruker')
        public String taskTypeCode;
        @invocableVariable(label='ae0034 - valid type for "Midlertidig lønnstilskudd"')
        public String processingType;
        @invocableVariable
        public String assignToUnitNumber;
        @invocableVariable(label='number of due days from created date')
        public Integer dueDays;
        @invocableVariable(label='[HOY, NORM, LAV]')
        public String priority;
        //@invocableVariable
        //public Boolean POST_AS_SYSTEM = true; //set post-as-system as default

        public NotificationOppgaveRequest() {
            this.requestType = null;
            this.message = null;
        }

        public NotificationOppgaveRequest(String requestType, Message__c message) {
            this.requestType = requestType;
            this.message = message;
        }
    }

    //### API WRAPPERS ###//
    //
    @testVisible
    private class OppgaveResponse {
        @testVisible
        private Long id;
    }
}
