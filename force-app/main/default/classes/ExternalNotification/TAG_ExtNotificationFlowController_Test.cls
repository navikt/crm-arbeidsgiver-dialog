/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 *
 * @see [License](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/LICENSE)
 * @see [Github](https://github.com/navikt/crm-arbeidsgiver-dialog)
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationService
 */
@IsTest
private class TAG_ExtNotificationFlowController_Test {
    /**
     * @description Testing the `getDispatchWindowEnum` method with correct value.
     * Testing with value: `String 'NKS_BUSINESS_HOURS'`
     * Expected result: `TAG_DispatchWindow_e.NKS_BUSINESS_HOURS`
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-13 Created.
     */
    @IsTest
    private static void testGetDispatchWindowEnumNKSBusinessHoursPositive() {
        String dispatchWindow = 'NKS_BUSINESS_HOURS';

        System.Test.startTest();
        TAG_DispatchWindow_e dispatchWindowEnum = TAG_ExtNotificationFlowController.getDispatchWindowEnum(
            dispatchWindow
        );
        System.Test.stopTest();

        System.assertEquals(
            TAG_DispatchWindow_e.NKS_BUSINESS_HOURS,
            dispatchWindowEnum,
            'Should be "NKS_BUSINESS_HOURS".'
        );
    }

    /**
     * @description Testing the `getDispatchWindowEnum` method with correct value.
     * Testing with value: `String 'DAYTIME_NOT_SUNDAY'`
     * Expected result: `TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY`
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-13 Created.
     */
    @IsTest
    private static void testGetDispatchWindowEnumDaytimeNotSundayPositive() {
        String dispatchWindow = 'DAYTIME_NOT_SUNDAY';

        System.Test.startTest();
        TAG_DispatchWindow_e dispatchWindowEnum = TAG_ExtNotificationFlowController.getDispatchWindowEnum(
            dispatchWindow
        );
        System.Test.stopTest();

        System.assertEquals(
            TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY,
            dispatchWindowEnum,
            'Should be "DAYTIME_NOT_SUNDAY".'
        );
    }

    /**
     * @description Testing the `getDispatchWindowEnum` method with correct value.
     * Testing with value: `String 'CONTINUOUSLY'`
     * Expected result: `TAG_DispatchWindow_e.CONTINUOUSLY`
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-13 Created.
     */
    @IsTest
    private static void testGetDispatchWindowEnumContinuoulyPositive() {
        String dispatchWindow = 'CONTINUOUSLY';

        System.Test.startTest();
        TAG_DispatchWindow_e dispatchWindowEnum = TAG_ExtNotificationFlowController.getDispatchWindowEnum(
            dispatchWindow
        );
        System.Test.stopTest();

        System.assertEquals(TAG_DispatchWindow_e.CONTINUOUSLY, dispatchWindowEnum, 'Should be "CONTINUOUSLY".');
    }

    /**
     * @description Testing the `getDispatchWindowEnum` method with wrong value.
     * Testing with value: `String 'WRONG_VALUE'`
     * Expected result: `null`
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-13 Created.
     */
    @IsTest
    private static void testGetDispatchWindowEnumWrongValueNegative() {
        String dispatchWindow = 'WRONG_VALUE';

        System.Test.startTest();
        TAG_DispatchWindow_e dispatchWindowEnum = TAG_ExtNotificationFlowController.getDispatchWindowEnum(
            dispatchWindow
        );
        System.Test.stopTest();

        System.assertEquals(null, dispatchWindowEnum, 'Should be "null".');
    }

    /**
     * @description Testing the `createNotification` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-05 Created.
     */
    @IsTest
    static void testNotificationMethodPositive() {
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.enterpriseNumber = 'String-TestEnterprise';
        request.externalId = 'String-TestExternalId';
        request.groupingId = 'String-TestGroupingId';
        request.notificationText = 'String-TestNotificationText';
        request.url = 'String-TestURL';

        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService()
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.createNotification(mockExtNotificationService, request);
        System.Test.stopTest();

        System.debug(
            LoggingLevel.DEBUG,
            'mockExtNotificationService: ' + JSON.SerializePretty(mockExtNotificationService)
        );

        System.assertEquals(
            request.enterpriseNumber,
            mockExtNotificationService.enterpriseNumber,
            'Expected to have the same "enterprise number" returned.'
        );
        System.assertEquals(
            request.externalId,
            mockExtNotificationService.externalId,
            'Expected to have the same "external Id" returned.'
        );
        System.assertEquals(
            request.groupingId,
            mockExtNotificationService.groupingId,
            'Expected to have the same "grouping Id" returned.'
        );
        System.assertEquals(
            request.notificationText,
            mockExtNotificationService.notificationText,
            'Expected to have the same "notification Text" returned.'
        );
        System.assertEquals(request.url, mockExtNotificationService.url, 'Expected to have the same "url" returned.');
    }

    /**
     * @description Testing the `addSMSNotification` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-13 Created.
     */
    @IsTest
    static void testAddSMSNotificationMethodPositive() {
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.phoneNumber = 'Test-PhoneNumber';
        request.smsText = 'Test-SMSText';
        request.dispatchWindow = 'NKS_BUSINESS_HOURS';

        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService()
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.addSMSNotification(mockExtNotificationService, request);
        System.Test.stopTest();

        System.assertEquals(
            request.phoneNumber,
            mockExtNotificationService.phoneNumber,
            'Expected to have the same "phone number" returned.'
        );
        System.assertEquals(
            request.smsText,
            mockExtNotificationService.smsText,
            'Expected to have the same "sms text" returned.'
        );
        System.assertEquals(
            request.dispatchWindow,
            mockExtNotificationService.dispatchWindow.name(),
            'Expected to have the same "dispatch window" returned.'
        );
    }

    /**
     * @description Testing the `addSMSNotification` method with wrong dispatch window value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-13 Created.
     */
    @IsTest
    static void testAddSMSNotificationMethodNegative() {
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.phoneNumber = 'Test-PhoneNumber';
        request.smsText = 'Test-SMSText';
        request.dispatchWindow = 'WRONG_VALUE';

        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService()
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.addSMSNotification(mockExtNotificationService, request);
        System.Test.stopTest();

        System.assertEquals(
            request.phoneNumber,
            mockExtNotificationService.phoneNumber,
            'Expected to have the same "phone number" returned.'
        );
        System.assertEquals(
            request.smsText,
            mockExtNotificationService.smsText,
            'Expected to have the same "sms text" returned.'
        );
        System.assertEquals(
            null,
            mockExtNotificationService.dispatchWindow?.name(),
            'Expected to have the same "null" returned.'
        );
    }

    /**
     * @description Testing the `buildAndSendExternalNotification` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-14 Created.
     */
    @IsTest
    static void testBuildAndSendExternalNotificationMethodPositive() {
        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService()
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.buildAndSendExternalNotification(mockExtNotificationService);
        System.Test.stopTest();

        System.assertNotEquals(
            null,
            mockExtNotificationService.notificationBody,
            'Expected to have a "notification body" returned.'
        );
        System.assertEquals(
            'TestNotificationBody',
            mockExtNotificationService.notificationBody,
            'Expected to have "notification body" return the value: "TestNotificationBody"'
        );

        Integer expectedStatusCode = TAG_MockExtNotificationService.DEFAULT_STATUS_CODE;
        String expectedBody = TAG_MockExtNotificationService.DEFAULT_BODY;
        System.assertEquals(
            expectedStatusCode,
            mockExtNotificationService.notificationResponse.getStatusCode(),
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expectedBody,
            mockExtNotificationService.notificationResponse.getBody(),
            'Expected body "' + expectedBody + '" to be returned.'
        );
    }

    /**
     * @description Testing the `getResponseAndCreateResults` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-15 Created.
     */
    @IsTest
    static void testGetResponseAndCreateResultsWithCode200Positive() {
        String body = '{"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"f764bdf3-9905-40b2-a081-acb902a4cecf", "eksterneVarsler":{"id":"f764bdf3-9905-40b2-a081-acb809a4cccf"}}}}';
        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService(body)
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.ExtNotificationResult result = TAG_ExtNotificationFlowController.getResponseAndCreateResults(
            mockExtNotificationService
        );
        System.Test.stopTest();

        Integer expectedStatusCode = TAG_MockExtNotificationService.DEFAULT_STATUS_CODE;
        String expextedTypeName = 'NyBeskjedVellykket';
        String expectedErrorMessage = null;
        String expectedNotificationId = 'f764bdf3-9905-40b2-a081-acb902a4cecf';
        String expextedExternalNotificationId = 'f764bdf3-9905-40b2-a081-acb809a4cccf';
        System.assertEquals(
            expectedStatusCode,
            result.statusCode,
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expextedTypeName,
            result.typeName,
            'Expected type name "' + expextedTypeName + '" to be returned.'
        );
        System.assertEquals(
            expectedErrorMessage,
            result.errorMessage,
            'Expected error message "' + expectedErrorMessage + '" to be returned.'
        );
        System.assertEquals(
            expectedNotificationId,
            result.notificationId,
            'Expected notification id "' + expectedNotificationId + '" to be returned.'
        );
        System.assertEquals(
            expextedExternalNotificationId,
            result.externalNotificationId,
            'Expected external notification id "' + expextedExternalNotificationId + '" to be returned.'
        );
    }

    /**
     * @description Testing the `getResponseAndCreateResults` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-15 Created.
     */
    @IsTest
    static void testGetResponseAndCreateResultsWithCode500Positive() {
        Integer expectedStatusCode = 500;
        String status = 'Internal Server Error';
        String body = '';
        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService(expectedStatusCode, status, body)
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.ExtNotificationResult result = TAG_ExtNotificationFlowController.getResponseAndCreateResults(
            mockExtNotificationService
        );
        System.Test.stopTest();

        String expextedTypeName = null;
        String expectedErrorMessage = status;
        String expectedNotificationId = null;
        String expextedExternalNotificationId = null;
        System.assertEquals(
            expectedStatusCode,
            result.statusCode,
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expextedTypeName,
            result.typeName,
            'Expected type name "' + expextedTypeName + '" to be returned.'
        );
        System.assertEquals(
            expectedErrorMessage,
            result.errorMessage,
            'Expected error message "' + expectedErrorMessage + '" to be returned.'
        );
        System.assertEquals(
            expectedNotificationId,
            result.notificationId,
            'Expected notification id "' + expectedNotificationId + '" to be returned.'
        );
        System.assertEquals(
            expextedExternalNotificationId,
            result.externalNotificationId,
            'Expected external notification id "' + expextedExternalNotificationId + '" to be returned.'
        );
    }

    /**
     * @description Testing the `getResponseAndCreateResults` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-15 Created.
     */
    @IsTest
    static void testGetResponseAndCreateResultsWithCode500WithBodyPositive() {
        Integer expectedStatusCode = 500;
        String status = 'Internal Server Error';
        String body = 'Test Body';
        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService(expectedStatusCode, status, body)
        );

        System.Test.startTest();
        TAG_ExtNotificationFlowController.ExtNotificationResult result = TAG_ExtNotificationFlowController.getResponseAndCreateResults(
            mockExtNotificationService
        );
        System.Test.stopTest();

        String expextedTypeName = null;
        String expectedErrorMessage = status + ' ' + body;
        String expectedNotificationId = null;
        String expextedExternalNotificationId = null;
        System.assertEquals(
            expectedStatusCode,
            result.statusCode,
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expextedTypeName,
            result.typeName,
            'Expected type name "' + expextedTypeName + '" to be returned.'
        );
        System.assertEquals(
            expectedErrorMessage,
            result.errorMessage,
            'Expected error message "' + expectedErrorMessage + '" to be returned.'
        );
        System.assertEquals(
            expectedNotificationId,
            result.notificationId,
            'Expected notification id "' + expectedNotificationId + '" to be returned.'
        );
        System.assertEquals(
            expextedExternalNotificationId,
            result.externalNotificationId,
            'Expected external notification id "' + expextedExternalNotificationId + '" to be returned.'
        );
    }

    /**
     * @description Testing
     *
     * @author Andre Colle <andre.colle@nav.no>
     * @since 2023-05-16 Created.
     */
    @isTest
    static void testSendSMSNotificationDWHoursUsingSynchronousVersion() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.sendAsync = false;
        request.enterpriseNumber = 'TestEnterprise';
        request.externalId = 'TestExternalId';
        request.groupingId = 'TestGroupingId';
        request.notificationText = 'TestNotificationText';
        request.url = 'TestURL';
        request.sendSms = true;
        request.phoneNumber = 'TestPhoneNumber';
        request.smsText = 'TestSMS';
        request.dispatchWindow = 'NKS_BUSINESS_HOURS';
        requests.add(request);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results = TAG_ExtNotificationFlowController.sendExternalNotification(
            requests
        );
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertEquals('NyBeskjedVellykket', results[0].typeName);
        System.assertEquals(null, results[0].errorMessage);
        System.assertEquals('f764bdf3-9905-40b2-a081-acb902a4cecf', results[0].notificationId);
        System.assertEquals('f764bdf3-9905-40b2-a081-acb809a4cccf', results[0].externalNotificationId);
    }

    /**
     * @description Testing
     *
     * @author Andre Colle <andre.colle@nav.no>
     * @since 2023-05-16 Created.
     */
    @isTest
    static void testSendSMSNotificationDWSundayUsingSynchronousVersion() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.sendAsync = false;
        request.enterpriseNumber = 'TestEnterprise1';
        request.externalId = 'TestExternalId1';
        request.groupingId = 'TestGroupingId1';
        request.notificationText = 'TestNotificationText1';
        request.url = 'TestURL1';
        request.sendSms = true;
        request.phoneNumber = 'TestPhoneNumber1';
        request.smsText = 'TestSMS1';
        request.dispatchWindow = 'DAYTIME_NOT_SUNDAY';
        requests.add(request);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results = TAG_ExtNotificationFlowController.sendExternalNotification(
            requests
        );
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertEquals('NyBeskjedVellykket', results[0].typeName);
        System.assertEquals(null, results[0].errorMessage);
        System.assertEquals('f764bdf3-9905-40b2-a081-acb902a4cecf', results[0].notificationId);
        System.assertEquals('f764bdf3-9905-40b2-a081-acb809a4cccf', results[0].externalNotificationId);
    }

    /**
     * @description Testing
     *
     * @author Andre Colle <andre.colle@nav.no>
     * @since 2023-05-16 Created.
     */
    @isTest
    static void testSendSMSNotificationDWContinuouslyUsingSynchronousVersion() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.sendAsync = false;
        request.enterpriseNumber = 'TestEnterprise2';
        request.externalId = 'TestExternalId2';
        request.groupingId = 'TestGroupingId2';
        request.notificationText = 'TestNotificationText2';
        request.url = 'TestURL2';
        request.sendSms = true;
        request.phoneNumber = 'TestPhoneNumber2';
        request.smsText = 'TestSMS2';
        request.dispatchWindow = 'CONTINUOUSLY';
        requests.add(request);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results = TAG_ExtNotificationFlowController.sendExternalNotification(
            requests
        );
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertEquals('NyBeskjedVellykket', results[0].typeName);
        System.assertEquals(null, results[0].errorMessage);
        System.assertEquals('f764bdf3-9905-40b2-a081-acb902a4cecf', results[0].notificationId);
        System.assertEquals('f764bdf3-9905-40b2-a081-acb809a4cccf', results[0].externalNotificationId);
    }

    /**
     * @description Testing
     *
     * @author Andre Colle <andre.colle@nav.no>
     * @since 2023-05-16 Created.
     */
    @isTest
    static void testSendSMSNotificationDWNullUsingSynchronousVersion() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.sendAsync = false;
        request.enterpriseNumber = 'TestEnterprise3';
        request.externalId = 'TestExternalId3';
        request.groupingId = 'TestGroupingId3';
        request.notificationText = 'TestNotificationText3';
        request.sendSms = true;
        request.url = 'TestURL3';
        request.phoneNumber = 'TestPhoneNumber3';
        request.smsText = 'TestSMS3';
        request.dispatchWindow = 'Test';
        requests.add(request);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Boolean isExceptionThrown = false;
        Boolean isExtNotificationServiceExceptionThrown = false;
        TAG_ExtNotificationService.ExtNotificationServiceException extNotificationServiceException;
        Test.startTest();
        try {
            List<TAG_ExtNotificationFlowController.ExtNotificationResult> results = TAG_ExtNotificationFlowController.sendExternalNotification(
                requests
            );
        } catch (TAG_ExtNotificationService.ExtNotificationServiceException ex) {
            isExtNotificationServiceExceptionThrown = true;
            extNotificationServiceException = ex;
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        Test.stopTest();

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
     * @description Testing the `buildAndSendExternalNotificationAsync` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-08-07 Created.
     */
    @IsTest
    static void testBuildAndSendExternalNotificationAsyncMethodPositive() {
        TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
            TAG_ExtNotificationService.class,
            new TAG_MockExtNotificationService()
        );

        SingleRequestMock mock = new SingleRequestMock(
            200,
            'OK',
            '{ "data": "Test Notification Body"}',
            new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, mock);

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            TAG_ExtNotificationFlowController.buildAndSendExternalNotificationAsync(mockExtNotificationService);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');
    }

    /**
     * @description Testing the `buildAndSendExternalNotification` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-14 Created.
     */
    @IsTest
    static void testSendExternalNotificationMethodUsingAsynchronousVersionPositive() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        request.sendAsync = true;
        request.enterpriseNumber = 'TestEnterprise';
        request.externalId = 'TestExternalId';
        request.groupingId = 'TestGroupingId';
        request.notificationText = 'TestNotificationText';
        request.url = 'TestURL';
        request.sendSms = true;
        request.phoneNumber = 'TestPhoneNumber';
        request.smsText = 'TestSMS';
        request.dispatchWindow = 'NKS_BUSINESS_HOURS';
        requests.add(request);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results;
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            results = TAG_ExtNotificationFlowController.sendExternalNotification(requests);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        System.assertEquals(1, results.size(), 'Expected to have 1 result.');
        System.assert(results[0].success, 'Expected to have a success result.');
        System.assert(results[0].sentAsync, 'Expected to have a success result.');
    }

    /**
     * @description Testing the `buildAndSendExternalNotification` method with correct value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-14 Created.
     */
    @IsTest
    static void testSendExternalNotificationMethodNegative() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();

        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results;
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            results = TAG_ExtNotificationFlowController.sendExternalNotification(requests);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        System.assertEquals(1, results.size(), 'Expected to have 1 result.');
        System.assert(!results[0].success, 'Expected to have a none success result.');
        System.assertEquals(
            results[0].errorMessage,
            TAG_ExtNotificationFlowController.ERROR_MISSING_REQUEST,
            'Expected to have a success result.'
        );
    }

    /**
     * @description Testing the `sendExternalNotification` method with multiple requests
     * to test for correct bulkification.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-08-07 Created.
     */
    @IsTest
    static void testSendExternalNotificationMethodeWithBulkRequestsPositive() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();

        Integer length = 10;
        for (Integer i = 0; i < length; i++) {
            TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
            request.sendAsync = false;
            request.enterpriseNumber = 'TestEnterprise-' + i;
            request.externalId = 'TestExternalId-' + i;
            request.groupingId = 'TestGroupingId-' + i;
            request.notificationText = 'TestNotificationText-' + i;
            request.sendSms = true;
            request.url = 'TestURL-' + i;
            request.phoneNumber = 'TestPhoneNumber-' + i;
            request.smsText = 'TestSMS-' + i;
            request.dispatchWindow = 'CONTINUOUSLY';
            requests.add(request);
            System.debug(LoggingLevel.DEBUG, 'request: ' + request);
        }

        SingleRequestMock mock = new SingleRequestMock(
            200,
            'OK',
            '{"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"TestId"}}}',
            new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, mock);

        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results;
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            results = TAG_ExtNotificationFlowController.sendExternalNotification(requests);
        } catch (Exception ex) {
            System.debug('Exception Type Name: ' + ex.getTypeName());
            System.debug('Exception Cause: ' + ex.getCause());
            System.debug('Exception Message: ' + ex.getMessage());
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        System.assertEquals(requests.size(), results.size(), 'Expected to have ' + requests.size() + ' results.');

        Integer index = 0;
        for (TAG_ExtNotificationFlowController.ExtNotificationResult result : results) {
            System.assert(result.success, 'Expected to have a success result for request: ' + index + '.');

            System.assertEquals(
                'NyBeskjedVellykket',
                result.typeName,
                'Expected to have a "typeName" returned with the value: "NyBeskjedVellykket" for request: ' +
                    index +
                    '.'
            );

            System.assertEquals(
                'TestId',
                result.notificationId,
                'Expected to have a "notificationId" returned with the value: "TestId" for request: ' + index + '.'
            );
            index++;
        }
    }

    /**
     * @description Testing the `sendExternalNotification` method with empty requests
     * to test for handling null in various conditions.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-08-14 Created.
     */
    @IsTest
    static void testSendExternalNotificationMethodWithEmptyRequestNegative() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
        requests.add(request);

        SingleRequestMock mock = new SingleRequestMock(
            200,
            'OK',
            '{"data":"Test Notification Body"}',
            new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, mock);

        List<TAG_ExtNotificationFlowController.ExtNotificationResult> results;
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            results = TAG_ExtNotificationFlowController.sendExternalNotification(requests);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.assert(!isExceptionThrown, 'Expected to have a no exception thrown.');

        System.assertEquals(requests.size(), results.size(), 'Expected to have ' + requests.size() + ' results.');

        System.assert(!results[0].success, 'Expected to have a unsuccess result.');

        String errorMessage = 'The JSON body is not valid! - System.TypeException: Invalid conversion from runtime type String to Map<String,ANY>';
        System.assertEquals(
            errorMessage,
            results[0].errorMessage,
            'Expected to have a "errorMessage" returned with the value: "' + errorMessage + '".'
        );
    }
}
