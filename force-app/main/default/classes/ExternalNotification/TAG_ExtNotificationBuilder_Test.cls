/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-13 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationBuilder
 */
@IsTest
private class TAG_ExtNotificationBuilder_Test {
    /**
     * @description Testing that the NyBeskjedInput
     * (`TAG_ExtNotificationModel.NyBeskjedInput`) is constructed
     * without any fields are set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     */
    @IsTest
    private static void testExternalNotificationBuilderStartAndBuildPositive() {
        TAG_ExtNotificationModel.NyBeskjedInput messageInput;

        Test.startTest();
        messageInput = TAG_ExtNotificationBuilder.start().build();
        Test.stopTest();

        System.assertNotEquals(
            null,
            messageInput,
            'Expected to not have null returned as a value since a new instance of "TAG_ExtNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
    }

    /**
     * @description Testing that the NyBeskjedInput
     * (`TAG_ExtNotificationModel.NyBeskjedInput`) is constructed
     * without by using existing instance and at the same time check that no
     * fields are set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     */
    @IsTest
    private static void testExternalNotificationBuilderStartWithExistingInstanceAndBuildPositive() {
        TAG_ExtNotificationModel.NyBeskjedInput existingMessageInputInstance = new TAG_ExtNotificationModel.NyBeskjedInput();
        TAG_ExtNotificationModel.NyBeskjedInput modifiedMessageInputInstance;

        Test.startTest();
        modifiedMessageInputInstance = TAG_ExtNotificationBuilder.start(existingMessageInputInstance).build();
        Test.stopTest();

        System.assertEquals(
            existingMessageInputInstance,
            modifiedMessageInputInstance,
            'Expected to not have the same instance of the "TAG_ExtNotificationModel.NyBeskjedInput" object.'
        );
        System.assertNotEquals(
            null,
            modifiedMessageInputInstance,
            'Expected to not have null returned as a value since a new instance of "TAG_ExtNotificationModel.NyBeskjedInput" should have been instantiated.'
        );
    }

    /**
     * @description Testing and verifying that the `smsNotification` method is overriding
     * and setting the value in the SMS Notification (`sms`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     */
    @IsTest
    private static void testExternalNotificationBuilderSmsNotificationMethodPositive() {
        TAG_ExtNotificationModel.NyBeskjedInput messageInput;

        String phoneNumber = 'phoneNumber Test';
        String smsText = 'smsText Test';
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;
        TAG_SMSNotificationBuilder smsNotificationBuilder = TAG_SMSNotificationBuilder.start()
            .recipient(phoneNumber)
            .text(smsText)
            .dispatchWindow(dispatchWindow);

        Test.startTest();
        messageInput = TAG_ExtNotificationBuilder.start().smsNotification(smsNotificationBuilder).build();
        Test.stopTest();

        System.assertEquals(
            smsText,
            messageInput.eksterneVarsler.sms.smsTekst,
            'Expected to have the value "' + smsText + '" returned from the "smsTekst" field.'
        );
    }
}
