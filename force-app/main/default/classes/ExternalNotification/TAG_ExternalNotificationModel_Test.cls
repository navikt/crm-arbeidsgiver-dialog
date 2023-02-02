/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-01-17 Created.
 *
 * @group TAG External Notification
 * @see
 */
@IsTest
private class TAG_ExternalNotificationModel_Test {
    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.AltinnMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExternalNotificationModel.AltinnMottakerInput
     */
    @IsTest
    private static void testAltinnMottakerInput() {
        TAG_ExternalNotificationModel.AltinnMottakerInput altinnMottakerInput;
        String serviceCode = 'serviceCode Test';
        String serviceEdition = 'serviceEdition Test';

        Test.startTest();
        altinnMottakerInput = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        altinnMottakerInput.serviceCode = serviceCode;
        altinnMottakerInput.serviceEdition = serviceEdition;
        Test.stopTest();

        System.assertEquals(
            serviceCode,
            altinnMottakerInput.serviceCode,
            'Expected to have the value "' +
            serviceCode +
            '" returned.'
        );
        System.assertEquals(
            serviceEdition,
            altinnMottakerInput.serviceEdition,
            'Expected to have the value "' +
            serviceEdition +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.NaermesteLederMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExternalNotificationModel.NaermesteLederMottakerInput
     */
    @IsTest
    private static void testNaermesteLederMottakerInput() {
        TAG_ExternalNotificationModel.NaermesteLederMottakerInput naermesteLederMottakerInput;
        String ansattFnr = 'anattFnr Test';
        String naermesteLederFnr = 'naermesteLederFnr Test';

        Test.startTest();
        naermesteLederMottakerInput = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        naermesteLederMottakerInput.ansattFnr = ansattFnr;
        naermesteLederMottakerInput.naermesteLederFnr = naermesteLederFnr;
        Test.stopTest();

        System.assertEquals(
            ansattFnr,
            naermesteLederMottakerInput.ansattFnr,
            'Expected to have the value "' +
            ansattFnr +
            '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr,
            naermesteLederMottakerInput.naermesteLederFnr,
            'Expected to have the value "' +
            naermesteLederFnr +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.AltinnRolleMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExternalNotificationModel.AltinnRolleMottakerInput
     */
    @IsTest
    private static void testAltinnRolleMottakerInput() {
        TAG_ExternalNotificationModel.AltinnRolleMottakerInput altinnRolleMottakerInput;
        String roleDefinitionCode = 'roleDefinitionCode Test';

        Test.startTest();
        altinnRolleMottakerInput = new TAG_ExternalNotificationModel.AltinnRolleMottakerInput();
        altinnRolleMottakerInput.roleDefinitionCode = roleDefinitionCode;
        Test.stopTest();

        System.assertEquals(
            roleDefinitionCode,
            altinnRolleMottakerInput.roleDefinitionCode,
            'Expected to have the value "' +
            roleDefinitionCode +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.AltinnReporteeMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExternalNotificationModel.AltinnReporteeMottakerInput
     */
    @IsTest
    private static void testAltinnReporteeMottakerInput() {
        TAG_ExternalNotificationModel.AltinnReporteeMottakerInput altinnReporteeMottakerInput;
        String fnr = 'fnr Test';

        Test.startTest();
        altinnReporteeMottakerInput = new TAG_ExternalNotificationModel.AltinnReporteeMottakerInput();
        altinnReporteeMottakerInput.fnr = fnr;
        Test.stopTest();

        System.assertEquals(fnr, altinnReporteeMottakerInput.fnr, 'Expected to have the value "' + fnr + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.NotifikasjonInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-18 Created.
     *
     * @see TAG_ExternalNotificationModel.NotifikasjonInput
     */
    @IsTest
    private static void testNotifikasjonInput() {
        TAG_ExternalNotificationModel.NotifikasjonInput notifikasjonInput;
        String lenke = 'lenke Test';
        String merkelapp = 'merkelapp Test';
        String tekst = 'tekst Test';

        Test.startTest();
        notifikasjonInput = new TAG_ExternalNotificationModel.NotifikasjonInput();
        notifikasjonInput.lenke = lenke;
        notifikasjonInput.merkelapp = merkelapp;
        notifikasjonInput.tekst = tekst;
        Test.stopTest();

        System.assertEquals(lenke, notifikasjonInput.lenke, 'Excpected to have the value "' + lenke + '" returned.');
        System.assertEquals(
            merkelapp,
            notifikasjonInput.merkelapp,
            'Excpected to have the value "' +
            merkelapp +
            '" returned.'
        );
        System.assertEquals(tekst, notifikasjonInput.tekst, 'Excpected to have the value "' + tekst + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.FutureTemporalInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-18 Created.
     *
     * @see TAG_ExternalNotificationModel.FutureTemporalInput
     */
    @IsTest
    private static void testFutureTemporalInput() {
        TAG_ExternalNotificationModel.FutureTemporalInput futureTemporalInput;
        String den = 'den Test';
        String om = 'om Test';

        Test.startTest();
        futureTemporalInput = new TAG_ExternalNotificationModel.FutureTemporalInput();
        futureTemporalInput.den = den;
        futureTemporalInput.om = om;
        Test.stopTest();

        System.assertEquals(den, futureTemporalInput.den, 'Excpected to have the value "' + den + '" returned.');
        System.assertEquals(om, futureTemporalInput.om, 'Excpected to have the value "' + om + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.MetadataInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-18 Created.
     *
     * @see TAG_ExternalNotificationModel.MetadataInput
     */
    @IsTest
    private static void testMetadataInput() {
        TAG_ExternalNotificationModel.MetadataInput metadataInput;
        String eksternId = 'eksternId Test';
        String grupperingsid = 'grupperingsid Test';
        String den = 'hardDelete.den Test';
        String om = 'hardDelete.om Test';
        String opprettetTidspunkt = 'opprettetTidspunkt Test';
        String virksomhetsnummer = 'virksomhetsnummer Test';

        Test.startTest();
        metadataInput = new TAG_ExternalNotificationModel.MetadataInput();
        metadataInput.eksternId = eksternId;
        metadataInput.grupperingsid = grupperingsid;
        metadataInput.hardDelete = new TAG_ExternalNotificationModel.FutureTemporalInput();
        metadataInput.hardDelete.den = den;
        metadataInput.hardDelete.om = om;
        metadataInput.opprettetTidspunkt = opprettetTidspunkt;
        metadataInput.virksomhetsnummer = virksomhetsnummer;
        Test.stopTest();

        System.assertEquals(
            eksternId,
            metadataInput.eksternId,
            'Excpected to have the value "' +
            eksternId +
            '" returned.'
        );
        System.assertEquals(
            grupperingsid,
            metadataInput.grupperingsid,
            'Excpected to have the value "' +
            grupperingsid +
            '" returned.'
        );
        System.assertEquals(den, metadataInput.hardDelete.den, 'Excpected to have the value "' + den + '" returned.');
        System.assertEquals(om, metadataInput.hardDelete.om, 'Excpected to have the value "' + om + '" returned.');
        System.assertEquals(
            opprettetTidspunkt,
            metadataInput.opprettetTidspunkt,
            'Excpected to have the value "' +
            opprettetTidspunkt +
            '" returned.'
        );
        System.assertEquals(
            virksomhetsnummer,
            metadataInput.virksomhetsnummer,
            'Excpected to have the value "' +
            virksomhetsnummer +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.SmsKontaktInfoInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.SmsKontaktInfoInput
     */
    @IsTest
    private static void testSmsKontaktInfoInput() {
        TAG_ExternalNotificationModel.SmsKontaktInfoInput smsKontaktInfoInput;
        String tlf = 'tlf Test';

        Test.startTest();
        smsKontaktInfoInput = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();
        smsKontaktInfoInput.tlf = tlf;
        Test.stopTest();

        System.assertEquals(tlf, smsKontaktInfoInput.tlf, 'Excpected to have the value "' + tlf + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.SmsMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.SmsMottakerInput
     */
    @IsTest
    private static void testSmsMottakerInput() {
        TAG_ExternalNotificationModel.SmsMottakerInput smsMottakerInput;
        String tlf = 'tlf Test';

        Test.startTest();
        smsMottakerInput = new TAG_ExternalNotificationModel.SmsMottakerInput();
        smsMottakerInput.kontaktinfo = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();
        smsMottakerInput.kontaktinfo.tlf = tlf;
        Test.stopTest();

        System.assertEquals(
            tlf,
            smsMottakerInput.kontaktinfo.tlf,
            'Excpected to have the value "' +
            tlf +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.EksterntVarselSmsInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.EksterntVarselSmsInput
     */
    @IsTest
    private static void testEksterntVarselSmsInput() {
        TAG_ExternalNotificationModel.EksterntVarselSmsInput eksterntVarselSmsInput;
        String tlf = 'tlf Test';
        String tidspunkt = 'tidspunkt Test';
        String smsTekst = 'smsTekst Test';

        Test.startTest();
        eksterntVarselSmsInput = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        eksterntVarselSmsInput.mottaker = new TAG_ExternalNotificationModel.SmsMottakerInput();
        eksterntVarselSmsInput.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();
        eksterntVarselSmsInput.mottaker.kontaktinfo.tlf = tlf;
        eksterntVarselSmsInput.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        eksterntVarselSmsInput.sendetidspunkt.sendevindu = TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        eksterntVarselSmsInput.sendetidspunkt.tidspunkt = tidspunkt;
        eksterntVarselSmsInput.smsTekst = smsTekst;
        Test.stopTest();

        System.assertEquals(
            tlf,
            eksterntVarselSmsInput.mottaker.kontaktinfo.tlf,
            'Excpected to have the value "' +
            tlf +
            '" returned.'
        );
        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            eksterntVarselSmsInput.sendetidspunkt.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselSmsInput.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
        System.assertEquals(
            smsTekst,
            eksterntVarselSmsInput.smsTekst,
            'Excpected to have the value "' +
            smsTekst +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.EpostKontaktInfoInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.EpostKontaktInfoInput
     */
    @IsTest
    static void testEpostKontaktInfoInput() {
        TAG_ExternalNotificationModel.EpostKontaktInfoInput epostKontaktInfoInput;
        String epostadresse = 'epostadresse Test';

        Test.startTest();
        epostKontaktInfoInput = new TAG_ExternalNotificationModel.EpostKontaktInfoInput();
        epostKontaktInfoInput.epostadresse = epostadresse;
        Test.stopTest();

        System.assertEquals(
            epostadresse,
            epostKontaktInfoInput.epostadresse,
            'Excpected to have the value "' +
            epostadresse +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.EpostMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.EpostMottakerInput
     */
    @IsTest
    static void testEpostMottakerInput() {
        TAG_ExternalNotificationModel.EpostMottakerInput epostMottakerInput;
        String epostadresse = 'epostadresse Test';

        Test.startTest();
        epostMottakerInput = new TAG_ExternalNotificationModel.EpostMottakerInput();
        epostMottakerInput.kontaktinfo = new TAG_ExternalNotificationModel.EpostKontaktInfoInput();
        epostMottakerInput.kontaktinfo.epostadresse = epostadresse;
        Test.stopTest();

        System.assertEquals(
            epostadresse,
            epostMottakerInput.kontaktinfo.epostadresse,
            'Excpected to have the value "' +
            epostadresse +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.SendetidspunktInput
     */
    @SuppressWarnings('PMD.MethodNamingConventions')
    @IsTest
    static void testSendetidspunktInputWithNKS_AAPNINGSTID() {
        TAG_ExternalNotificationModel.SendetidspunktInput sendetidspunktInput;
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        sendetidspunktInput = new TAG_ExternalNotificationModel.SendetidspunktInput();
        sendetidspunktInput.sendevindu = TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        sendetidspunktInput.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            sendetidspunktInput.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            sendetidspunktInput.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.SendetidspunktInput
     */
    @SuppressWarnings('PMD.MethodNamingConventions')
    @IsTest
    static void testSendetidspunktInputWithDAGTID_IKKE_SOENDAG() {
        TAG_ExternalNotificationModel.SendetidspunktInput sendetidspunktInput;
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        sendetidspunktInput = new TAG_ExternalNotificationModel.SendetidspunktInput();
        sendetidspunktInput.sendevindu = TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        sendetidspunktInput.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            sendetidspunktInput.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            sendetidspunktInput.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExternalNotificationModel.SendetidspunktInput
     */
    @SuppressWarnings('PMD.MethodNamingConventions')
    @IsTest
    static void testSendetidspunktInputWithLOEPENDE() {
        TAG_ExternalNotificationModel.SendetidspunktInput sendetidspunktInput;
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        sendetidspunktInput = new TAG_ExternalNotificationModel.SendetidspunktInput();
        sendetidspunktInput.sendevindu = TAG_ExternalNotificationModel.Sendevindu.LOEPENDE;
        sendetidspunktInput.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.LOEPENDE,
            sendetidspunktInput.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.LOEPENDE +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            sendetidspunktInput.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExternalNotificationModel.SendetidspunktInput
     */
    @IsTest
    private static void testEksterntVarselEpostInput() {
        TAG_ExternalNotificationModel.EksterntVarselEpostInput eksterntVarselEpostInput;
        String epostadresse = 'epostadresse Test';
        String epostTittel = 'eposttittel Test';
        String epostHtmlBody = 'epostHtmlBody Test';
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        eksterntVarselEpostInput = new TAG_ExternalNotificationModel.EksterntVarselEpostInput();
        eksterntVarselEpostInput.mottaker = new TAG_ExternalNotificationModel.EpostMottakerInput();
        eksterntVarselEpostInput.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.EpostKontaktInfoInput();
        eksterntVarselEpostInput.mottaker.kontaktinfo.epostadresse = epostadresse;
        eksterntVarselEpostInput.epostTittel = epostTittel;
        eksterntVarselEpostInput.epostHtmlBody = epostHtmlBody;
        eksterntVarselEpostInput.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        eksterntVarselEpostInput.sendetidspunkt.sendevindu = TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        eksterntVarselEpostInput.sendetidspunkt.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            epostadresse,
            eksterntVarselEpostInput.mottaker.kontaktinfo.epostadresse,
            'Excpected to have the value "' +
            epostadresse +
            '" returned.'
        );
        System.assertEquals(
            epostTittel,
            eksterntVarselEpostInput.epostTittel,
            'Excpected to have the value "' +
            epostTittel +
            '" returned.'
        );
        System.assertEquals(
            epostHtmlBody,
            eksterntVarselEpostInput.epostHtmlBody,
            'Excpected to have the value "' +
            epostHtmlBody +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselEpostInput.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            eksterntVarselEpostInput.sendetidspunkt.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.EksterntVarselInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExternalNotificationModel.EksterntVarselInput
     */
    @IsTest
    private static void testEksterntVarselInput() {
        TAG_ExternalNotificationModel.EksterntVarselInput eksterntVarselInput;
        String epostHtmlBody = 'epostHtmlBody Test';
        String epostTittel = 'epostTittel Test';
        String epostadresse = 'epostadresse Test';
        String tidspunkt = 'tidspunkt Test';
        String tlf = 'tlf Test';
        String sendetidspunkt = 'sendetidspunkt Test';
        String smsTekst = 'smsTekst Test';

        Test.startTest();
        eksterntVarselInput = new TAG_ExternalNotificationModel.EksterntVarselInput();
        eksterntVarselInput.epost = new TAG_ExternalNotificationModel.EksterntVarselEpostInput();
        eksterntVarselInput.epost.epostHtmlBody = epostHtmlBody;
        eksterntVarselInput.epost.epostTittel = epostTittel;
        eksterntVarselInput.epost.mottaker = new TAG_ExternalNotificationModel.EpostMottakerInput();
        eksterntVarselInput.epost.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.EpostKontaktInfoInput();
        eksterntVarselInput.epost.mottaker.kontaktinfo.epostadresse = epostadresse;
        eksterntVarselInput.epost.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        eksterntVarselInput.epost.sendetidspunkt.sendevindu = TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        eksterntVarselInput.epost.sendetidspunkt.tidspunkt = tidspunkt;
        eksterntVarselInput.sms = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        eksterntVarselInput.sms.mottaker = new TAG_ExternalNotificationModel.SmsMottakerInput();
        eksterntVarselInput.sms.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();
        eksterntVarselInput.sms.mottaker.kontaktinfo.tlf = tlf;
        eksterntVarselInput.sms.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        eksterntVarselInput.sms.sendetidspunkt.sendevindu = TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        eksterntVarselInput.sms.sendetidspunkt.tidspunkt = tidspunkt;
        eksterntVarselInput.sms.smsTekst = smsTekst;
        Test.stopTest();

        System.assertEquals(
            epostHtmlBody,
            eksterntVarselInput.epost.epostHtmlBody,
            'Excpected to have the value "' +
            epostHtmlBody +
            '" returned.'
        );
        System.assertEquals(
            epostTittel,
            eksterntVarselInput.epost.epostTittel,
            'Excpected to have the value "' +
            epostTittel +
            '" returned.'
        );
        System.assertEquals(
            epostadresse,
            eksterntVarselInput.epost.mottaker.kontaktinfo.epostadresse,
            'Excpected to have the value "' +
            epostadresse +
            '" returned.'
        );
        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            eksterntVarselInput.epost.sendetidspunkt.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselInput.epost.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
        System.assertEquals(
            tlf,
            eksterntVarselInput.sms.mottaker.kontaktinfo.tlf,
            'Excpected to have the value "' +
            tlf +
            '" returned.'
        );
        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            eksterntVarselInput.sms.sendetidspunkt.sendevindu,
            'Excpected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselInput.sms.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' +
            tidspunkt +
            '" returned.'
        );
        System.assertEquals(
            smsTekst,
            eksterntVarselInput.sms.smsTekst,
            'Excpected to have the value "' +
            smsTekst +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.MottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExternalNotificationModel.MottakerInput
     */
    @IsTest
    static void testMottakerInput() {
        TAG_ExternalNotificationModel.MottakerInput mottaker;
        String serviceCode = 'serviceCode Test';
        String serviceEdition = 'serviceEdition Test';
        String fnr = 'fnr Test';
        String roleDefinitionCode = 'roleDefinitionCode Test';
        String ansattFnr = 'ansattFnr Test';
        String naermesteLederFnr = 'naermesteLederFnr Test';

        Test.startTest();
        mottaker = new TAG_ExternalNotificationModel.MottakerInput();
        mottaker.altinn = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        mottaker.altinn.serviceCode = serviceCode;
        mottaker.altinn.serviceEdition = serviceEdition;
        mottaker.altinnReportee = new TAG_ExternalNotificationModel.AltinnReporteeMottakerInput();
        mottaker.altinnReportee.fnr = fnr;
        mottaker.altinnRolle = new TAG_ExternalNotificationModel.AltinnRolleMottakerInput();
        mottaker.altinnRolle.roleDefinitionCode = roleDefinitionCode;
        mottaker.naermesteLeder = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        mottaker.naermesteLeder.ansattFnr = ansattFnr;
        mottaker.naermesteLeder.naermesteLederFnr = naermesteLederFnr;

        Test.stopTest();

        System.assertEquals(
            serviceCode,
            mottaker.altinn.serviceCode,
            'Expected to have the value "' +
            serviceCode +
            '" returned.'
        );
        System.assertEquals(
            serviceEdition,
            mottaker.altinn.serviceEdition,
            'Expected to have the value "' +
            serviceEdition +
            '" returned.'
        );
        System.assertEquals(fnr, mottaker.altinnReportee.fnr, 'Expected to have the value "' + fnr + '" returned.');
        System.assertEquals(
            roleDefinitionCode,
            mottaker.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' +
            roleDefinitionCode +
            '" returned.'
        );
        System.assertEquals(
            ansattFnr,
            mottaker.naermesteLeder.ansattFnr,
            'Expected to have the value "' +
            ansattFnr +
            '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr,
            mottaker.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' +
            naermesteLederFnr +
            '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExternalNotificationModel.NyBeskjedInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExternalNotificationModel.NyBeskjedInput
     */
    @IsTest
    private static void testNyBeskjedInput() {
        TAG_ExternalNotificationModel.NyBeskjedInput nyBeskjedInput;
        String serviceCode = 'serviceCode Test';
        String serviceEdition = 'serviceEdition Test';
        String fnr = 'fnr Test';
        String roleDefinitionCode = 'roleDefinitionCode Test';
        String ansattFnr = 'ansattFnr Test';
        String naermesteLederFnr = 'naermesteLederFnr Test';
        String eksternId = 'eksternId Test';
        String grupperingsid = 'grupperingsid Test';
        String den = 'den Test';
        String om = 'om Test';
        String lenke = 'lenke Test';
        String merkelapp = 'merkelapp Test';
        String tekst = 'tekst Test';
        String epostHtmlBody = 'epostHtmlBody Test';
        String epostTittel = 'epostTittel Test';
        String epostadresse = 'epostadresse Test';
        String tidspunkt = 'tidspunkt Test';
        String tlf = 'tlf Test';
        String sendetidspunkt = 'sendetidspunkt Test';
        String smsTekst = 'smsTekst Test';

        Test.startTest();
        nyBeskjedInput = new TAG_ExternalNotificationModel.NyBeskjedInput();
        nyBeskjedInput.mottaker = new TAG_ExternalNotificationModel.MottakerInput();
        nyBeskjedInput.mottaker.altinn = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        nyBeskjedInput.mottaker.altinn.serviceCode = serviceCode;
        nyBeskjedInput.mottaker.altinn.serviceEdition = serviceEdition;
        nyBeskjedInput.mottaker.altinnReportee = new TAG_ExternalNotificationModel.AltinnReporteeMottakerInput();
        nyBeskjedInput.mottaker.altinnReportee.fnr = fnr;
        nyBeskjedInput.mottaker.altinnRolle = new TAG_ExternalNotificationModel.AltinnRolleMottakerInput();
        nyBeskjedInput.mottaker.altinnRolle.roleDefinitionCode = roleDefinitionCode;
        nyBeskjedInput.mottaker.naermesteLeder = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        nyBeskjedInput.mottaker.naermesteLeder.ansattFnr = ansattFnr;
        nyBeskjedInput.mottaker.naermesteLeder.naermesteLederFnr = naermesteLederFnr;

        nyBeskjedInput.mottakere = new List<TAG_ExternalNotificationModel.MottakerInput>();

        String mottakerOneTextPostfix = 'One';
        TAG_ExternalNotificationModel.MottakerInput mottakerOne = new TAG_ExternalNotificationModel.MottakerInput();
        mottakerOne.altinn = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        mottakerOne.altinn.serviceCode = serviceCode + mottakerOneTextPostfix;
        mottakerOne.altinn.serviceEdition = serviceEdition + mottakerOneTextPostfix;
        mottakerOne.altinnReportee = new TAG_ExternalNotificationModel.AltinnReporteeMottakerInput();
        mottakerOne.altinnReportee.fnr = fnr + mottakerOneTextPostfix;
        mottakerOne.altinnRolle = new TAG_ExternalNotificationModel.AltinnRolleMottakerInput();
        mottakerOne.altinnRolle.roleDefinitionCode = roleDefinitionCode + mottakerOneTextPostfix;
        mottakerOne.naermesteLeder = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        mottakerOne.naermesteLeder.ansattFnr = ansattFnr + mottakerOneTextPostfix;
        mottakerOne.naermesteLeder.naermesteLederFnr = naermesteLederFnr + mottakerOneTextPostfix;
        nyBeskjedInput.mottakere.add(mottakerOne);

        String mottakerTwoTextPostfix = 'Two';
        TAG_ExternalNotificationModel.MottakerInput mottakerTwo = new TAG_ExternalNotificationModel.MottakerInput();
        mottakerTwo.altinn = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        mottakerTwo.altinn.serviceCode = serviceCode + mottakerTwoTextPostfix;
        mottakerTwo.altinn.serviceEdition = serviceEdition + mottakerTwoTextPostfix;
        mottakerTwo.altinnReportee = new TAG_ExternalNotificationModel.AltinnReporteeMottakerInput();
        mottakerTwo.altinnReportee.fnr = fnr + mottakerTwoTextPostfix;
        mottakerTwo.altinnRolle = new TAG_ExternalNotificationModel.AltinnRolleMottakerInput();
        mottakerTwo.altinnRolle.roleDefinitionCode = roleDefinitionCode + mottakerTwoTextPostfix;
        mottakerTwo.naermesteLeder = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        mottakerTwo.naermesteLeder.ansattFnr = ansattFnr + mottakerTwoTextPostfix;
        mottakerTwo.naermesteLeder.naermesteLederFnr = naermesteLederFnr + mottakerTwoTextPostfix;
        nyBeskjedInput.mottakere.add(mottakerTwo);

        nyBeskjedInput.metadata = new TAG_ExternalNotificationModel.MetadataInput();
        nyBeskjedInput.metadata.eksternId = eksternId;
        nyBeskjedInput.metadata.grupperingsid = grupperingsid;
        nyBeskjedInput.metadata.hardDelete = new TAG_ExternalNotificationModel.FutureTemporalInput();
        nyBeskjedInput.metadata.hardDelete.den = den;
        nyBeskjedInput.metadata.hardDelete.om = om;

        nyBeskjedInput.notifikasjon = new TAG_ExternalNotificationModel.NotifikasjonInput();
        nyBeskjedInput.notifikasjon.lenke = lenke;
        nyBeskjedInput.notifikasjon.merkelapp = merkelapp;
        nyBeskjedInput.notifikasjon.tekst = tekst;

        nyBeskjedInput.eksterneVarsler = new TAG_ExternalNotificationModel.EksterntVarselInput();
        nyBeskjedInput.eksterneVarsler.epost = new TAG_ExternalNotificationModel.EksterntVarselEpostInput();
        nyBeskjedInput.eksterneVarsler.epost.epostHtmlBody = epostHtmlBody;
        nyBeskjedInput.eksterneVarsler.epost.epostTittel = epostTittel;
        nyBeskjedInput.eksterneVarsler.epost.mottaker = new TAG_ExternalNotificationModel.EpostMottakerInput();
        nyBeskjedInput.eksterneVarsler.epost.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.EpostKontaktInfoInput();
        nyBeskjedInput.eksterneVarsler.epost.mottaker.kontaktinfo.epostadresse = epostadresse;
        nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.sendevindu = TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.tidspunkt = tidspunkt;
        nyBeskjedInput.eksterneVarsler.sms = new TAG_ExternalNotificationModel.EksterntVarselSmsInput();
        nyBeskjedInput.eksterneVarsler.sms.mottaker = new TAG_ExternalNotificationModel.SmsMottakerInput();
        nyBeskjedInput.eksterneVarsler.sms.mottaker.kontaktinfo = new TAG_ExternalNotificationModel.SmsKontaktInfoInput();
        nyBeskjedInput.eksterneVarsler.sms.mottaker.kontaktinfo.tlf = tlf;
        nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt = new TAG_ExternalNotificationModel.SendetidspunktInput();
        nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.sendevindu = TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.tidspunkt = tidspunkt;
        nyBeskjedInput.eksterneVarsler.sms.smsTekst = smsTekst;
        Test.stopTest();

        System.assertEquals(
            serviceCode,
            nyBeskjedInput.mottaker.altinn.serviceCode,
            'Expected to have the value "' +
            serviceCode +
            '" returned.'
        );
        System.assertEquals(
            serviceEdition,
            nyBeskjedInput.mottaker.altinn.serviceEdition,
            'Expected to have the value "' +
            serviceEdition +
            '" returned.'
        );
        System.assertEquals(
            fnr,
            nyBeskjedInput.mottaker.altinnReportee.fnr,
            'Expected to have the value "' +
            fnr +
            '" returned.'
        );
        System.assertEquals(
            roleDefinitionCode,
            nyBeskjedInput.mottaker.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' +
            roleDefinitionCode +
            '" returned.'
        );
        System.assertEquals(
            ansattFnr,
            nyBeskjedInput.mottaker.naermesteLeder.ansattFnr,
            'Expected to have the value "' +
            ansattFnr +
            '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr,
            nyBeskjedInput.mottaker.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' +
            naermesteLederFnr +
            '" returned.'
        );

        System.assertEquals(
            serviceCode + mottakerTwoTextPostfix,
            mottakerTwo.altinn.serviceCode,
            'Expected to have the value "' +
            serviceCode +
            mottakerTwoTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            serviceEdition + mottakerTwoTextPostfix,
            mottakerTwo.altinn.serviceEdition,
            'Expected to have the value "' +
            serviceEdition +
            mottakerTwoTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            fnr + mottakerTwoTextPostfix,
            mottakerTwo.altinnReportee.fnr,
            'Expected to have the value "' +
            fnr +
            mottakerTwoTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            roleDefinitionCode + mottakerTwoTextPostfix,
            mottakerTwo.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' +
            roleDefinitionCode +
            mottakerTwoTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            ansattFnr + mottakerTwoTextPostfix,
            mottakerTwo.naermesteLeder.ansattFnr,
            'Expected to have the value "' +
            ansattFnr +
            mottakerTwoTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr + mottakerTwoTextPostfix,
            mottakerTwo.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' +
            naermesteLederFnr +
            mottakerTwoTextPostfix +
            '" returned.'
        );

        System.assertEquals(
            serviceCode + mottakerOneTextPostfix,
            mottakerOne.altinn.serviceCode,
            'Expected to have the value "' +
            serviceCode +
            mottakerOneTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            serviceEdition + mottakerOneTextPostfix,
            mottakerOne.altinn.serviceEdition,
            'Expected to have the value "' +
            serviceEdition +
            mottakerOneTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            fnr + mottakerOneTextPostfix,
            mottakerOne.altinnReportee.fnr,
            'Expected to have the value "' +
            fnr +
            mottakerOneTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            roleDefinitionCode + mottakerOneTextPostfix,
            mottakerOne.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' +
            roleDefinitionCode +
            mottakerOneTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            ansattFnr + mottakerOneTextPostfix,
            mottakerOne.naermesteLeder.ansattFnr,
            'Expected to have the value "' +
            ansattFnr +
            mottakerOneTextPostfix +
            '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr + mottakerOneTextPostfix,
            mottakerOne.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' +
            naermesteLederFnr +
            mottakerOneTextPostfix +
            '" returned.'
        );

        System.assertEquals(
            eksternId,
            nyBeskjedInput.metadata.eksternId,
            'Expected to have the value "' +
            eksternId +
            '" returned.'
        );
        System.assertEquals(
            grupperingsid,
            nyBeskjedInput.metadata.grupperingsid,
            'Expected to have the value "' +
            grupperingsid +
            '" returned.'
        );
        System.assertEquals(
            den,
            nyBeskjedInput.metadata.hardDelete.den,
            'Expected to have the value "' +
            den +
            '" returned.'
        );
        System.assertEquals(
            om,
            nyBeskjedInput.metadata.hardDelete.om,
            'Expected to have the value "' +
            om +
            '" returned.'
        );

        System.assertEquals(
            lenke,
            nyBeskjedInput.notifikasjon.lenke,
            'Expected to have the value "' +
            lenke +
            '" returned.'
        );
        System.assertEquals(
            merkelapp,
            nyBeskjedInput.notifikasjon.merkelapp,
            'Expected to have the value "' +
            merkelapp +
            '" returned.'
        );
        System.assertEquals(
            tekst,
            nyBeskjedInput.notifikasjon.tekst,
            'Expected to have the value "' +
            tekst +
            '" returned.'
        );

        System.assertEquals(
            epostHtmlBody,
            nyBeskjedInput.eksterneVarsler.epost.epostHtmlBody,
            'Expected to have the value "' +
            epostHtmlBody +
            '" returned.'
        );
        System.assertEquals(
            epostTittel,
            nyBeskjedInput.eksterneVarsler.epost.epostTittel,
            'Expected to have the value "' +
            epostTittel +
            '" returned.'
        );
        System.assertEquals(
            epostadresse,
            nyBeskjedInput.eksterneVarsler.epost.mottaker.kontaktinfo.epostadresse,
            'Expected to have the value "' +
            epostadresse +
            '" returned.'
        );
        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.sendevindu,
            'Expected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.NKS_AAPNINGSTID +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.tidspunkt,
            'Expected to have the value "' +
            tidspunkt +
            '" returned.'
        );
        System.assertEquals(
            tlf,
            nyBeskjedInput.eksterneVarsler.sms.mottaker.kontaktinfo.tlf,
            'Expected to have the value "' +
            tlf +
            '" returned.'
        );
        System.assertEquals(
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.sendevindu,
            'Expected to have the value "' +
            TAG_ExternalNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG +
            '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.tidspunkt,
            'Expected to have the value "' +
            tidspunkt +
            '" returned.'
        );
        System.assertEquals(
            smsTekst,
            nyBeskjedInput.eksterneVarsler.sms.smsTekst,
            'Expected to have the value "' +
            smsTekst +
            '" returned.'
        );
    }
}
