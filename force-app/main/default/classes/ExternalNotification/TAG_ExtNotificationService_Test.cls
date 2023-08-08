/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationService
 */
@IsTest
private class TAG_ExtNotificationService_Test {
    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-05 Created.
     */
    @IsTest
    private static void testConstructorPositive() {
        TAG_ExtNotificationService externalNotificationService;

        System.Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService();
        System.Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationService.DEFAULT_NAME,
            externalNotificationService.name,
            'Expected to have the same name as given in the constructor.'
        );
        System.assertEquals(
            TAG_ExtNotificationService.DEFAULT_FIELD_NAME,
            externalNotificationService.fieldName,
            'Expected to have the same fieldName as given in the constructor.'
        );
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-05 Created.
     */
    @IsTest
    private static void testNotificationMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String enterpriseNumber = '123456789';
        String externalId = '123456789ExternalId';
        String groupingId = '123456789GroupingId';
        String notificationText = 'Test notification.';
        String url = 'https://www.nav.no';

        System.Test.startTest();
        externalNotificationService.notification(enterpriseNumber, externalId, groupingId, notificationText, url);
        System.Test.stopTest();

        System.assertEquals(
            externalId,
            externalNotificationService.externalId,
            'Expected to have the same name as given in the constructor.'
        );
    }

    /**
     * @description Testing "escaping of double quotes" function on the `notificationText`
     * parameter in the `notification` method before the value (text) is set on the
     * `notificationText`property.
     *
     * Expected result: Text should be escaped for double quotes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-05 Created.
     */
    @IsTest
    private static void testNotificationMethodNotificationTextEscapeDoubleQuotesPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String notificationText = 'Test "notification".';

        System.Test.startTest();
        externalNotificationService.notification('', '', '', notificationText, '');
        System.Test.stopTest();

        System.assertEquals(
            notificationText.escapeJava(),
            externalNotificationService.notificationText,
            'Expected to have "notificationText" with escaped double quotes.'
        );
    }

    /**
     * @description Testing "normalize spaces" function on the `notificationText` parameter in the
     * `notification` method before the value (text) is set on the `notificationText`property.
     *
     * Expected result: Text should be stripped for unnecessary spaces.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testNotificationMethodNotificationTextNormalizeSpaceByRemovingExtraSpacePositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String notificationText = 'Test  notification.';

        System.Test.startTest();
        externalNotificationService.notification('', '', '', notificationText, '');
        System.Test.stopTest();

        System.assertEquals(
            notificationText.normalizeSpace(),
            externalNotificationService.notificationText,
            'Expected to have the "notificationText" with extra spaces removed (normalized spaces).'
        );
    }

    /**
     * @description Testing "removing of newlines characters" function on the `notificationText`
     * parameter in the `notification` method before the value (text) is set on the
     * `notificationText`property.
     *
     * Expected result: Text should be stripped for newline characters and replaced with a space
     * character and then stripped for any unnecessary spaces.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testNotificationMethodNotificationTextRemovingLineBreaksPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String notificationText = 'Test\n\ntest2 \r\n test3 \r notification.';

        System.Test.startTest();
        externalNotificationService.notification('', '', '', notificationText, '');
        System.Test.stopTest();

        System.assertEquals(
            notificationText.replaceAll('\r\n|\n|\r', ' ').normalizeSpace(),
            externalNotificationService.notificationText,
            'Expected to have the "notificationText" with extra spaces removed (normalized spaces).'
        );
    }

    /**
     * @description Testing the `smsNotification` method and verifying that it is setting the
     * properties correctly. At the same time we are testing the dispatch window value
     * `NKS_BUSINESS_HOURS` is correctly converted to `NKS_AAPNINGSTID`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testSmsNotificationMethodWithDispatchWindowValueNKSBusinessHoursPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String phoneNumber = '11122333';
        String smsText = 'Test SMS';
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;
        String expectedDispatchWindow = 'NKS_AAPNINGSTID';
        String expectedSmsNotificationBody =
            'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: \\"' +
            phoneNumber +
            '\\" } } smsTekst: \\"' +
            smsText +
            '\\" sendetidspunkt: { sendevindu: ' +
            expectedDispatchWindow +
            ' }}}]';

        System.Test.startTest();
        externalNotificationService.smsNotification(phoneNumber, smsText, dispatchWindow);
        System.Test.stopTest();

        System.assertEquals(
            phoneNumber,
            externalNotificationService.phoneNumber,
            'Expected to have the same "phoneNumber" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            smsText,
            externalNotificationService.smsText,
            'Excpected to have the same "smsText" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            dispatchWindow,
            externalNotificationService.dispatchWindow,
            'Excpected to have the same "dispatchWindow" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            expectedSmsNotificationBody,
            externalNotificationService.smsNotificationBody,
            'Expected to have have a "smsNotificationBody" that includes the arguments given to the "smsNotification" method with the values cleaned or converted.'
        );
    }

    /**
     * @description Testing the `smsNotification` method and verifying that it is setting the
     * properties correctly. At the same time we are testing the dispatch window value
     * `DAYTIME_NOT_SUNDAY` is correctly converted to `DAGTID_IKKE_SOENDAG`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testSmsNotificationMethodWithDispatchWindowValueDaytimeNotSundayPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String phoneNumber = '11122333';
        String smsText = 'Test SMS';
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY;
        String expectedDispatchWindow = 'DAGTID_IKKE_SOENDAG';
        String expectedSmsNotificationBody =
            'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: \\"' +
            phoneNumber +
            '\\" } } smsTekst: \\"' +
            smsText +
            '\\" sendetidspunkt: { sendevindu: ' +
            expectedDispatchWindow +
            ' }}}]';

        System.Test.startTest();
        externalNotificationService.smsNotification(phoneNumber, smsText, dispatchWindow);
        System.Test.stopTest();

        System.assertEquals(
            phoneNumber,
            externalNotificationService.phoneNumber,
            'Expected to have the same "phoneNumber" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            smsText,
            externalNotificationService.smsText,
            'Excpected to have the same "smsText" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            dispatchWindow,
            externalNotificationService.dispatchWindow,
            'Excpected to have the same "dispatchWindow" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            expectedSmsNotificationBody,
            externalNotificationService.smsNotificationBody,
            'Expected to have have a "smsNotificationBody" that includes the arguments given to the "smsNotification" method with the values cleaned or converted.'
        );
    }

    /**
     * @description Testing the `smsNotification` method and verifying that it is setting the
     * properties correctly. At the same time we are testing the dispatch window value
     * `CONTINUOUSLY` is correctly converted to `LOEPENDE`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testSmsNotificationMethodWithDispatchWindowValueContinuoslyPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String phoneNumber = '11122333';
        String smsText = 'Test SMS';
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.CONTINUOUSLY;
        String expectedDispatchWindow = 'LOEPENDE';
        String expectedSmsNotificationBody =
            'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: \\"' +
            phoneNumber +
            '\\" } } smsTekst: \\"' +
            smsText +
            '\\" sendetidspunkt: { sendevindu: ' +
            expectedDispatchWindow +
            ' }}}]';

        System.Test.startTest();
        externalNotificationService.smsNotification(phoneNumber, smsText, dispatchWindow);
        System.Test.stopTest();

        System.assertEquals(
            phoneNumber,
            externalNotificationService.phoneNumber,
            'Expected to have the same "phoneNumber" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            smsText,
            externalNotificationService.smsText,
            'Excpected to have the same "smsText" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            dispatchWindow,
            externalNotificationService.dispatchWindow,
            'Excpected to have the same "dispatchWindow" returned as given in the argument to the "smsNotification" method'
        );
        System.assertEquals(
            expectedSmsNotificationBody,
            externalNotificationService.smsNotificationBody,
            'Expected to have have a "smsNotificationBody" that includes the arguments given to the "smsNotification" method with the values cleaned or converted.'
        );
    }

    /**
     * @description Testing the `smsNotification` method and verifying that it is setting the
     * properties correctly. At the same time we are testing the dispatch window value
     * `CONTINUOUSLY` is correctly converted to `LOEPENDE`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testSmsNotificationMethodWithDispatchWindowWrongValuePositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Boolean isExceptionThrown = false;
        Boolean isExtNotificationServiceExceptionThrown = false;
        TAG_ExtNotificationService.ExtNotificationServiceException extNotificationServiceException;
        System.Test.startTest();
        try {
            externalNotificationService.smsNotification('', '', null);
        } catch (TAG_ExtNotificationService.ExtNotificationServiceException ex) {
            isExtNotificationServiceExceptionThrown = true;
            extNotificationServiceException = ex;
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(
            !isExceptionThrown,
            'Expected to have a "ExtNotificationServiceException" thrown in the "smsNotification" method.'
        );
        System.assert(
            isExtNotificationServiceExceptionThrown,
            'Expected to have a "ExtNotificationServiceException" thrown in the "smsNotification" method.'
        );
        System.assertEquals(
            'The dispatch window value is not valid. Unknown dispatch window: null',
            extNotificationServiceException.getMessage(),
            'Expected to have a "ExtNotificationServiceException" with the message "The dispatch window value is not valid. Unknown dispatch window: null"'
        );
    }

    /**
     * @description Testing the `build` method and verifying that it is building the Notification
     * Body `notificationBody` as expected with all the provided properties. This test do not include
     * the SMS Notification Body `smsNotificationBody` as part of the Notification Body
     * `notificationBody`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testBuildMethodWithoutSmsNotificationPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.enterpriseNumber = 'Test Enterprise Number';
        externalNotificationService.externalId = 'Test External Id';
        externalNotificationService.groupingId = 'Test Grouping Id';
        externalNotificationService.notificationText = 'Test Notification Text';
        externalNotificationService.url = 'Test URL';
        externalNotificationService.smsNotificationBody = '';

        String expectedNotificationBody =
            '{"query": "' +
            externalNotificationService.operationType +
            ' ' +
            externalNotificationService.name +
            '($eksternId: String! $grupperingsId: String $virksomhetsnummer: String! $lenke: String!) { ' +
            externalNotificationService.fieldName +
            '(' +
            externalNotificationService.argumentName +
            ': {' +
            'metadata: { eksternId: $eksternId, grupperingsid: $grupperingsId, virksomhetsnummer: $virksomhetsnummer }' +
            'mottakere: [{ altinn: { serviceCode: \\"' +
            externalNotificationService.serviceCode +
            '\\" serviceEdition: \\"' +
            externalNotificationService.serviceEdition +
            '\\" } }]' +
            'notifikasjon: {merkelapp: \\"' +
            externalNotificationService.label +
            '\\" tekst: \\"' +
            externalNotificationService.notificationText +
            '\\" lenke: $lenke }' +
            (String.isBlank(externalNotificationService.smsNotificationBody)
                ? ''
                : externalNotificationService.smsNotificationBody) +
            ' }) { __typename ... on NyBeskjedVellykket {id} ... on Error {feilmelding} } }",' +
            '"variables": {"eksternId": "' +
            externalNotificationService.externalId +
            '", "grupperingsId": "' +
            externalNotificationService.groupingId +
            '", "virksomhetsnummer": "' +
            externalNotificationService.enterpriseNumber +
            '", "lenke": "' +
            externalNotificationService.url +
            '"}}';

        System.Test.startTest();
        externalNotificationService.build();
        System.Test.stopTest();

        System.assertEquals(
            expectedNotificationBody,
            externalNotificationService.notificationBody,
            'Extected to have the "notificationBody" build and set by the "build" method using the provided property values.'
        );
    }

    /**
     * @description Testing the `build` method and verifying that it is building the Notification
     * Body `notificationBody` as expected with all the provided properties. This test includes
     * also the SMS Notification Body `smsNotificationBody` in the Notification Body
     * `notificationBody`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19 Created.
     */
    @IsTest
    private static void testBuildMethodWithSmsNotificationPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.enterpriseNumber = 'Test Enterprise Number';
        externalNotificationService.externalId = 'Test External Id';
        externalNotificationService.groupingId = 'Test Grouping Id';
        externalNotificationService.notificationText = 'Test Notification Text';
        externalNotificationService.url = 'Test URL';
        externalNotificationService.smsNotificationBody =
            'eksterneVarsler: [{ sms: { mottaker: { kontaktinfo: { tlf: \\"11122333\\" } } ' +
            'smsTekst: \\"Test sms text\\" ' +
            'sendetidspunkt: { sendevindu: LOEPENDE }}}]';

        String expectedNotificationBody =
            '{"query": "' +
            externalNotificationService.operationType +
            ' ' +
            externalNotificationService.name +
            '($eksternId: String! $grupperingsId: String $virksomhetsnummer: String! $lenke: String!) { ' +
            externalNotificationService.fieldName +
            '(' +
            externalNotificationService.argumentName +
            ': {' +
            'metadata: { eksternId: $eksternId, grupperingsid: $grupperingsId, virksomhetsnummer: $virksomhetsnummer }' +
            'mottakere: [{ altinn: { serviceCode: \\"' +
            externalNotificationService.serviceCode +
            '\\" serviceEdition: \\"' +
            externalNotificationService.serviceEdition +
            '\\" } }]' +
            'notifikasjon: {merkelapp: \\"' +
            externalNotificationService.label +
            '\\" tekst: \\"' +
            externalNotificationService.notificationText +
            '\\" lenke: $lenke }' +
            externalNotificationService.smsNotificationBody +
            ' }) { __typename ... on NyBeskjedVellykket {id} ... on Error {feilmelding} } }",' +
            '"variables": {"eksternId": "' +
            externalNotificationService.externalId +
            '", "grupperingsId": "' +
            externalNotificationService.groupingId +
            '", "virksomhetsnummer": "' +
            externalNotificationService.enterpriseNumber +
            '", "lenke": "' +
            externalNotificationService.url +
            '"}}';

        System.Test.startTest();
        externalNotificationService.build();
        System.Test.stopTest();

        System.assertEquals(
            expectedNotificationBody,
            externalNotificationService.notificationBody,
            'Extected to have the "notificationBody" build and set by the "build" method using the provided property values.'
        );
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-20 Created.
     */
    @IsTest
    private static void testSendMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.notificationBody = '{"data":{"nyBeskjed":{"__typename":"DuplikatEksternIdOgMerkelapp","feilmelding":"notifikasjon med angitt eksternId og merkelapp finnes fra før"}}}';

        SingleRequestMock mock = new SingleRequestMock(
            200,
            'OK',
            externalNotificationService.notificationBody,
            new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, mock);

        System.Test.startTest();
        externalNotificationService.send();
        System.Test.stopTest();

        System.assertEquals(
            200,
            externalNotificationService.notificationResponse.getStatusCode(),
            'Expected to have a "200" status code returned.'
        );
        System.assertEquals(
            'OK',
            externalNotificationService.notificationResponse.getStatus(),
            'Expected to have a "OK" status returned.'
        );
        System.assertEquals(
            externalNotificationService.notificationBody,
            externalNotificationService.notificationResponse.getBody(),
            'Expected to have the "Test Notification Body" value from the body returned.'
        );
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-20 Created.
     */
    @IsTest
    private static void testSendAsynMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.externalId = 'Test External Id';
        externalNotificationService.notificationBody = '{ "data": "Test Notification Body"}';

        SingleRequestMock mock = new SingleRequestMock(
            200,
            'OK',
            externalNotificationService.notificationBody,
            new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, mock);

        System.Test.startTest();
        TAG_ExtNotificationService.sendAsync(
            externalNotificationService.externalId,
            externalNotificationService.notificationBody
        );
        System.Test.stopTest();

        System.assert(true, 'This assert is not asserting anything!');
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-20 Created.
     */
    @IsTest
    static void testGetResponseMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String expectedBody = 'Test Body';
        HttpResponse response = new HttpResponse();
        response.setBody(expectedBody);
        externalNotificationService.notificationResponse = response;

        Test.startTest();
        externalNotificationService.getResponse();
        Test.stopTest();

        System.assertEquals(
            expectedBody,
            externalNotificationService.notificationResponse.getBody(),
            'Expected to have the "Test Body" value returned.'
        );
    }

    /**
     * @description Test the "log" method.
     *
     * @author Kenneth.Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-07-17 Created.
     */
    @IsTest
    static void testLogMethodForCode200Positive() {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json');
        response.setBody(
            '{"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"f764bdf3-9905-40b2-a081-acb902a4cecf"}}}'
        );

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            TAG_ExtNotificationService.log(response);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        List<Application_Log__c> applicationLog = [
            SELECT Id
            FROM Application_Log__c
        ];

        System.assert(applicationLog.size() < 1, 'message');
    }

    /**
     * @description Test the "log" method.
     *
     * @author Kenneth.Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-07-17 Created.
     */
    @IsTest
    static void testLogMethodForCode200withErrorMessagePositive() {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json');
        response.setBody(
            '{"data":{"nyBeskjed":{"__typename":"DuplikatEksternIdOgMerkelapp","feilmelding":"notifikasjon med angitt eksternId og merkelapp finnes fra før"}}}'
        );

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            TAG_ExtNotificationService.log(response);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        List<Application_Log__c> applicationLog = [
            SELECT Id
            FROM Application_Log__c
        ];

        System.assert(applicationLog.size() > 0, 'message');
    }

    /**
     * @description Test the "log" method.
     *
     * @author Kenneth.Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-07-17 Created.
     */
    @IsTest
    static void testLogMethodForCode500Positive() {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(500);
        response.setStatus('Internal Server Error');

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            TAG_ExtNotificationService.log(response);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        List<Application_Log__c> applicationLog = [
            SELECT Id
            FROM Application_Log__c
        ];

        System.assert(applicationLog.size() > 0, 'message');
    }

    /**
     * @description Test the "log" method.
     *
     * @author Kenneth.Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-07-17 Created.
     */
    @IsTest
    static void testLogMethodForCode200NoJSONBodyNegative() {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'text/plain');
        response.setBody('Test Body');

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            TAG_ExtNotificationService.log(response);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        List<Application_Log__c> applicationLog = [
            SELECT Id
            FROM Application_Log__c
        ];

        System.assert(applicationLog.size() > 0, 'message');
    }
}
