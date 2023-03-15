/**
 * @description This is the builder class for SMS Notification used in the
 * external notification system.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-07 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationModel
 */
public inherited sharing class TAG_SMSNotificationBuilder {
    /**
     * @description The current EksterntVarselSmsInput
     * (`TAG_ExtNotificationModel.EksterntVarselSmsInput`).
     */
    private TAG_ExtNotificationModel.EksterntVarselSmsInput current;

    /**
     * @description Constructor - Creates an instance of EksterntVarselSmsInput
     * (`TAG_ExtNotificationModel.EksterntVarselSmsInput`) and set it to
     * the private class variable `current`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @param current The current instance of the EksterntVarselSmsInput (`TAG_ExtNotificationModel.EksterntVarselSmsInput`) object.
     * @see TAG_ExtNotificationModel.EksterntVarselSmsInput
     */
    private TAG_SMSNotificationBuilder(TAG_ExtNotificationModel.EksterntVarselSmsInput current) {
        this.current = current;
    }

    /**
     * @description Entry point builder method to start composing object attributes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @return Returns new instance of itself (`TAG_SMSNotificationBuilder` new instance).
     * @see TAG_ExtNotificationModel.EksterntVarselSmsInput
     */
    public static TAG_SMSNotificationBuilder start() {
        return new TAG_SMSNotificationBuilder(new TAG_ExtNotificationModel.EksterntVarselSmsInput());
    }

    /**
     * @description Entry point builder method to start composing object attributes.
     * Overloaded function to modify existing data.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @param smsInput An instance of the EksterntVarselSmsInput (`TAG_ExtNotificationModel.EksterntVarselSmsInput`) object.
     * @return Returns new instance of itself (`TAG_SMSNotificationBuilder` new instance).
     * @see TAG_ExtNotificationModel.EksterntVarselSmsInput
     */
    public static TAG_SMSNotificationBuilder start(TAG_ExtNotificationModel.EksterntVarselSmsInput smsInput) {
        return new TAG_SMSNotificationBuilder(smsInput);
    }

    /**
     * @description This is a composable function that will set the SMS Text (`smsTekst`)
     * field to the value provided by the `smsText` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @param smsText The value that the SMS Text (`smsTekst`) field will be set to.
     * @return Returns itself (`TAG_SMSNotificationBuilder` instance).
     */
    public TAG_SMSNotificationBuilder text(String smsText) {
        current.smsTekst = smsText;
        return this;
    }

    /**
     * @description This is a composable function that will set the SMS Recipient (`tlf`)
     * field to the value provided by the `phoneNumber` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @param smsText The value that the SMS Text (`smsTekst`) field will be set to.
     * @return Returns itself (`TAG_SMSNotificationBuilder` instance).
     * @see TAG_ExtNotificationModel.SmsMottakerInput
     * @see TAG_ExtNotificationModel.SmsKontaktInfoInput
     */
    public TAG_SMSNotificationBuilder recipient(String phoneNumber) {
        if (current.mottaker == null) {
            current.mottaker = new TAG_ExtNotificationModel.SmsMottakerInput();
        }

        if (current.mottaker.kontaktinfo == null) {
            current.mottaker.kontaktinfo = new TAG_ExtNotificationModel.SmsKontaktInfoInput();
        }
        current.mottaker.kontaktinfo.tlf = phoneNumber;

        return this;
    }

    /**
     * @description This is a composable function that will set the SMS Dispatch Time (`tidspunkt`)
     * field to the value provided by the `dispatchTime` parameter.
     *
     * To be specified as ISO8601LocalDateTime: Date and local time as per ISO8601-standard.
     * An example is `2001-12-24T10:44:01`. This will be interpetated as Oslo time (`Europe/Oslo`).
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @param dispatchTime The value that the SMS Dispatch Time (`tidspunkt`) field will be set to.
     * To be specified as ISO8601LocalDateTime.
     * @return Returns itself (`TAG_SMSNotificationBuilder` instance).
     * @see TAG_ExtNotificationModel.SendetidspunktInput
     * @exception Throws `TAG_SMSNotificationBuilder.TAG_SMSNotificationBuilderException`
     */
    public TAG_SMSNotificationBuilder dispatchTime(String dispatchTime) {
        if (current.sendetidspunkt == null) {
            current.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        }

        if (current.sendetidspunkt.sendevindu != null) {
            throw new TAG_SMSNotificationBuilder.SMSNotificationBuilderException(
                'Can not set SMS Dispatch Time when SMS Dispatch Window is set. Only one of them can be used at the same time.'
            );
        }

        current.sendetidspunkt.tidspunkt = dispatchTime;

        return this;
    }

    /**
     * @description This is a composable function that will set the SMS Dispatch Window (`sendevindu`)
     * field to the value provided by the `dispatchWindow` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @param dispatchWindow The value that the SMS Dispatch Window (`sendevindu`) field will be set to.
     * @return Returns itself (`TAG_SMSNotificationBuilder` instance).
     * @exception Throws `TAG_SMSNotificationBuilder.TAG_SMSNotificationBuilderException`
     */
    public TAG_SMSNotificationBuilder dispatchWindow(TAG_DispatchWindow_e dispatchWindow) {
        if (current.sendetidspunkt == null) {
            current.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        }

        if (current.sendetidspunkt.tidspunkt != null) {
            throw new TAG_SMSNotificationBuilder.SMSNotificationBuilderException(
                'Can not set SMS Dispatch Window when SMS Dispatch Time is set. Only one of them can be used at the same time.'
            );
        }

        current.sendetidspunkt.sendevindu = TAG_ExtNotificationUtilities.convertDispatchWindow(dispatchWindow);

        return this;
    }

    /**
     * @description Returns the constructed SMS notification
     * (`TAG_ExtNotificationModel.EksterntVarselSmsInput`).
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     * @return Returns an instance of the SMS notification (`TAG_ExtNotificationModel.EksterntVarselSmsInput`).
     */
    public TAG_ExtNotificationModel.EksterntVarselSmsInput build() {
        return current;
    }

    /**
     * @description SMS Notification Exception that can
     * be used inside this class our outside for testing purposes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-07 Created.
     */
    public class SMSNotificationBuilderException extends Exception {
    }
}
