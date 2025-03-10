public without sharing class EmployerNotificationOppgaveService {
    private LoggerUtility logger = new LoggerUtility('Oppgave');
    private String transactionId;
    public EmployerNotificationOppgaveService() {
    }

    //Performs callout to oppgave API to create a new task
    public HttpResponse postTask(EmployerNotificationOppgaveWrapper request) {
        //Static context requires own instance of the API controller
        ApiController apiCtrl = new ApiController();
        Map<String, String> httpHeaders = new Map<String, String>{
            'Content-Type' => 'application/json',
            'accept' => 'application/json'
        };
        apiCtrl.setSystemContext();
        apiCtrl.initRequest('Oppgave_API', 'POST_CREATE_OPPGAVE');
        apiCtrl.addServiceAuthHeader('Oppgave');
        apiCtrl.setHeaders(httpHeaders);
        apiCtrl.setBody(JSON.serialize(request, true));

        addXCorrelation(apiCtrl);
        apiCtrl.doCallout();
        return apiCtrl.getResponse();
    }

    // @description: Adds the required X-Correlation header to the API request
    private void addXCorrelation(ApiController apiCtrl) {
        String uuid = getUUID();
        apiCtrl.addHeader('X-Correlation-ID', uuid); //Adds the unique transaction ID to the request
        this.transactionId = uuid;
    }

    private static String getUUID() {
        Blob b = Crypto.GenerateAESKey(128);
        String h = EncodingUtil.ConvertTohex(b);
        String guid =
            h.SubString(0, 8) +
            '-' +
            h.SubString(8, 12) +
            '-' +
            h.SubString(12, 16) +
            '-' +
            h.SubString(16, 20) +
            '-' +
            h.substring(20);
        return guid;
    }

    // Returns UUID of the last API transaction initiated.
    public String getTransactionId() {
        return this.transactionId;
    }

    private class MissingParameterException extends Exception {
    }
}
