/**
 * @description This is the
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 *
 * @see [License](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/LICENSE)
 * @see [Github](https://github.com/navikt/crm-arbeidsgiver-dialog)
 *
 * @group TAG External Notification
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public inherited sharing class TAG_ExtNotificationService implements TAG_IExtNotificationService {
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_NAME = 'OpprettNyBeskjed';
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_FIELD_NAME = 'nyBeskjed';
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_ARGUMENT_NAME = 'nyBeskjed';
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_OPERATION_TYPE = 'mutation';
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_SERVICE_CODE = '5516';
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_SERVICE_EDITION = '1';
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public static final String DEFAULT_LABEL = 'Lønnstilskudd';

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String name { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String fieldName { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String argumentName { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String operationType { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String serviceCode { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String serviceEdition { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String label { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String enterpriseNumber { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String externalId { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String groupingId { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String notificationText { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String url { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String phoneNumber { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String smsText { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public TAG_DispatchWindow_e dispatchWindow { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String smsNotificationBody { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public String notificationBody { get; private set; }
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    @TestVisible
    public HttpResponse notificationResponse { get; private set; }
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
    @SuppressWarnings('PMD.ExcessiveParameterList')
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
        this.notificationText = notificationText.replaceAll('\r\n|\n|\r', ' ').normalizeSpace().escapeJava();
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
        this.smsText = smsText.replaceAll('\r\n|\n|\r', ' ').normalizeSpace().escapeJava();
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
                throw new ExtNotificationServiceException(
                    'The dispatch window value is not valid. Unknown dispatch window: ' + this.dispatchWindow
                );
            }
        }

        this.smsNotificationBody =
            'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: \\"' +
            this.phoneNumber +
            '\\" } } smsTekst: \\"' +
            this.smsText +
            '\\" sendetidspunkt: { sendevindu: ' +
            dispatchWindowConverted +
            ' }}}]';

        return this;
    }

    /**
     * @description
     *
     * String body2 =
     * '{"query": "mutation OpprettNyBeskjed($eksternId: String! $virksomhetsnummer: String! $lenke: String!) { nyBeskjed(nyBeskjed: {' +
     * 'metadata: { eksternId: $eksternId, virksomhetsnummer: $virksomhetsnummer }' +
     * 'mottakere: [{ altinn: { serviceCode: \\"5516\\" serviceEdition: \\"1\\" } }]' +
     * 'notifikasjon: {merkelapp: \\"Lønnstilskudd\\" tekst: \\"Du har mottatt en ny melding fra NAV i dialogen.\\" lenke: $lenke }' +
     * 'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: \\"95062297\\" } } smsTekst: \\"Test melding!\\" sendetidspunkt: { sendevindu: LOEPENDE }}}]' +
     * ' }) { __typename ... on NyBeskjedVellykket {id} ... on Error {feilmelding} } }",' +
     * '"variables": {"eksternId": "12345569", "virksomhetsnummer":"910825526", "lenke": "https://dev.nav.no/melding/12345"}}';
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
            '"variables": {"eksternId": "' +
            this.externalId +
            '", "grupperingsId": "' +
            this.groupingId +
            '", "virksomhetsnummer": "' +
            this.enterpriseNumber +
            '", "lenke": "' +
            this.url +
            '"}}';

        return this;
    }

    @TestVisible
    private static HttpResponse callout(String externalId, String notificationBody) {
        ApiController apiCtrl = new ApiController();

        apiCtrl.initRequest('ArbeidsgiverNotifikasjonAPI', 'POST_NOTIFICATION');
        apiCtrl.setSystemContext()
            .addServiceAuthHeader('ArbeidsgiverNotifikasjon')
            .addHeader('Content-Type', 'application/json')
            .addHeader('X-Correlation-ID', 'TSA-' + externalId)
            .setBody(notificationBody);
        apiCtrl.doCallout();

        HttpResponse notificationResponse = apiCtrl.getResponse();
        log(notificationResponse);

        return notificationResponse;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     */
    public TAG_ExtNotificationService send() {
        this.notificationResponse = callout(this.externalId, this.notificationBody);

        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-26 Created.
     *
     * @param notificationService
     */
    @future(callout=true)
    public static void sendAsync(String externalId, String notificationBody) {
        callout(externalId, notificationBody);
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
     * @description Log the response from the callout
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-26 Created.
     *
     * @param response
     */
    @TestVisible
    private static void log(HttpResponse response) {
        LoggerUtility logger = new LoggerUtility('ExtNotificationService');

        if (response.getStatusCode() != 200) {
            String errorMessage =
                'Error: ' +
                response.getStatusCode() +
                ' ' +
                response.getStatus() +
                ' Body: ' +
                response.getBody();

            System.debug(LoggingLevel.ERROR, 'HttpResponse: ' + errorMessage);
            logger.error(errorMessage, null, CRM_ApplicationDomain.Domain.POAB);
        } else if (response.getStatusCode() == 200) {
            String errorMessage;

            try {
                JSONParser parser = JSON.createParser(response.getBody());
                while (parser.nextToken() != null) {
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'feilmelding') {
                        parser.nextToken();
                        errorMessage = 'HttpResponse: ' + parser.getText();
                    }
                }
            } catch (Exception ex) {
                errorMessage = 'Not valid JSON: ' + ex.getMessage() + ' \nResponse body: ' + response.getBody();
            }

            if (String.isNotBlank(errorMessage)) {
                logger.error(errorMessage, null, CRM_ApplicationDomain.Domain.POAB);
            }
        }

        logger.publish();
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
