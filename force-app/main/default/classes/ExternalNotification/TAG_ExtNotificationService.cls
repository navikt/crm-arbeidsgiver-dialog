/**
 * @description This is the
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 *
 * @group TAG External Notification
 */
public inherited sharing class TAG_ExtNotificationService {
    private static final String DEFAULT_NAME = 'OpprettNyBeskjed';
    private static final String DEFAULT_FIELD_NAME = 'nyBeskjed';
    private static final String DEFAULT_ARGUMENT_NAME = 'nyBeskjed';
    private static final String DEFAULT_OPERATION_TYPE = 'mutation';
    private static final String DEFAULT_SERVICE_CODE = '5516';
    private static final String DEFAULT_SERVICE_EDITION = '1';
    private static final String DEFAULT_LABEL = 'Lønnstilskudd';

    private String name;
    private String fieldName;
    private String argumentName;
    private String operationType;
    private String serviceCode;
    private String serviceEdition;
    private String label;
    private String enterpriseNumber;
    private String externalId;
    private String groupingId;
    private String notificationText;
    private String url;
    private String phoneNumber;
    private String smsText;
    private TAG_DispatchWindow_e dispatchWindow;
    private String smsNotificationBody;
    private String notificationBody;
    private HttpResponse notificationResponse;
    //private String query;

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public TAG_ExtNotificationService() {
        this(DEFAULT_NAME, DEFAULT_OPERATION_TYPE);
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @param name
     * @param operationType
     */
    public TAG_ExtNotificationService(String name, String operationType) {
        this.name = name;
        this.operationType = operationType;
        this.fieldName = DEFAULT_FIELD_NAME;
        this.argumentName = DEFAULT_ARGUMENT_NAME;
        this.serviceCode = DEFAULT_SERVICE_CODE;
        this.serviceEdition = DEFAULT_SERVICE_EDITION;
        this.label = DEFAULT_LABEL;
        this.smsNotificationBody = '';
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public TAG_ExtNotificationService notification(
        String enterpriseNumber,
        String externalId,
        String groupingId,
        String notificationText,
        String url
    ) {
        this.enterpriseNumber = enterpriseNumber;
        this.externalId = externalId;
        this.groupingId = groupingId;
        this.notificationText = notificationText;
        this.url = url;

        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService smsNotification(
        String phoneNumber,
        String smsText,
        TAG_DispatchWindow_e dispatchWindow
    ) {
        this.phoneNumber = phoneNumber;
        this.smsText = smsText;
        this.dispatchWindow = dispatchWindow;

        String dispatchWindowConverted;

        switch on this.dispatchWindow {
            when NKS_BUSINESS_HOURS {
                dispatchWindowConverted = 'NKS_AAPNINGSTID';
            }
            when DAYTIME_NOT_SUNDAY {
                dispatchWindowConverted = 'DAGTID_IKKE_SOENDAG';
            }
            when CONTINUOUSLY {
                dispatchWindowConverted = 'LOEPENDE';
            }
            when else {
                throw new ExtNotificationServiceException('Unknown dispatch window: ' + this.dispatchWindow);
            }
        }

        this.smsNotificationBody =
            'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: ' +
            this.phoneNumber +
            ' } } smsTekst: \\"' +
            this.smsText +
            '\\" sendetidspunkt: { sendevindu: ' +
            this.dispatchWindow +
            ' }}}]';

        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public TAG_ExtNotificationService build() {
        this.notificationBody =
            '{"query": "' +
            this.operationType +
            ' ' +
            this.name +
            '($eksternId: String! $grupperingsId: String $virksomhetsnummer: String! $lenke: String!) { ' +
            this.fieldName +
            '(' +
            this.argumentName +
            ': {' +
            'metadata: { eksternId: $eksternId, grupperingsid: $grupperingsId, virksomhetsnummer: $virksomhetsnummer }' +
            'mottakere: [{ altinn: { serviceCode: \\"' +
            this.serviceCode +
            '\\" serviceEdition: \\"' +
            this.serviceEdition +
            '\\" } }]' +
            'notifikasjon: {merkelapp: \\"' +
            this.label +
            '\\" tekst: \\"' +
            this.notificationText +
            '\\" lenke: $lenke }' +
            (String.isBlank(this.smsNotificationBody) ? '' : this.smsNotificationBody) +
            ' }) { __typename ... on NyBeskjedVellykket {id} ... on Error {feilmelding} } }",' +
            '"variables": {\\"eksternId\\": \\"' +
            this.externalId +
            '\\", \\"grupperingsId\\": \\"' +
            this.groupingId +
            '\\", \\"virksomhetsnummer\\":\\"' +
            this.enterpriseNumber +
            '\\", \\"lenke\\": \\"' +
            this.url +
            '\\"}}';

        System.debug('Generated Body: ' + this.notificationBody);

        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public TAG_ExtNotificationService send() {
        ApiController apiCtrl = new ApiController();

        apiCtrl.initRequest('ArbeidsgiverNotifikasjonAPI', 'POST_NOTIFICATION');
        apiCtrl.setSystemContext()
            .addServiceAuthHeader('ArbeidsgiverNotifikasjon')
            .addHeader('Content-Type', 'application/json')
            .addHeader('X-Correlation-ID', 'TSA-' + this.externalId)
            .setBody(this.notificationBody);
        apiCtrl.doCallout();

        this.notificationResponse = apiCtrl.getResponse();
        System.debug('Response: ' + this.notificationResponse);
        System.debug('Returned Body: ' + this.notificationResponse.getBody());
        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public HttpResponse getResponse() {
        return this.notificationResponse;
    }

    /**
     * @description SMS Notification Exception that can
     * be used inside this class our outside for testing purposes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-07 Created.
     */
    public class ExtNotificationServiceException extends Exception {
    }
}
