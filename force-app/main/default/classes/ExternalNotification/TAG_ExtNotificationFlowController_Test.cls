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
private class TAG_ExtNotificationFlowController_Test {
    // /**
    //  * @description Testing
    //  *
    //  * @author Andre Colle <andre.colle@nav.no>
    //  * @since 2023-05-16 Created.
    //  */
    // @IsTest
    // static void testConstructorPositive() {
    //     TAG_ExtNotificationService externalNotificationService;

    //     Test.startTest();
    //     externalNotificationService = new TAG_ExtNotificationService();
    //     Test.stopTest();

    //     System.assertEquals(
    //         TAG_ExtNotificationService.DEFAULT_NAME,
    //         externalNotificationService.name,
    //         'Expected to have the same name as given in the constructor.'
    //     );
    //     System.assertEquals(
    //         new GQLOperationType(TAG_ExtNotificationService.DEFAULT_OPERATION_TYPE).build(),
    //         externalNotificationService.operationType.build(),
    //         'Expected to have the same operationType as given in the constructor.'
    //     );
    // }

    @isTest
    static void testSendSMSNotification_DWHours() {
        List<TAG_ExtNotificationFlowController.SMSNotificationRequests> requests = new List<TAG_ExtNotificationFlowController.SMSNotificationRequests>();
        TAG_ExtNotificationFlowController.SMSNotificationRequests request = new TAG_ExtNotificationFlowController.SMSNotificationRequests();
        request.enterpriseNumber = 'TestEnterprise';
        request.externalId = 'TestExternalId';
        request.groupingId = 'TestGroupingId';
        request.notificationText = 'TestNotificationText';
        request.url = 'TestURL';
        request.phoneNumber = 'TestPhoneNumber';
        request.smsText = 'TestSMS';
        request.dispatchWindow = 'NKS_BUSINESS_HOURS';
        requests.add(request);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        List<TAG_ExtNotificationFlowController.SMSNotificationResults> results = TAG_ExtNotificationFlowController.sendSMSNotification(requests);
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertEquals(null, results[0].typeName);
        System.assertEquals(null, results[0].errorMessage);
        System.assertEquals(null, results[0].notificationId);
        System.assertEquals(null, results[0].externalNotificationId);
    }

    @isTest
    static void testSendSMSNotification_DWSunday() {
        List<TAG_ExtNotificationFlowController.SMSNotificationRequests> requests = new List<TAG_ExtNotificationFlowController.SMSNotificationRequests>();
        TAG_ExtNotificationFlowController.SMSNotificationRequests request1 = new TAG_ExtNotificationFlowController.SMSNotificationRequests();
        request1.enterpriseNumber = 'TestEnterprise1';
        request1.externalId = 'TestExternalId1';
        request1.groupingId = 'TestGroupingId1';
        request1.notificationText = 'TestNotificationText1';
        request1.url = 'TestURL1';
        request1.phoneNumber = 'TestPhoneNumber1';
        request1.smsText = 'TestSMS1';
        request1.dispatchWindow = 'DAYTIME_NOT_SUNDAY';
        requests.add(request1);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        List<TAG_ExtNotificationFlowController.SMSNotificationResults> results = TAG_ExtNotificationFlowController.sendSMSNotification(requests);
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertEquals(null, results[0].typeName);
        System.assertEquals(null, results[0].errorMessage);
        System.assertEquals(null, results[0].notificationId);
        System.assertEquals(null, results[0].externalNotificationId);
    }

    @isTest
    static void testSendSMSNotification_DWContinuously() {
        List<TAG_ExtNotificationFlowController.SMSNotificationRequests> requests = new List<TAG_ExtNotificationFlowController.SMSNotificationRequests>();
        TAG_ExtNotificationFlowController.SMSNotificationRequests request2 = new TAG_ExtNotificationFlowController.SMSNotificationRequests();
        request2.enterpriseNumber = 'TestEnterprise2';
        request2.externalId = 'TestExternalId2';
        request2.groupingId = 'TestGroupingId2';
        request2.notificationText = 'TestNotificationText2';
        request2.url = 'TestURL2';
        request2.phoneNumber = 'TestPhoneNumber2';
        request2.smsText = 'TestSMS2';
        request2.dispatchWindow = 'CONTINUOUSLY';
        requests.add(request2);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        List<TAG_ExtNotificationFlowController.SMSNotificationResults> results = TAG_ExtNotificationFlowController.sendSMSNotification(requests);
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertEquals(null, results[0].typeName);
        System.assertEquals(null, results[0].errorMessage);
        System.assertEquals(null, results[0].notificationId);
        System.assertEquals(null, results[0].externalNotificationId);
    }

    @isTest
    static void testSendSMSNotification_DWNull() {
        List<TAG_ExtNotificationFlowController.SMSNotificationRequests> requests = new List<TAG_ExtNotificationFlowController.SMSNotificationRequests>();
        TAG_ExtNotificationFlowController.SMSNotificationRequests request3 = new TAG_ExtNotificationFlowController.SMSNotificationRequests();
        request3.enterpriseNumber = 'TestEnterprise3';
        request3.externalId = 'TestExternalId3';
        request3.groupingId = 'TestGroupingId3';
        request3.notificationText = 'TestNotificationText3';
        request3.url = 'TestURL3';
        request3.phoneNumber = 'TestPhoneNumber3';
        request3.smsText = 'TestSMS3';
        request3.dispatchWindow = 'Test';
        requests.add(request3);

        ApiMock.setTestMock('POST_NOTIFICATION', 200, 'OK');

        Test.startTest();
        Try {
            List<TAG_ExtNotificationFlowController.SMSNotificationResults> results = TAG_ExtNotificationFlowController.sendSMSNotification(requests);
        } catch (Exception ex) {
            System.assertEquals('Unknown dispatch window: null', ex.getMessage());
        }  
        Test.stopTest();
    }
}