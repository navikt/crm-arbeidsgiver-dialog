/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-03-16 Created.
 *
 * @group TAG External Notification
 * @see TAG_MetadataInputBuilder
 */
@IsTest
private class TAG_MetadataInputBuilder_Test {
    /**
     * @description Testing that the MetadataInput
     * (`TAG_ExtNotificationModel.MetadataInput`) is constructed
     * without any fields are set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderStartAndBuildPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().build();
        Test.stopTest();

        System.assertNotEquals(
            null,
            metadataInput,
            'Expected to not have null returned as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            metadataInput.virksomhetsnummer,
            'Expected to have null returned from the "virksomhetsnummer" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            metadataInput.eksternId,
            'Expected to have null returned from the "eksternId" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            metadataInput.grupperingsid,
            'Expected to have null returned from the "grupperingsid" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            metadataInput.opprettetTidspunkt,
            'Expected to have null returned from the "opprettetTidspunkt" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            metadataInput.hardDelete,
            'Expected to have null returned from the "hardDelete" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
    }

    /**
     * @description Testing that the MetadataInput
     * (`TAG_ExtNotificationModel.MetadataInput`) is constructed
     * without any fields are set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-15 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderStartWithExistingInstanceAndBuildPositive() {
        TAG_ExtNotificationModel.MetadataInput existingMetadataInput = new TAG_ExtNotificationModel.MetadataInput();
        TAG_ExtNotificationModel.MetadataInput modifiedMetadataInput;

        Test.startTest();
        modifiedMetadataInput = TAG_MetadataInputBuilder.start(existingMetadataInput).build();
        Test.stopTest();

        System.assertEquals(
            existingMetadataInput,
            modifiedMetadataInput,
            'Expected to not have null returned as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedMetadataInput.virksomhetsnummer,
            'Expected to have null returned from the "virksomhetsnummer" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedMetadataInput.eksternId,
            'Expected to have null returned from the "eksternId" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedMetadataInput.grupperingsid,
            'Expected to have null returned from the "grupperingsid" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedMetadataInput.opprettetTidspunkt,
            'Expected to have null returned from the "opprettetTidspunkt" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
        System.assertEquals(
            null,
            modifiedMetadataInput.hardDelete,
            'Expected to have null returned from the "hardDelete" field as a value since a new instance of "TAG_ExtNotificationModel.MetadataInput" should have been instantiated.'
        );
    }

    /**
     * @description Testing and verifying that the `enterpriseNumber` method is
     * overriding and setting the value in the Enterprise Number
     * (`virksomhetsnummer`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-16 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderEnterpriseNumberMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String enterpriseNumber = 'enterpriseNumber Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().enterpriseNumber(enterpriseNumber).build();
        Test.stopTest();

        System.assertEquals(
            enterpriseNumber,
            metadataInput.virksomhetsnummer,
            'Expected to have the value "' + enterpriseNumber + '" returned from the "virksomhetsnummer" field.'
        );
    }

    /**
     * @description Testing and verifying that the `externalId` method is
     * overriding and setting the value in the Ekstern Id
     * (`eksternId`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-16 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderExternalIdMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String externalId = 'externalId Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().externalId(externalId).build();
        Test.stopTest();

        System.assertEquals(
            externalId,
            metadataInput.eksternId,
            'Expected to have the value "' + externalId + '" returned from the "eksternId" field.'
        );
    }

    /**
     * @description Testing and verifying that the `groupingId` method is
     * overriding and setting the value in the Grouping Id (`grupperingsid`)
     * field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-16 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderGroupingIdMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String groupingId = 'groupingId Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().groupingId(groupingId).build();
        Test.stopTest();

        System.assertEquals(
            groupingId,
            metadataInput.grupperingsid,
            'Expected to have the value "' + groupingId + '" returned from the "grupperingsid" field.'
        );
    }

    /**
     * @description Testing and verifying that the `createdTime` method is
     * overriding and setting the value in the Created Time
     * (`opprettetTidspunkt`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-16 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderCreatedTimeMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String createdTime = 'createdTime Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().createdTime(createdTime).build();
        Test.stopTest();

        System.assertEquals(
            createdTime,
            metadataInput.opprettetTidspunkt,
            'Expected to have the value "' + createdTime + '" returned from the "opprettetTidspunkt" field.'
        );
    }

    /**
     * @description Testing and verifying that the `hardDeleteAtDateTime`
     * method is overriding and setting the value in the Hard Delete At Date
     * Time(`hardDelete.den`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderHardDeleteAtDateTimeMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String atDateTime = 'atDateTime Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().hardDeleteAtDateTime(atDateTime).build();
        Test.stopTest();

        System.assertEquals(
            atDateTime,
            metadataInput.hardDelete.den,
            'Expected to have the value "' + atDateTime + '" returned from the "hardDelete.den" field.'
        );
    }

    /**
     * @description Testing and verifying that the `hardDeleteAtDateTime`
     * method is overriding and setting the value in the Hard Delete At Date
     * Time(`hardDelete.den`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderOverrideHardDeleteAtDateTimeMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput = new TAG_ExtNotificationModel.MetadataInput();
        metadataInput.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        metadataInput.hardDelete.den = 'Original atDateTime Test';
        String atDateTime = 'atDateTime Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().overrideHardDeleteAtDateTime(atDateTime).build();
        Test.stopTest();

        System.assertEquals(
            atDateTime,
            metadataInput.hardDelete.den,
            'Expected to have the value "' + atDateTime + '" returned from the "hardDelete.den" field.'
        );
    }

    /**
     * @description Testing and verifying that the `hardDeleteAtDateTime`
     * method is overriding and setting the value in the Hard Delete At Date
     * Time(`hardDelete.den`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderHardDeleteAtDateTimeMethodException() {
        TAG_ExtNotificationModel.MetadataInput metadataInput = new TAG_ExtNotificationModel.MetadataInput();
        metadataInput.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        metadataInput.hardDelete.om = 'Original inTime Test';
        String atDateTime = 'atDateTime Test';

        Boolean metadataInputExceptionOccurred = false;
        Boolean exceptionOccurred = false;
        String exceptionMessage = '';

        Test.startTest();
        try {
            metadataInput = TAG_MetadataInputBuilder.start(metadataInput).hardDeleteAtDateTime(atDateTime).build();
        } catch (TAG_MetadataInputBuilder.MetadataInputBuilderException metadataInputException) {
            metadataInputExceptionOccurred = true;
            exceptionMessage = metadataInputException.getMessage();
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();

        System.assert(exceptionOccurred == false, 'exceptionOccurred');
        System.assert(metadataInputExceptionOccurred == true, 'metadataInputExceptionOccurred');

        System.assert(
            exceptionMessage.contains(
                'Can not set Metadata Input Hard Delete At Date Time when Metadata Input Hard Delete In Time is set. Only one of them can be used at the same time.'
            ),
            'Exceptin message to contain the error message: "Can not set Metadata Input Hard Delete At Date Time when Metadata Input Hard Delete In Time is set. Only one of them can be used at the same time.".'
        );
    }

    /**
     * @description Testing and verifying that the `hardDeleteAtDateTime`
     * method is overriding and setting the value in the Hard Delete In
     * Time(`hardDelete.om`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderHardDeleteInTimeMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String inTime = 'inTime Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().hardDeleteInTime(inTime).build();
        Test.stopTest();

        System.assertEquals(
            inTime,
            metadataInput.hardDelete.om,
            'Expected to have the value "' + inTime + '" returned from the "hardDelete.om" field.'
        );
    }

    /**
     * @description Testing and verifying that the `overrideHardDeleteInTime`
     * method is overriding and setting the value in the Hard Delete In
     * Time(`hardDelete.om`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderOverrideHardDeleteInTimeMethodPositive() {
        TAG_ExtNotificationModel.MetadataInput metadataInput = new TAG_ExtNotificationModel.MetadataInput();
        metadataInput.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        metadataInput.hardDelete.om = 'Original inTime Test';
        String inTime = 'inTime Test';

        Test.startTest();
        metadataInput = TAG_MetadataInputBuilder.start().overrideHardDeleteInTime(inTime).build();
        Test.stopTest();

        System.assertEquals(
            inTime,
            metadataInput.hardDelete.om,
            'Expected to have the value "' + inTime + '" returned from the "hardDelete.om" field.'
        );
    }

    /**
     * @description Testing and verifying that the `hardDeleteAtDateTime`
     * method is overriding and setting the value in the Hard Delete At Date
     * Time(`hardDelete.om`) field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-21 Created.
     */
    @IsTest
    private static void testMetadataInputBuilderHardDeleteInTimeMethodException() {
        TAG_ExtNotificationModel.MetadataInput metadataInput = new TAG_ExtNotificationModel.MetadataInput();
        metadataInput.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        metadataInput.hardDelete.den = 'Original atDateTime Test';
        String inTime = 'inTime Test';

        Boolean metadataInputExceptionOccurred = false;
        Boolean exceptionOccurred = false;
        String exceptionMessage = '';

        Test.startTest();
        try {
            metadataInput = TAG_MetadataInputBuilder.start(metadataInput).hardDeleteInTime(inTime).build();
        } catch (TAG_MetadataInputBuilder.MetadataInputBuilderException metadataInputException) {
            metadataInputExceptionOccurred = true;
            exceptionMessage = metadataInputException.getMessage();
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();

        System.assert(exceptionOccurred == false, 'exceptionOccurred');
        System.assert(metadataInputExceptionOccurred == true, 'metadataInputExceptionOccurred');

        System.assert(
            exceptionMessage.contains(
                'Can not set Metadata Input Hard Delete In Time when Metadata Input Hard Delete At Date Time is set. Only one of them can be used at the same time.'
            ),
            'Exceptin message to contain the error message: "Can not set Metadata Input Hard Delete In Time when Metadata Input Hard Delete At Date Time is set. Only one of them can be used at the same time.".'
        );
    }
}
