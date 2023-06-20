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
        TAG_ExtNotificationService extNotificationService = (TAG_ExtNotificationService) TAG_ExtNotificationFlowController.createNotification(
            mockExtNotificationService,
            request
        );
        System.Test.stopTest();

        System.assertEquals(
            request.enterpriseNumber,
            extNotificationService.enterpriseNumber,
            'Expected to have the same "enterprise number" returned.'
        );
        System.assertEquals(
            request.externalId,
            extNotificationService.externalId,
            'Expected to have the same "external Id" returned.'
        );
        System.assertEquals(
            request.groupingId,
            extNotificationService.groupingId,
            'Expected to have the same "grouping Id" returned.'
        );
        System.assertEquals(
            request.notificationText,
            extNotificationService.notificationText,
            'Expected to have the same "notification Text" returned.'
        );
        System.assertEquals(request.url, extNotificationService.url, 'Expected to have the same "url" returned.');
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
        TAG_ExtNotificationService extNotificationService = (TAG_ExtNotificationService) TAG_ExtNotificationFlowController.addSMSNotification(
            mockExtNotificationService,
            request
        );
        System.Test.stopTest();

        System.assertEquals(
            request.phoneNumber,
            extNotificationService.phoneNumber,
            'Expected to have the same "phone number" returned.'
        );
        System.assertEquals(
            request.smsText,
            extNotificationService.smsText,
            'Expected to have the same "sms text" returned.'
        );
        System.assertEquals(
            request.dispatchWindow,
            extNotificationService.dispatchWindow.name(),
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
        TAG_ExtNotificationService extNotificationService = (TAG_ExtNotificationService) TAG_ExtNotificationFlowController.addSMSNotification(
            mockExtNotificationService,
            request
        );
        System.Test.stopTest();

        System.assertEquals(
            request.phoneNumber,
            extNotificationService.phoneNumber,
            'Expected to have the same "phone number" returned.'
        );
        System.assertEquals(
            request.smsText,
            extNotificationService.smsText,
            'Expected to have the same "sms text" returned.'
        );
        System.assertEquals(
            null,
            extNotificationService.dispatchWindow?.name(),
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
        TAG_ExtNotificationService extNotificationService = (TAG_ExtNotificationService) TAG_ExtNotificationFlowController.buildAndSendExternalNotification(
            mockExtNotificationService
        );
        System.Test.stopTest();

        System.assertNotEquals(
            null,
            extNotificationService.notificationBody,
            'Expected to have a "notification body" returned.'
        );
        System.assertEquals(
            'TestNotificationBody',
            extNotificationService.notificationBody,
            'Expected to have "notification body" return the value: "TestNotificationBody"'
        );

        Integer expectedStatusCode = TAG_MockExtNotificationService.DEFAULT_STATUS_CODE;
        String expectedBody = TAG_MockExtNotificationService.DEFAULT_BODY;
        System.assertEquals(
            expectedStatusCode,
            extNotificationService.notificationResponse.getStatusCode(),
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expectedBody,
            extNotificationService.notificationResponse.getBody(),
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
        List<TAG_ExtNotificationFlowController.ExtNotificationResult> resultsList = TAG_ExtNotificationFlowController.getResponseAndCreateResults(
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
            resultsList[0].statusCode,
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expextedTypeName,
            resultsList[0].typeName,
            'Expected type name "' + expextedTypeName + '" to be returned.'
        );
        System.assertEquals(
            expectedErrorMessage,
            resultsList[0].errorMessage,
            'Expected error message "' + expectedErrorMessage + '" to be returned.'
        );
        System.assertEquals(
            expectedNotificationId,
            resultsList[0].notificationId,
            'Expected notification id "' + expectedNotificationId + '" to be returned.'
        );
        System.assertEquals(
            expextedExternalNotificationId,
            resultsList[0].externalNotificationId,
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
        List<TAG_ExtNotificationFlowController.ExtNotificationResult> resultsList = TAG_ExtNotificationFlowController.getResponseAndCreateResults(
            mockExtNotificationService
        );
        System.Test.stopTest();

        String expextedTypeName = null;
        String expectedErrorMessage = status;
        String expectedNotificationId = null;
        String expextedExternalNotificationId = null;
        System.assertEquals(
            expectedStatusCode,
            resultsList[0].statusCode,
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expextedTypeName,
            resultsList[0].typeName,
            'Expected type name "' + expextedTypeName + '" to be returned.'
        );
        System.assertEquals(
            expectedErrorMessage,
            resultsList[0].errorMessage,
            'Expected error message "' + expectedErrorMessage + '" to be returned.'
        );
        System.assertEquals(
            expectedNotificationId,
            resultsList[0].notificationId,
            'Expected notification id "' + expectedNotificationId + '" to be returned.'
        );
        System.assertEquals(
            expextedExternalNotificationId,
            resultsList[0].externalNotificationId,
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
        List<TAG_ExtNotificationFlowController.ExtNotificationResult> resultsList = TAG_ExtNotificationFlowController.getResponseAndCreateResults(
            mockExtNotificationService
        );
        System.Test.stopTest();

        String expextedTypeName = null;
        String expectedErrorMessage = status + ' ' + body;
        String expectedNotificationId = null;
        String expextedExternalNotificationId = null;
        System.assertEquals(
            expectedStatusCode,
            resultsList[0].statusCode,
            'Expected status code "' + expectedStatusCode + '" to be returned.'
        );
        System.assertEquals(
            expextedTypeName,
            resultsList[0].typeName,
            'Expected type name "' + expextedTypeName + '" to be returned.'
        );
        System.assertEquals(
            expectedErrorMessage,
            resultsList[0].errorMessage,
            'Expected error message "' + expectedErrorMessage + '" to be returned.'
        );
        System.assertEquals(
            expectedNotificationId,
            resultsList[0].notificationId,
            'Expected notification id "' + expectedNotificationId + '" to be returned.'
        );
        System.assertEquals(
            expextedExternalNotificationId,
            resultsList[0].externalNotificationId,
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
    static void testSendSMSNotificationDWHours() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
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
    static void testSendSMSNotificationDWSunday() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
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
    static void testSendSMSNotificationDWContinuously() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
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
    static void testSendSMSNotificationDWNull() {
        List<TAG_ExtNotificationFlowController.ExtNotificationRequest> requests = new List<TAG_ExtNotificationFlowController.ExtNotificationRequest>();
        TAG_ExtNotificationFlowController.ExtNotificationRequest request = new TAG_ExtNotificationFlowController.ExtNotificationRequest();
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
}
