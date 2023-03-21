/**
 * @description This is the builder class for Metadata Input used in the
 * external notification system.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-03-15 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationModel
 */
public inherited sharing class TAG_MetadataInputBuilder {
    /**
     * @description The current MetadataInput
     * (`TAG_ExtNotificationModel.MetadataInput`).
     */
    private TAG_ExtNotificationModel.MetadataInput current;

    /**
     * @description Constructor - Creates an instance of MetadataInput
     * (`TAG_ExtNotificationModel.MetadataInput`) and set it to
     * the private class variable `current`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param current The current instance of the MetadataInput
     * (`TAG_ExtNotificationModel.MetadataInput`) object.
     * @see TAG_ExtNotificationModel.MetadataInput
     */
    private TAG_MetadataInputBuilder(TAG_ExtNotificationModel.MetadataInput current) {
        this.current = current;
    }

    /**
     * @description Entry point builder method to start composing object
     * attributes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @return Returns new instance of itself (`TAG_MetadataInputBuilder`
     * new instance).
     * @see TAG_ExtNotificationModel.MetadataInput
     */
    public static TAG_MetadataInputBuilder start() {
        return new TAG_MetadataInputBuilder(new TAG_ExtNotificationModel.MetadataInput());
    }

    /**
     * @description Entry point builder method to start composing object
     * attributes.
     * Overloaded function to modify existing data.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param metadataInput An instance of the MetadataInput
     * (`TAG_ExtNotificationModel.MetadataInput`) object.
     * @return Returns new instance of itself (`TAG_SMSNotificationBuilder`
     * new instance).
     * @see TAG_ExtNotificationModel.MetadataInput
     */
    public static TAG_MetadataInputBuilder start(TAG_ExtNotificationModel.MetadataInput metadataInput) {
        return new TAG_MetadataInputBuilder(metadataInput);
    }

    /**
     * @description This is a composable function that will set the Enterprise
     * Number (`virksomhetsnummer`) field to the value provided by the
     * `enterpriseNumber` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param enterpriseNumber The value that the Enterprise Number
     * (`virksomhetsnummer`) field will be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     */
    public TAG_MetadataInputBuilder enterpriseNumber(String enterpriseNumber) {
        current.virksomhetsnummer = enterpriseNumber;
        return this;
    }

    /**
     * @description This is a composable function that will set the External Id
     * (`eksternId`) field to the value provided by the `externalId` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param externalId The value that the External Id (`eksternId`) field will
     * be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     */
    public TAG_MetadataInputBuilder externalId(String externalId) {
        current.eksternId = externalId;
        return this;
    }

    /**
     * @description This is a composable function that will set the Grouping Id
     * (`grupperingsid`) field to the value provided by the `groupingId`
     * parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param groupingId The value that the Grouping Id (`grupperingsid`) field
     * will be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     */
    public TAG_MetadataInputBuilder groupingId(String groupingId) {
        current.grupperingsid = groupingId;
        return this;
    }

    /**
     * @description This is a composable function that will set the Created Time
     * (`opprettetTidspunkt`) field to the value provided by the `createdTime`
     * parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param createdTime The value that the Created Time (`opprettetTidspunkt`)
     * field will be set to. This value need to follow the format of
     * "ISO8601DateTime".
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     * @see [ISO8601DateTime](https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#iso8601datetime)
     */
    public TAG_MetadataInputBuilder createdTime(String createdTime) {
        current.opprettetTidspunkt = createdTime;
        return this;
    }

    /**
     * @description This is a composable function that will set the At Date Time
     * (`den`) field to the value provided by the `atDateTime`
     * parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param atDateTime The value that the At Date Time (`den`) field
     * will be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     * @exception Throws `TAG_MetadataInputBuilder.MetadataInputBuilderException`
     * @see [ISO8601LocalDateTime](https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#iso8601localdatetime)
     * @see TAG_ExtNotificationModel.FutureTemporalInput
     */
    public TAG_MetadataInputBuilder hardDeleteAtDateTime(String atDateTime) {
        if (current.hardDelete == null) {
            current.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        }

        if (current.hardDelete.om != null) {
            throw new TAG_MetadataInputBuilder.MetadataInputBuilderException(
                'Can not set Metadata Input Hard Delete At Date Time when Metadata Input Hard Delete In Time is set. Only one of them can be used at the same time.'
            );
        }

        current.hardDelete.den = atDateTime;
        return this;
    }

    /**
     * @description This is a composable function that will set the At Date Time
     * (`den`) field to the value provided by the `atDateTime`
     * parameter. It will not throw an exception if In Time
     * (`den`) field is set, but create a
     * new Hard Delete (`FutureTemporalInput`) instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param atDateTime The value that the At Date Time (`den`) field
     * will be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     * @see [ISO8601LocalDateTime](https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#iso8601localdatetime)
     * @see TAG_ExtNotificationModel.FutureTemporalInput
     */
    public TAG_MetadataInputBuilder overrideHardDeleteAtDateTime(String atDateTime) {
        current.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        current.hardDelete.den = atDateTime;
        return this;
    }

    /**
     * @description This is a composable function that will set the In Time
     * (`den`) field to the value provided by the `inTime`
     * parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param inTime The value that the In Time (`den`) field
     * will be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     * @exception Throws `TAG_MetadataInputBuilder.MetadataInputBuilderException`
     * @see [ISO8601LocalDateTime](https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#iso8601localdatetime)
     * @see TAG_ExtNotificationModel.FutureTemporalInput
     */
    public TAG_MetadataInputBuilder hardDeleteInTime(String inTime) {
        if (current.hardDelete == null) {
            current.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        }

        if (current.hardDelete.den != null) {
            throw new TAG_MetadataInputBuilder.MetadataInputBuilderException(
                'Can not set Metadata Input Hard Delete In Time when Metadata Input Hard Delete At Date Time is set. Only one of them can be used at the same time.'
            );
        }

        current.hardDelete.om = inTime;
        return this;
    }

    /**
     * @description This is a composable function that will set the In Time
     * (`den`) field to the value provided by the `inTime`
     * parameter. It will not throw an exception if At Date Time (`den`) field
     * is set, but create a new Hard Delete (`FutureTemporalInput`) instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @param inTime The value that the In Time (`den`) field
     * will be set to.
     * @return Returns itself (`TAG_MetadataInputBuilder` instance).
     * @see [ISO8601LocalDateTime](https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#iso8601localdatetime)
     * @see TAG_ExtNotificationModel.FutureTemporalInput
     */
    public TAG_MetadataInputBuilder overrideHardDeleteInTime(String inTime) {
        current.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        current.hardDelete.om = inTime;
        return this;
    }

    /**
     * @description Returns the constructed Matadata Input
     * (`TAG_ExtNotificationModel.MetadataInput`).
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     * @return Returns an instance of the Matadata Input
     * (`TAG_ExtNotificationModel.MetadataInput`).
     */
    public TAG_ExtNotificationModel.MetadataInput build() {
        return current;
    }

    /**
     * @description Matadata Input Exception that can
     * be used inside this class our outside for testing purposes.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     */
    public class MetadataInputBuilderException extends Exception {
    }
}
