/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-07 Created.
 *
 * @group TAG External Notification
 * @see TAG_SMSNotificationBuilder
 */
@IsTest
private class TAG_SMSNotificationBuilder_Test {
    /**
     * @description Testing that the EksterntVarselSmsInput
     * (`TAG_ExternalNotificationModel.EksterntVarselSmsInput`) is constructed
     * without any fields are set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderStartAndBuildPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start().build();
        Test.stopTest();

        System.assertNotEquals(
            null,
            smsInput,
            'Expected to not have null returned as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            smsInput.mottaker,
            'Expected to have null returned from the "mottaker" field as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            smsInput.sendetidspunkt,
            'Expected to have null returned from the "sendetidspunkt" field as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            smsInput.smsTekst,
            'Expected to have null returned from the "smsTekst" field as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
    }

    /**
     * @description Testing that the EksterntVarselSmsInput
     * (`TAG_ExternalNotificationModel.EksterntVarselSmsInput`) is constructed
     * without by using existing instance and at the same time check that no
     * fields are set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-09 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderStartWithExistingInstanceAndBuildPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        TAG_ExternalNotificationModel.EksterntVarselSmsInput modifiedSmsInputInstance;

        Test.startTest();
        modifiedSmsInputInstance = TAG_SMSNotificationBuilder.start(existingSmsInputInstance).build();
        Test.stopTest();

        System.assertEquals(
            existingSmsInputInstance,
            modifiedSmsInputInstance,
            'Expected to not have null returned as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertNotEquals(
            null,
            modifiedSmsInputInstance,
            'Expected to not have null returned as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedSmsInputInstance.mottaker,
            'Expected to have null returned from the "mottaker" field as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedSmsInputInstance.sendetidspunkt,
            'Expected to have null returned from the "sendetidspunkt" field as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedSmsInputInstance.smsTekst,
            'Expected to have null returned from the "smsTekst" field as a value since a new instance of "TAG_ExternalNotificationModel.EksterntVarselSmsInput" should have been instantiated.'
        );
    }

    /**
     * @description Testing and verifying that the `text` method is overriding
     *  and setting the value in the SMS Text (`smsTekst`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderTextMethodPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String smsText = 'smsText Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start().text(smsText).build();
        Test.stopTest();

        System.assertEquals(
            smsText,
            smsInput.smsTekst,
            'Expected to have the value "' + smsText + '" returned from the "smsTekst" field.'
        );
    }

    /**
     * @description Testing and verifying that the `text` method is overriding
     *  and setting the value in the SMS Text (`smsTekst`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderTextMethodWithExistingTextPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.smsTekst = 'Old smsTekst';

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String smsText = 'smsText Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start(existingSmsInputInstance).text(smsText).build();
        Test.stopTest();

        System.assertEquals(
            smsText,
            smsInput.smsTekst,
            'Expected to have the value "' + smsText + '" returned from the "smsTekst" field.'
        );
    }

    /**
     * @description Testing and verifying that the `text` method is overriding
     *  and setting the value in the SMS Recipient (`mottaker.kontaktinfo.tlf`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderRecipientMethodPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String phoneNumber = 'phoneNumber Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start().recipient(phoneNumber).build();
        Test.stopTest();

        System.assertEquals(
            phoneNumber,
            smsInput.mottaker.kontaktinfo.tlf,
            'Expected to have the value "' + phoneNumber + '" returned from the "mottaker.kontaktinfo.tlf" field.'
        );
    }

    /**
     * @description Testing and verifying that the `text` method is overriding
     *  and setting the value in the SMS Recipient (`mottaker.kontaktinfo.tlf`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderRecipientMethodExistingReciverPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.mottaker = new TAG_ExternalNotificationModel.SmsMottakerInput();

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String phoneNumber = 'phoneNumber Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start(existingSmsInputInstance).recipient(phoneNumber).build();
        Test.stopTest();

        System.assertEquals(
            phoneNumber,
            smsInput.mottaker.kontaktinfo.tlf,
            'Expected to have the value "' + phoneNumber + '" returned from the "mottaker.kontaktinfo.tlf" field.'
        );
    }

    /**
     * @description Testing and verifying that the `text` method is overriding
     *  and setting the value in the SMS Recipient (`mottaker.kontaktinfo.tlf`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderRecipientMethodExistingReciverContactInfoPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.mottaker = new TAG_ExternalNotificationModel.SmsMottakerInput();
        existingSmsInputInstance.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String phoneNumber = 'phoneNumber Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start(existingSmsInputInstance).recipient(phoneNumber).build();
        Test.stopTest();

        System.assertEquals(
            phoneNumber,
            smsInput.mottaker.kontaktinfo.tlf,
            'Expected to have the value "' + phoneNumber + '" returned from the "mottaker.kontaktinfo.tlf" field.'
        );
    }

    /**
     * @description Testing and verifying that the `text` method is overriding
     *  and setting the value in the SMS Recipient (`mottaker.kontaktinfo.tlf`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderRecipientMethodWithExistingPhoneNumberPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.mottaker = new TAG_ExternalNotificationModel.SmsMottakerInput();
        existingSmsInputInstance.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();
        existingSmsInputInstance.mottaker.kontaktinfo.tlf = 'Old tlf';

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String phoneNumber = 'phoneNumber Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start(existingSmsInputInstance).recipient(phoneNumber).build();
        Test.stopTest();

        System.assertEquals(
            phoneNumber,
            smsInput.mottaker.kontaktinfo.tlf,
            'Expected to have the value "' + phoneNumber + '" returned from the "mottaker.kontaktinfo.tlf" field.'
        );
    }

    /**
     * @description Testing and verifying that the `dispatchTime` method is overriding
     *  and setting the value in the SMS Dispatch Time (`sendetidspunkt.tidspunkt`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderDispatchTimeMethodPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String dispatchTime = 'dispatchTime Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start().dispatchTime(dispatchTime).build();
        Test.stopTest();

        System.assertEquals(
            dispatchTime,
            smsInput.sendetidspunkt.tidspunkt,
            'Expected to have the value "' + dispatchTime + '" returned from the "sendetidspunkt.tidspunkt" field.'
        );
    }

    /**
     * @description Testing and verifying that the `dispatchTime` method is overriding
     *  and setting the value in the SMS Dispatch Time (`sendetidspunkt.tidspunkt`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderDispatchTimeMethodWithExistingDispatchTimePositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        existingSmsInputInstance.sendetidspunkt.tidspunkt = 'Old dispatchTime';

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String dispatchTime = 'dispatchTime Test';

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start().dispatchTime(dispatchTime).build();
        Test.stopTest();

        System.assertEquals(
            dispatchTime,
            smsInput.sendetidspunkt.tidspunkt,
            'Expected to have the value "' + dispatchTime + '" returned from the "sendetidspunkt.tidspunkt" field.'
        );
    }

    /**
     * @description Testing and verifying that the `dispatchTime` method is overriding
     *  and setting the value in the SMS Dispatch Time (`sendetidspunkt.tidspunkt`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderDispatchTimeMethodException() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        existingSmsInputInstance.sendetidspunkt.sendevindu = TAG_ExternalNotificationUtilities.convertDispatchWindow(
            TAG_DispatchWindow_e.NKS_BUSINESS_HOURS
        );

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        String dispatchTime = 'dispatchTime Test';

        Boolean smsExceptionOccurred = false;
        Boolean exceptionOccurred = false;
        String exceptionMessage = '';

        Test.startTest();
        try {
            smsInput = TAG_SMSNotificationBuilder.start(existingSmsInputInstance).dispatchTime(dispatchTime).build();
        } catch (TAG_SMSNotificationBuilder.SMSNotificationBuilderException smsException) {
            smsExceptionOccurred = true;
            exceptionMessage = smsException.getMessage();
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();

        System.assert(exceptionOccurred == false, 'exceptionOccurred');
        System.assert(smsExceptionOccurred == true, 'smsExceptionOccurred');

        System.assert(
            exceptionMessage.contains(
                'Can not set SMS Dispatch Time when SMS Dispatch Window is set. Only one of them can be used at the same time.'
            ),
            'Exceptin message to contain the error message: "Can not set SMS Dispatch Time when SMS Dispatch Window is set. Only one of them can be used at the same time.".'
        );
    }

    /**
     * @description Testing and verifying that the `dispatchWindow` method is overriding
     *  and setting the value in the SMS Dispatch Time (`sendetidspunkt.tidspunkt`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderDispatchWindowMethodPositive() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;

        Test.startTest();
        smsInput = TAG_SMSNotificationBuilder.start().dispatchWindow(dispatchWindow).build();
        Test.stopTest();

        System.assertEquals(
            TAG_ExternalNotificationUtilities.convertDispatchWindow(dispatchWindow),
            smsInput.sendetidspunkt.sendevindu,
            'Expected to have the value "' + dispatchWindow + '" returned from the "sendetidspunkt.sendevindu" field.'
        );
    }

    /**
     * @description Testing and verifying that the `dispatchWindow` method is overriding
     *  and setting the value in the SMS Dispatch Time (`sendetidspunkt.tidspunkt`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-08 Created.
     */
    @IsTest
    private static void testSMSNotificationBuilderDispatchWindowMethodException() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput existingSmsInputInstance = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        existingSmsInputInstance.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        existingSmsInputInstance.sendetidspunkt.tidspunkt = 'Old dispatchTime';

        TAG_ExternalNotificationModel.EksterntVarselSmsInput smsInput;
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;

        Boolean smsExceptionOccurred = false;
        Boolean exceptionOccurred = false;
        String exceptionMessage = '';

        Test.startTest();
        try {
            smsInput = TAG_SMSNotificationBuilder.start(existingSmsInputInstance)
                .dispatchWindow(dispatchWindow)
                .build();
        } catch (TAG_SMSNotificationBuilder.SMSNotificationBuilderException smsException) {
            smsExceptionOccurred = true;
            exceptionMessage = smsException.getMessage();
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();

        System.assert(exceptionOccurred == false, 'exceptionOccurred');
        System.assert(smsExceptionOccurred == true, 'smsExceptionOccurred');

        System.assert(
            exceptionMessage.contains(
                'Can not set SMS Dispatch Window when SMS Dispatch Time is set. Only one of them can be used at the same time.'
            ),
            'Exceptin message to contain the error message: "Can not set SMS Dispatch Window when SMS Dispatch Time is set. Only one of them can be used at the same time.".'
        );
    }
}
