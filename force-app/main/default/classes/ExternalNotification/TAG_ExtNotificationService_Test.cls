/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-22 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationService
 */
@IsTest
private class TAG_ExtNotificationService_Test {
    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-23 Created.
     */
    @IsTest
    static void testConstructorPositive() {
        TAG_ExtNotificationService externalNotificationService;

        Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService();
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationService.DEFAULT_NAME,
            externalNotificationService.name,
            'Expected to have the same name as given in the constructor.'
        );
        System.assertEquals(
            new GQLOperationType(TAG_ExtNotificationService.DEFAULT_OPERATION_TYPE).build(),
            externalNotificationService.operationType.build(),
            'Expected to have the same operationType as given in the constructor.'
        );
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-23 Created.
     */
    @IsTest
    static void testConstructorWithNamePositive() {
        TAG_ExtNotificationService externalNotificationService;
        String name = 'Test name';

        Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService(name);
        Test.stopTest();

        System.assertEquals(
            name,
            externalNotificationService.name,
            'Expected to have the same name as given in the constructor.'
        );
        System.assertEquals(
            new GQLOperationType(TAG_ExtNotificationService.DEFAULT_OPERATION_TYPE).build(),
            externalNotificationService.operationType.build(),
            'Expected to have the same operationType as given in the constructor.'
        );
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-23 Created.
     */
    @IsTest
    static void testConstructorWithOperationTypePositive() {
        TAG_ExtNotificationService externalNotificationService;
        GQLOperationType_e operationType = GQLOperationType_e.MUTATION;

        Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService(operationType);
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationService.DEFAULT_NAME,
            externalNotificationService.name,
            'Expected to have the same name as given in the constructor.'
        );
        System.assertEquals(
            new GQLOperationType(operationType).build(),
            externalNotificationService.operationType.build(),
            'Expected to have the same operationType as given in the constructor.'
        );
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-23 Created.
     */
    @IsTest
    static void testConstructorWithNameAndOperationTypePositive() {
        TAG_ExtNotificationService externalNotificationService;
        String name = 'Test name';
        GQLOperationType_e operationType = GQLOperationType_e.MUTATION;

        Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService(name, operationType);
        Test.stopTest();

        System.assertEquals(
            name,
            externalNotificationService.name,
            'Expected to have the same name as given in the constructor.'
        );
        System.assertEquals(
            new GQLOperationType(operationType).build(),
            externalNotificationService.operationType.build(),
            'Expected to have the same operationType as given in the constructor.'
        );
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-28 Created.
     */
    @IsTest
    static void testNotificationBuilderPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.notificationBuilder();
        Test.stopTest();

        String expected = JSON.serialize(TAG_ExtNotificationBuilder.start());
        String actual = JSON.serialize(externalNotificationService.notificationBuilder);
        System.assertEquals(expected, actual, 'Expected to have the same notification content from both.');
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-28 Created.
     */
    @IsTest
    static void testConstructorWithExternalNotificationBuilderPositive() {
        TAG_ExtNotificationService externalNotificationService;

        Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService();
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationService.DEFAULT_NAME,
            externalNotificationService.name,
            'Expected to have the same name as given in the constructor.'
        );
        System.assertEquals(
            new GQLOperationType(TAG_ExtNotificationService.DEFAULT_OPERATION_TYPE).build(),
            externalNotificationService.operationType.build(),
            'Expected to have the same operationType as given in the constructor.'
        );

        String expected = JSON.serialize(TAG_ExtNotificationBuilder.start());
        String actual = JSON.serialize(externalNotificationService.notificationBuilder);
        System.assertEquals(expected, actual, 'Expected to have the same notification content from both.');
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSmsNotificationWithDispatchTimePositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        String phoneNumber = 'phoneNumber Test';
        String smsText = 'smsText Test';
        String dispatchTime = 'dispatchTime Test';

        Test.startTest();
        externalNotificationService.smsNotification(phoneNumber, smsText, dispatchTime);
        Test.stopTest();

        TAG_ExtNotificationModel.NyBeskjedInput newMessage = externalNotificationService.notificationBuilder.build();

        System.assertEquals(phoneNumber, newMessage.eksterneVarsler.sms.mottaker.kontaktinfo.tlf);
        System.assertEquals(smsText, newMessage.eksterneVarsler.sms.smsTekst);
        System.assertEquals(dispatchTime, newMessage.eksterneVarsler.sms.sendetidspunkt.tidspunkt);
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSmsNotificationDispatchWindowPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        String phoneNumber = 'phoneNumber Test';
        String smsText = 'smsText Test';
        TAG_DispatchWindow_e dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;

        Test.startTest();
        externalNotificationService.smsNotification(phoneNumber, smsText, dispatchWindow);
        Test.stopTest();

        TAG_ExtNotificationModel.NyBeskjedInput newMessage = externalNotificationService.notificationBuilder.build();

        System.assertEquals(phoneNumber, newMessage.eksterneVarsler.sms.mottaker.kontaktinfo.tlf);
        System.assertEquals(smsText, newMessage.eksterneVarsler.sms.smsTekst);
        System.assertEquals(
            TAG_ExtNotificationUtilities.convertDispatchWindow(dispatchWindow),
            newMessage.eksterneVarsler.sms.sendetidspunkt.sendevindu,
            'Expected to have the value "' + dispatchWindow + '" returned from the "sendetidspunkt.sendevindu" field.'
        );
    }

    /**
     * @description Testing that the method `useVariableAnsattFnr` is setting
     * the variable `useAnsattFnr` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableAnsattFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableAnsattFnr();
        Test.stopTest();

        System.assert(
            externalNotificationService.useAnsattFnr,
            'Expected to have the variable "useAnsattFnr" set to "true".'
        );
    }

    /**
     * @description Testing that the method `unuseVariableAnsattFnr` is setting
     * the variable `useAnsattFnr` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableAnsattFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useAnsattFnr = true;

        Test.startTest();
        externalNotificationService.unuseVariableAnsattFnr();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useAnsattFnr,
            'Expected to have the variable "useAnsattFnr" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableAnsattFnr` is setting
     * the variable `valueAnsattFnr` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableAnsattFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String ansattFnr = 'ansattFnr Test';

        Test.startTest();
        externalNotificationService.setVariableAnsattFnr(ansattFnr);
        Test.stopTest();

        System.assertEquals(
            ansattFnr,
            externalNotificationService.valueAnsattFnr,
            'Expected to have the variable "valueAnsattFnr" set to the value "' + ansattFnr + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableAnsattFnr` is setting
     * the variable `useAnsattFnr` to `true`and that the method
     * `setVariableAnsattFnr` is setting the variable `valueAnsattFnr` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableAnsattFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String ansattFnr = 'ansattFnr Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableAnsattFnr(ansattFnr);
        Test.stopTest();

        System.assert(
            externalNotificationService.useAnsattFnr,
            'Expected to have the variable "useAnsattFnr" set to "true".'
        );
        System.assertEquals(
            ansattFnr,
            externalNotificationService.valueAnsattFnr,
            'Expected to have the variable "valueAnsattFnr" set to the value "' + ansattFnr + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableEksternId` is setting
     * the variable `useEksternId` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableEksternIdMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableEksternId();
        Test.stopTest();

        System.assert(
            externalNotificationService.useEksternId,
            'Expected to have the variable "useEksternId" set to "true".'
        );
    }

    /**
     * @description Testing that the method `unuseVariableEksternId` is setting
     * the variable `useEksternId` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableEksternIdMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useEksternId = true;

        Test.startTest();
        externalNotificationService.unuseVariableEksternId();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useEksternId,
            'Expected to have the variable "useEksternId" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableEksternId` is setting
     * the variable `valueEksternId` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableEksternIdMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String eksternId = 'eksternId Test';

        Test.startTest();
        externalNotificationService.setVariableEksternId(eksternId);
        Test.stopTest();

        System.assertEquals(
            eksternId,
            externalNotificationService.valueEksternId,
            'Expected to have the variable "valueEksternId" set to the value "' + eksternId + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableEksternId` is setting
     * the variable `useEksternId` to `true`and that the method
     * `setVariableEksternId` is setting the variable `valueEksternId` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableEksternIdMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String eksternId = 'eksternId Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableEksternId(eksternId);
        Test.stopTest();

        System.assert(
            externalNotificationService.useEksternId,
            'Expected to have the variable "useEksternId" set to "true".'
        );
        System.assertEquals(
            eksternId,
            externalNotificationService.valueEksternId,
            'Expected to have the variable "valueEksternId" set to the value "' + eksternId + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableEpost` is setting
     * the variable `useEpost` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableEpostMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableEpost();
        Test.stopTest();

        System.assert(externalNotificationService.useEpost, 'Expected to have the variable "useEpost" set to "true".');
    }

    /**
     * @description Testing that the method `unuseVariableEpost` is setting
     * the variable `useEpost` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableEpostMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useEpost = true;

        Test.startTest();
        externalNotificationService.unuseVariableEpost();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useEpost,
            'Expected to have the variable "useEpost" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableEpost` is setting
     * the variable `valueEpost` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableEpostMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String epost = 'epost Test';

        Test.startTest();
        externalNotificationService.setVariableEpost(epost);
        Test.stopTest();

        System.assertEquals(
            epost,
            externalNotificationService.valueEpost,
            'Expected to have the variable "valueEpost" set to the value "' + epost + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableEpost` is setting
     * the variable `useEpost` to `true`and that the method
     * `setVariableEpost` is setting the variable `valueEpost` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableEpostMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String epost = 'epost Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableEpost(epost);
        Test.stopTest();

        System.assert(externalNotificationService.useEpost, 'Expected to have the variable "useEpost" set to "true".');
        System.assertEquals(
            epost,
            externalNotificationService.valueEpost,
            'Expected to have the variable "valueEpost" set to the value "' + epost + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableEpostHtmlBody` is
     * setting the variable `useEpostHtmlBody` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableEpostHtmlBodyMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableEpostHtmlBody();
        Test.stopTest();

        System.assert(
            externalNotificationService.useEpostHtmlBody,
            'Expected to have the variable "useEpostHtmlBody" set to "true".'
        );
    }

    /**
     * @description Testing that the method `unuseVariableEpostHtmlBody` is
     * setting the variable `useEpostHtmlBody` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableEpostHtmlBodyMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useEpostHtmlBody = true;

        Test.startTest();
        externalNotificationService.unuseVariableEpostHtmlBody();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useEpostHtmlBody,
            'Expected to have the variable "useEpostHtmlBody" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableEpostHtmlBody` is setting
     * the variable `valueEpostHtmlBody` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableEpostHtmlBodyMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String epostHtmlBody = 'epostHtmlBody Test';

        Test.startTest();
        externalNotificationService.setVariableEpostHtmlBody(epostHtmlBody);
        Test.stopTest();

        System.assertEquals(
            epostHtmlBody,
            externalNotificationService.valueEpostHtmlBody,
            'Expected to have the variable "valueEpostHtmlBody" set to the value "' + epostHtmlBody + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableEpostHtmlBody` is setting
     * the variable `useEpostHtmlBody` to `true`and that the method
     * `setVariableEpostHtmlBody` is setting the variable `valueEpostHtmlBody` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableEpostHtmlBodyMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String epostHtmlBody = 'epostHtmlBody Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableEpostHtmlBody(epostHtmlBody);
        Test.stopTest();

        System.assert(
            externalNotificationService.useEpostHtmlBody,
            'Expected to have the variable "useEpostHtmlBody" set to "true".'
        );
        System.assertEquals(
            epostHtmlBody,
            externalNotificationService.valueEpostHtmlBody,
            'Expected to have the variable "valueEpostHtmlBody" set to the value "' + epostHtmlBody + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableLenke` is setting the
     * variable `useLenke` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableLenkeMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableLenke();
        Test.stopTest();

        System.assert(externalNotificationService.useLenke, 'Expected to have the variable "useLenke" set to "true".');
    }

    /**
     * @description Testing that the method `unuseVariableLenke` is setting the
     * variable `useLenke` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableLenkeMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useLenke = true;

        Test.startTest();
        externalNotificationService.unuseVariableLenke();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useLenke,
            'Expected to have the variable "useLenke" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableLenke` is setting
     * the variable `valueLenke` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableLenkeMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String lenke = 'lenke Test';

        Test.startTest();
        externalNotificationService.setVariableLenke(lenke);
        Test.stopTest();

        System.assertEquals(
            lenke,
            externalNotificationService.valueLenke,
            'Expected to have the variable "valueLenke" set to the value "' + lenke + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableLenke` is setting
     * the variable `useLenke` to `true`and that the method
     * `setVariableLenke` is setting the variable `valueLenke` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableLenkeMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String lenke = 'lenke Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableLenke(lenke);
        Test.stopTest();

        System.assert(externalNotificationService.useLenke, 'Expected to have the variable "useLenke" set to "true".');
        System.assertEquals(
            lenke,
            externalNotificationService.valueLenke,
            'Expected to have the variable "valueLenke" set to the value "' + lenke + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableNaermesteLederFnr` is
     * setting the variable `useNaermesteLederFnr` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableNaermesteLederFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableNaermesteLederFnr();
        Test.stopTest();

        System.assert(
            externalNotificationService.useNaermesteLederFnr,
            'Expected to have the variable "useNaermesteLederFnr" set to "true".'
        );
    }

    /**
     * @description Testing that the method `unuseVariableNaermesteLederFnr` is
     * setting the variable `useNaermesteLederFnr` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableNaermesteLederFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useNaermesteLederFnr = true;

        Test.startTest();
        externalNotificationService.unuseVariableNaermesteLederFnr();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useNaermesteLederFnr,
            'Expected to have the variable "useNaermesteLederFnr" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableNaermesteLederFnr` is setting
     * the variable `valueNaermesteLederFnr` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableNaermesteLederFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String naermesteLederFnr = 'naermesteLederFnr Test';

        Test.startTest();
        externalNotificationService.setVariableNaermesteLederFnr(naermesteLederFnr);
        Test.stopTest();

        System.assertEquals(
            naermesteLederFnr,
            externalNotificationService.valueNaermesteLederFnr,
            'Expected to have the variable "valueNaermesteLederFnr" set to the value "' + naermesteLederFnr + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableNaermesteLederFnr` is setting
     * the variable `useNaermesteLederFnr` to `true`and that the method
     * `setVariableNaermesteLederFnr` is setting the variable `valueNaermesteLederFnr` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableNaermesteLederFnrMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String naermesteLederFnr = 'naermesteLederFnr Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableNaermesteLederFnr(naermesteLederFnr);
        Test.stopTest();

        System.assert(
            externalNotificationService.useNaermesteLederFnr,
            'Expected to have the variable "useNaermesteLederFnr" set to "true".'
        );
        System.assertEquals(
            naermesteLederFnr,
            externalNotificationService.valueNaermesteLederFnr,
            'Expected to have the variable "valueNaermesteLederFnr" set to the value "' + naermesteLederFnr + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableTlf` is setting the
     * variable `useTlf` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableTlfMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableTlf();
        Test.stopTest();

        System.assert(externalNotificationService.useTlf, 'Expected to have the variable "useTlf" set to "true".');
    }

    /**
     * @description Testing that the method `unuseVariableTlf` is setting the
     * variable `useTlf` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableTlfMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useTlf = true;

        Test.startTest();
        externalNotificationService.unuseVariableTlf();
        Test.stopTest();

        System.assert(!externalNotificationService.useTlf, 'Expected to have the variable "useTlf" set to "false".');
    }

    /**
     * @description Testing that the method `setVariableTlf` is setting
     * the variable `valueTlf` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableTlfMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String tlf = 'tlf Test';

        Test.startTest();
        externalNotificationService.setVariableTlf(tlf);
        Test.stopTest();

        System.assertEquals(
            tlf,
            externalNotificationService.valueTlf,
            'Expected to have the variable "valueTlf" set to the value "' + tlf + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableTlf` is setting
     * the variable `useTlf` to `true`and that the method
     * `setVariableTlf` is setting the variable `valueTlf` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableTlfMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String tlf = 'tlf Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableTlf(tlf);
        Test.stopTest();

        System.assert(externalNotificationService.useTlf, 'Expected to have the variable "useTlf" set to "true".');
        System.assertEquals(
            tlf,
            externalNotificationService.valueTlf,
            'Expected to have the variable "valueTlf" set to the value "' + tlf + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableVirksomhetsnummer` is setting the
     * variable `useVirksomhetsnummer` to `true`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseVariableVirksomhetsnummerMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();

        Test.startTest();
        externalNotificationService.useVariableVirksomhetsnummer();
        Test.stopTest();

        System.assert(
            externalNotificationService.useVirksomhetsnummer,
            'Expected to have the variable "useVirksomhetsnummer" set to "true".'
        );
    }

    /**
     * @description Testing that the method `unuseVariableVirksomhetsnummer` is setting the
     * variable `useVirksomhetsnummer` to `false`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUnuseVariableVirksomhetsnummerMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.useVirksomhetsnummer = true;

        Test.startTest();
        externalNotificationService.unuseVariableVirksomhetsnummer();
        Test.stopTest();

        System.assert(
            !externalNotificationService.useVirksomhetsnummer,
            'Expected to have the variable "useVirksomhetsnummer" set to "false".'
        );
    }

    /**
     * @description Testing that the method `setVariableVirksomhetsnummer` is setting
     * the variable `valueVirksomhetsnummer` to the provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testSetVariableVirksomhetsnummerMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String virksomhetsnummer = 'virksomhetsnummer Test';

        Test.startTest();
        externalNotificationService.setVariableVirksomhetsnummer(virksomhetsnummer);
        Test.stopTest();

        System.assertEquals(
            virksomhetsnummer,
            externalNotificationService.valueVirksomhetsnummer,
            'Expected to have the variable "valueVirksomhetsnummer" set to the value "' + virksomhetsnummer + '".'
        );
    }

    /**
     * @description Testing that the method `useVariableVirksomhetsnummer` is setting
     * the variable `useVirksomhetsnummer` to `true`and that the method
     * `setVariableVirksomhetsnummer` is setting the variable `valueVirksomhetsnummer` to the
     * provided value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-01 Created.
     */
    @IsTest
    static void testUseAndSetVariableVirksomhetsnummerMethodPositive() {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        String virksomhetsnummer = 'virksomhetsnummer Test';

        Test.startTest();
        externalNotificationService.useAndSetVariableVirksomhetsnummer(virksomhetsnummer);
        Test.stopTest();

        System.assert(
            externalNotificationService.useVirksomhetsnummer,
            'Expected to have the variable "useVirksomhetsnummer" set to "true".'
        );
        System.assertEquals(
            virksomhetsnummer,
            externalNotificationService.valueVirksomhetsnummer,
            'Expected to have the variable "valueVirksomhetsnummer" set to the value "' + virksomhetsnummer + '".'
        );
    }

    /**
     * @description Testing
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-03-02 Created.
     */
    @IsTest
    static void methodName() {
        TAG_ExtNotificationService externalNotificationService;

        String ansattFnr = 'anattFnr Test';
        String eksternId = 'eksternId Test';
        String epost = 'epost Test';
        String epostHtmlBody = 'epostHtmlBody Test';
        String lenke = 'lenke Test';
        String naermesteLederFnr = 'naermesteLederFnr Test';
        String tlf = 'tlf Test';
        String virksomhetsnummer = 'virksomhetsnummer Test';

        List<GQLVariable> gqlVariables = new List<GQLVariable>();

        Test.startTest();
        externalNotificationService = new TAG_ExtNotificationService()
            .useAndSetVariableAnsattFnr(ansattFnr)
            .useAndSetVariableEksternId(eksternId)
            .useAndSetVariableEpost(epost)
            .useAndsetVariableEpostHtmlBody(epostHtmlBody)
            .useAndsetVariableLenke(lenke)
            .useAndsetVariableNaermesteLederFnr(naermesteLederFnr)
            .useAndSetVariableTlf(tlf)
            .useAndSetVariableVirksomhetsnummer(virksomhetsnummer);

        gqlVariables = externalNotificationService.buildGQLVariable();
        Test.stopTest();

        //System.debug(JSON.serializePretty(gqlVariables));
        //System.debug('gqlVariables[0].getName(): ' + gqlVariables[0].getName());
        System.assertEquals('ansattFnr', gqlVariables[0].getName(), 'Expected');
        System.assertEquals('eksternId', gqlVariables[1].getName(), 'Expected');
        System.assertEquals('epost', gqlVariables[2].getName(), 'Expected');
        System.assertEquals('epostHtmlBody', gqlVariables[3].getName(), 'Expected');
        System.assertEquals('lenke', gqlVariables[4].getName(), 'Expected');
        System.assertEquals('naermesteLederFnr', gqlVariables[5].getName(), 'Expected');
        System.assertEquals('tlf', gqlVariables[6].getName(), 'Expected');
        System.assertEquals('virksomhetsnummer', gqlVariables[7].getName(), 'Expected');
    }
    /*
    @IsTest
    private static void test() {
        TAG_ExtNotificationService externalNotificationService;

        String phoneNumber = 'phoneNumber Test';

        Test.startTest();*/
    /*externalNotificationService = TAG_ExtNotificationService.start()
            .withSMSNotification(
                TAG_SMSNotificationBuilder.start()
                    .text('test')
                    .recipient('+47 950 62 297')
                    //.dispatchTime('2001-12-24T10:44:01')
                    .dispatchWindow(TAG_DispatchWindow_e.NKS_BUSINESS_HOURS)
            );*/
    /*

        externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.smsNotification(phoneNumber, 'smsText', 'dispatchTime')
            .useAndSetVariableAnsattFnr('ansattFnr Test')
            .useVariableEksternId()
            .useVariableEpost()
            .useVariableEpostHtmlBody()
            .useVariableLenke()
            .useVariableNaermesteLederFnr()
            .useVariableTlf()
            .useVariableVirksomhetsnummer()
            .build();
        System.debug(externalNotificationService.getQuery().build());
        Test.stopTest();*/

    /*System.assertEquals(
            new TAG_ExtNotificationModel.EksterntVarselInput(),
            externalNotificationService.build().eksterneVarsler,
            'msg'
        );*/
    /*
        //System.assert(phoneNumber, actual);
    }*/
}
