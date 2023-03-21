/**
 * @description This is the builder class for External Notification used in the
 * external notification system.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-13 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationModel
 */
public inherited sharing class TAG_ExtNotificationBuilder {
    /**
     * @description The current NyBeskjedInput
     * (`TAG_ExtNotificationModel.NyBeskjedInput`).
     */
    private TAG_ExtNotificationModel.NyBeskjedInput current;

    /**
     * @description Constructor - Creates an instance of NyBeskjedInput
     * (`TAG_ExtNotificationModel.NyBeskjedInput`) and set it to
     * the private class variable `current`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     * @param current The current instance of the NyBeskjedInput (`TAG_ExtNotificationModel.NyBeskjedInput`) object.
     * @see TAG_ExtNotificationModel.NyBeskjedInput
     */
    private TAG_ExtNotificationBuilder(TAG_ExtNotificationModel.NyBeskjedInput current) {
        this.current = current;
    }

    /**
     * @description Entry point builder method to start composing object attributes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     * @return Returns new instance of itself (`TAG_ExtNotificationBuilder` new instance).
     * @see TAG_ExtNotificationModel.NyBeskjedInput
     */
    public static TAG_ExtNotificationBuilder start() {
        return new TAG_ExtNotificationBuilder(new TAG_ExtNotificationModel.NyBeskjedInput());
    }

    /**
     * @description Entry point builder method to start composing object attributes.
     * Overloaded function to modify existing data.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     * @param messageInput An instance of the NyBeskjedInput
     * (`TAG_ExtNotificationModel.NyBeskjedInput`) object.
     * @return Returns new instance of itself
     * (`TAG_ExtNotificationBuilder` new instance).
     * @see TAG_ExtNotificationModel.NyBeskjedInput
     */
    public static TAG_ExtNotificationBuilder start(TAG_ExtNotificationModel.NyBeskjedInput messageInput) {
        return new TAG_ExtNotificationBuilder(messageInput);
    }

    /**
     * @description This is a composable function that will set the Metadata
     * Input(`metadata`) field to the value provided by the `metadataInput`
     * parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     * @param metadataInput The instance of Metadata Input Builder
     * (`TAG_MetadataInputBuilder`) representing the Metadata Input in the
     * External Notificaton.
     * @return Returns itself (`TAG_ExtNotificationBuilder` instance).
     * @see TAG_MetadataInputBuilder
     */
    public TAG_ExtNotificationBuilder metadataInput(TAG_MetadataInputBuilder metadataInput) {
        current.metadata = metadataInput.build();
        return this;
    }

    /**
     * @description This is a composable function that will set the SMS Notification (`sms`)
     * field to the value provided by the `smsNotification` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     * @param smsNotification The instance of SMS Notification Builder (`TAG_SMSNotificationBuilder`) representing the SMS Notification.
     * @return Returns itself (`TAG_ExtNotificationBuilder` instance).
     * @see TAG_SMSNotificationBuilder
     */
    public TAG_ExtNotificationBuilder smsNotification(TAG_SMSNotificationBuilder smsNotification) {
        externalNotificationInput();
        current.eksterneVarsler.sms = smsNotification.build();
        return this;
    }

    /**
     * @description Returns the constructed External notification
     * (`TAG_ExtNotificationModel.NyBeskjedInput`).
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     * @return Returns an instance of the External notification (`TAG_ExtNotificationModel.NyBeskjedInput`).
     */
    public TAG_ExtNotificationModel.NyBeskjedInput build() {
        return current;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     */
    private void externalNotificationInput() {
        if (current.eksterneVarsler == null) {
            current.eksterneVarsler = new TAG_ExtNotificationModel.EksterntVarselInput();
        }
    }

    /**
     * @description External Notification Exception that can
     * be used inside this class our outside for testing purposes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-13 Created.
     */
    public class ExternalNotificationBuilderException extends Exception {
    }
}
