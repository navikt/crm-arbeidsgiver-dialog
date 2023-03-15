/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-03-14 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationUtilities
 */
@IsTest
private class TAG_ExtNotificationUtilities_Test {
    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_DispatchWindow_e` to `TAG_ExtNotificationModel.Sendevindu`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertDispatchWindowToSendevinduForNullPositive() {
        TAG_DispatchWindow_e dispatchWindow = null;
        TAG_ExtNotificationModel.Sendevindu sendevindu;

        Test.startTest();
        sendevindu = TAG_ExtNotificationUtilities.convertDispatchWindow(dispatchWindow);
        Test.stopTest();

        System.assertEquals(
            null,
            sendevindu,
            'Expected to have the "dispatchWindow/sendevindu" value of "null" returned.'
        );
    }
    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_DispatchWindow_e` to `TAG_ExtNotificationModel.Sendevindu`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertDispatchWindowToSendevinduForDaytimeNotSundayPositive() {
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY;
        TAG_ExtNotificationModel.Sendevindu sendevindu;

        Test.startTest();
        sendevindu = TAG_ExtNotificationUtilities.convertDispatchWindow(dispatchWindow);
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            sendevindu,
            'Expected to have the "dispatchWindow/sendevindu" value of "' +
                TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG +
                '" returned.'
        );
    }

    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_DispatchWindow_e` to `TAG_ExtNotificationModel.Sendevindu`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertDispatchWindowToSendevinduForContinuouslyPositive() {
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.CONTINUOUSLY;
        TAG_ExtNotificationModel.Sendevindu sendevindu;

        Test.startTest();
        sendevindu = TAG_ExtNotificationUtilities.convertDispatchWindow(dispatchWindow);
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.LOEPENDE,
            sendevindu,
            'Expected to have the "dispatchWindow/sendevindu" value of "' +
                TAG_ExtNotificationModel.Sendevindu.LOEPENDE +
                '" returned.'
        );
    }

    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_DispatchWindow_e` to `TAG_ExtNotificationModel.Sendevindu`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertDispatchWindowToSendevinduForNKSBusinessHoursPositive() {
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;
        TAG_ExtNotificationModel.Sendevindu sendevindu;

        Test.startTest();
        sendevindu = TAG_ExtNotificationUtilities.convertDispatchWindow(dispatchWindow);
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            sendevindu,
            'Expected to have the "dispatchWindow/sendevindu" value of "' +
                TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID +
                '" returned.'
        );
    }

    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_ExtNotificationModel.Sendevindu` to `TAG_DispatchWindow_e`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertSendevinduToDispatchWindowForNullPositive() {
        TAG_ExtNotificationModel.Sendevindu sendevindu = null;
        TAG_DispatchWindow_e dispatchWindow;

        Test.startTest();
        dispatchWindow = TAG_ExtNotificationUtilities.convertDispatchWindow(sendevindu);
        Test.stopTest();

        System.assertEquals(
            null,
            dispatchWindow,
            'Expected to have the "dispatchWindow/sendevindu" value of "null" returned.'
        );
    }

    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_ExtNotificationModel.Sendevindu` to `TAG_DispatchWindow_e`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertSendevinduToDispatchWindowForDagtidIkkeSoendagPositive() {
        TAG_ExtNotificationModel.Sendevindu sendevindu = TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        TAG_DispatchWindow_e dispatchWindow;

        Test.startTest();
        dispatchWindow = TAG_ExtNotificationUtilities.convertDispatchWindow(sendevindu);
        Test.stopTest();

        System.assertEquals(
            TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY,
            dispatchWindow,
            'Expected to have the "dispatchWindow/sendevindu" value of "' +
                TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY +
                '" returned.'
        );
    }

    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_ExtNotificationModel.Sendevindu` to `TAG_DispatchWindow_e`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertSendevinduToDispatchWindowForLoependePositive() {
        TAG_ExtNotificationModel.Sendevindu sendevindu = TAG_ExtNotificationModel.Sendevindu.LOEPENDE;
        TAG_DispatchWindow_e dispatchWindow;

        Test.startTest();
        dispatchWindow = TAG_ExtNotificationUtilities.convertDispatchWindow(sendevindu);
        Test.stopTest();

        System.assertEquals(
            TAG_DispatchWindow_e.CONTINUOUSLY,
            dispatchWindow,
            'Expected to have the "dispatchWindow/sendevindu" value of "' +
                TAG_DispatchWindow_e.CONTINUOUSLY +
                '" returned.'
        );
    }

    /**
     * @description Testing that the convertDispatchWindow
     * (`TAG_ExtNotificationUtilities.convertDispatchWindow`) is converting
     * from `TAG_ExtNotificationModel.Sendevindu` to `TAG_DispatchWindow_e`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-14 Created.
     */
    @IsTest
    static void testConvertSendevinduToDispatchWindowForNKSAapningstidPositive() {
        TAG_ExtNotificationModel.Sendevindu sendevindu = TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        TAG_DispatchWindow_e dispatchWindow;

        Test.startTest();
        dispatchWindow = TAG_ExtNotificationUtilities.convertDispatchWindow(sendevindu);
        Test.stopTest();

        System.assertEquals(
            TAG_DispatchWindow_e.NKS_BUSINESS_HOURS,
            dispatchWindow,
            'Expected to have the "dispatchWindow/sendevindu" value of "' +
                TAG_DispatchWindow_e.NKS_BUSINESS_HOURS +
                '" returned.'
        );
    }
}
