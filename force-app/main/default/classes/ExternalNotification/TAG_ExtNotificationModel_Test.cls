/**
 * @description Test class...
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-01-17 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationModel
 */
@IsTest
private class TAG_ExtNotificationModel_Test {
    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.AltinnMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExtNotificationModel.AltinnMottakerInput
     */
    @IsTest
    private static void testAltinnMottakerInput() {
        TAG_ExtNotificationModel.AltinnMottakerInput altinnMottakerInput;
        String serviceCode = 'serviceCode Test';
        String serviceEdition = 'serviceEdition Test';

        Test.startTest();
        altinnMottakerInput = new TAG_ExtNotificationModel.AltinnMottakerInput();
        altinnMottakerInput.serviceCode = serviceCode;
        altinnMottakerInput.serviceEdition = serviceEdition;
        Test.stopTest();

        System.assertEquals(
            serviceCode,
            altinnMottakerInput.serviceCode,
            'Expected to have the value "' + serviceCode + '" returned.'
        );
        System.assertEquals(
            serviceEdition,
            altinnMottakerInput.serviceEdition,
            'Expected to have the value "' + serviceEdition + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.NaermesteLederMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExtNotificationModel.NaermesteLederMottakerInput
     */
    @IsTest
    private static void testNaermesteLederMottakerInput() {
        TAG_ExtNotificationModel.NaermesteLederMottakerInput naermesteLederMottakerInput;
        String ansattFnr = 'anattFnr Test';
        String naermesteLederFnr = 'naermesteLederFnr Test';

        Test.startTest();
        naermesteLederMottakerInput = new TAG_ExtNotificationModel.NaermesteLederMottakerInput();
        naermesteLederMottakerInput.ansattFnr = ansattFnr;
        naermesteLederMottakerInput.naermesteLederFnr = naermesteLederFnr;
        Test.stopTest();

        System.assertEquals(
            ansattFnr,
            naermesteLederMottakerInput.ansattFnr,
            'Expected to have the value "' + ansattFnr + '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr,
            naermesteLederMottakerInput.naermesteLederFnr,
            'Expected to have the value "' + naermesteLederFnr + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.AltinnRolleMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExtNotificationModel.AltinnRolleMottakerInput
     */
    @IsTest
    private static void testAltinnRolleMottakerInput() {
        TAG_ExtNotificationModel.AltinnRolleMottakerInput altinnRolleMottakerInput;
        String roleDefinitionCode = 'roleDefinitionCode Test';

        Test.startTest();
        altinnRolleMottakerInput = new TAG_ExtNotificationModel.AltinnRolleMottakerInput();
        altinnRolleMottakerInput.roleDefinitionCode = roleDefinitionCode;
        Test.stopTest();

        System.assertEquals(
            roleDefinitionCode,
            altinnRolleMottakerInput.roleDefinitionCode,
            'Expected to have the value "' + roleDefinitionCode + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.AltinnReporteeMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-17 Created.
     *
     * @see TAG_ExtNotificationModel.AltinnReporteeMottakerInput
     */
    @IsTest
    private static void testAltinnReporteeMottakerInput() {
        TAG_ExtNotificationModel.AltinnReporteeMottakerInput altinnReporteeMottakerInput;
        String fnr = 'fnr Test';

        Test.startTest();
        altinnReporteeMottakerInput = new TAG_ExtNotificationModel.AltinnReporteeMottakerInput();
        altinnReporteeMottakerInput.fnr = fnr;
        Test.stopTest();

        System.assertEquals(fnr, altinnReporteeMottakerInput.fnr, 'Expected to have the value "' + fnr + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.NotifikasjonInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-18 Created.
     *
     * @see TAG_ExtNotificationModel.NotifikasjonInput
     */
    @IsTest
    private static void testNotifikasjonInput() {
        TAG_ExtNotificationModel.NotifikasjonInput notifikasjonInput;
        String lenke = 'lenke Test';
        String merkelapp = 'merkelapp Test';
        String tekst = 'tekst Test';

        Test.startTest();
        notifikasjonInput = new TAG_ExtNotificationModel.NotifikasjonInput();
        notifikasjonInput.lenke = lenke;
        notifikasjonInput.merkelapp = merkelapp;
        notifikasjonInput.tekst = tekst;
        Test.stopTest();

        System.assertEquals(lenke, notifikasjonInput.lenke, 'Excpected to have the value "' + lenke + '" returned.');
        System.assertEquals(
            merkelapp,
            notifikasjonInput.merkelapp,
            'Excpected to have the value "' + merkelapp + '" returned.'
        );
        System.assertEquals(tekst, notifikasjonInput.tekst, 'Excpected to have the value "' + tekst + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.FutureTemporalInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-18 Created.
     *
     * @see TAG_ExtNotificationModel.FutureTemporalInput
     */
    @IsTest
    private static void testFutureTemporalInput() {
        TAG_ExtNotificationModel.FutureTemporalInput futureTemporalInput;
        String den = 'den Test';
        String om = 'om Test';

        Test.startTest();
        futureTemporalInput = new TAG_ExtNotificationModel.FutureTemporalInput();
        futureTemporalInput.den = den;
        futureTemporalInput.om = om;
        Test.stopTest();

        System.assertEquals(den, futureTemporalInput.den, 'Excpected to have the value "' + den + '" returned.');
        System.assertEquals(om, futureTemporalInput.om, 'Excpected to have the value "' + om + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.MetadataInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-18 Created.
     *
     * @see TAG_ExtNotificationModel.MetadataInput
     */
    @IsTest
    private static void testMetadataInput() {
        TAG_ExtNotificationModel.MetadataInput metadataInput;
        String eksternId = 'eksternId Test';
        String grupperingsid = 'grupperingsid Test';
        String den = 'hardDelete.den Test';
        String om = 'hardDelete.om Test';
        String opprettetTidspunkt = 'opprettetTidspunkt Test';
        String virksomhetsnummer = 'virksomhetsnummer Test';

        Test.startTest();
        metadataInput = new TAG_ExtNotificationModel.MetadataInput();
        metadataInput.eksternId = eksternId;
        metadataInput.grupperingsid = grupperingsid;
        metadataInput.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        metadataInput.hardDelete.den = den;
        metadataInput.hardDelete.om = om;
        metadataInput.opprettetTidspunkt = opprettetTidspunkt;
        metadataInput.virksomhetsnummer = virksomhetsnummer;
        Test.stopTest();

        System.assertEquals(
            eksternId,
            metadataInput.eksternId,
            'Excpected to have the value "' + eksternId + '" returned.'
        );
        System.assertEquals(
            grupperingsid,
            metadataInput.grupperingsid,
            'Excpected to have the value "' + grupperingsid + '" returned.'
        );
        System.assertEquals(den, metadataInput.hardDelete.den, 'Excpected to have the value "' + den + '" returned.');
        System.assertEquals(om, metadataInput.hardDelete.om, 'Excpected to have the value "' + om + '" returned.');
        System.assertEquals(
            opprettetTidspunkt,
            metadataInput.opprettetTidspunkt,
            'Excpected to have the value "' + opprettetTidspunkt + '" returned.'
        );
        System.assertEquals(
            virksomhetsnummer,
            metadataInput.virksomhetsnummer,
            'Excpected to have the value "' + virksomhetsnummer + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.SmsKontaktInfoInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.SmsKontaktInfoInput
     */
    @IsTest
    private static void testSmsKontaktInfoInput() {
        TAG_ExtNotificationModel.SmsKontaktInfoInput smsKontaktInfoInput;
        String tlf = 'tlf Test';

        Test.startTest();
        smsKontaktInfoInput = new TAG_ExtNotificationModel.SmsKontaktInfoInput();
        smsKontaktInfoInput.tlf = tlf;
        Test.stopTest();

        System.assertEquals(tlf, smsKontaktInfoInput.tlf, 'Excpected to have the value "' + tlf + '" returned.');
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.SmsMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.SmsMottakerInput
     */
    @IsTest
    private static void testSmsMottakerInput() {
        TAG_ExtNotificationModel.SmsMottakerInput smsMottakerInput;
        String tlf = 'tlf Test';

        Test.startTest();
        smsMottakerInput = new TAG_ExtNotificationModel.SmsMottakerInput();
        smsMottakerInput.kontaktinfo = new TAG_ExtNotificationModel.SmsKontaktInfoInput();
        smsMottakerInput.kontaktinfo.tlf = tlf;
        Test.stopTest();

        System.assertEquals(
            tlf,
            smsMottakerInput.kontaktinfo.tlf,
            'Excpected to have the value "' + tlf + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.EksterntVarselSmsInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.EksterntVarselSmsInput
     */
    @IsTest
    private static void testEksterntVarselSmsInput() {
        TAG_ExtNotificationModel.EksterntVarselSmsInput eksterntVarselSmsInput;
        String tlf = 'tlf Test';
        String tidspunkt = 'tidspunkt Test';
        String smsTekst = 'smsTekst Test';

        Test.startTest();
        eksterntVarselSmsInput = new TAG_ExtNotificationModel.EksterntVarselSmsInput();
        eksterntVarselSmsInput.mottaker = new TAG_ExtNotificationModel.SmsMottakerInput();
        eksterntVarselSmsInput.mottaker.kontaktinfo = new TAG_ExtNotificationModel.SmsKontaktInfoInput();
        eksterntVarselSmsInput.mottaker.kontaktinfo.tlf = tlf;
        eksterntVarselSmsInput.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        eksterntVarselSmsInput.sendetidspunkt.sendevindu = TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        eksterntVarselSmsInput.sendetidspunkt.tidspunkt = tidspunkt;
        eksterntVarselSmsInput.smsTekst = smsTekst;
        Test.stopTest();

        System.assertEquals(
            tlf,
            eksterntVarselSmsInput.mottaker.kontaktinfo.tlf,
            'Excpected to have the value "' + tlf + '" returned.'
        );
        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            eksterntVarselSmsInput.sendetidspunkt.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselSmsInput.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
        System.assertEquals(
            smsTekst,
            eksterntVarselSmsInput.smsTekst,
            'Excpected to have the value "' + smsTekst + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.EpostKontaktInfoInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.EpostKontaktInfoInput
     */
    @IsTest
    static void testEpostKontaktInfoInput() {
        TAG_ExtNotificationModel.EpostKontaktInfoInput epostKontaktInfoInput;
        String epostadresse = 'epostadresse Test';

        Test.startTest();
        epostKontaktInfoInput = new TAG_ExtNotificationModel.EpostKontaktInfoInput();
        epostKontaktInfoInput.epostadresse = epostadresse;
        Test.stopTest();

        System.assertEquals(
            epostadresse,
            epostKontaktInfoInput.epostadresse,
            'Excpected to have the value "' + epostadresse + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.EpostMottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.EpostMottakerInput
     */
    @IsTest
    static void testEpostMottakerInput() {
        TAG_ExtNotificationModel.EpostMottakerInput epostMottakerInput;
        String epostadresse = 'epostadresse Test';

        Test.startTest();
        epostMottakerInput = new TAG_ExtNotificationModel.EpostMottakerInput();
        epostMottakerInput.kontaktinfo = new TAG_ExtNotificationModel.EpostKontaktInfoInput();
        epostMottakerInput.kontaktinfo.epostadresse = epostadresse;
        Test.stopTest();

        System.assertEquals(
            epostadresse,
            epostMottakerInput.kontaktinfo.epostadresse,
            'Excpected to have the value "' + epostadresse + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.SendetidspunktInput
     */
    @SuppressWarnings('PMD.MethodNamingConventions')
    @IsTest
    static void testSendetidspunktInputWithNKS_AAPNINGSTID() {
        TAG_ExtNotificationModel.SendetidspunktInput sendetidspunktInput;
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        sendetidspunktInput = new TAG_ExtNotificationModel.SendetidspunktInput();
        sendetidspunktInput.sendevindu = TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        sendetidspunktInput.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            sendetidspunktInput.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            sendetidspunktInput.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.SendetidspunktInput
     */
    @SuppressWarnings('PMD.MethodNamingConventions')
    @IsTest
    static void testSendetidspunktInputWithDAGTID_IKKE_SOENDAG() {
        TAG_ExtNotificationModel.SendetidspunktInput sendetidspunktInput;
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        sendetidspunktInput = new TAG_ExtNotificationModel.SendetidspunktInput();
        sendetidspunktInput.sendevindu = TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        sendetidspunktInput.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            sendetidspunktInput.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            sendetidspunktInput.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-20 Created.
     *
     * @see TAG_ExtNotificationModel.SendetidspunktInput
     */
    @SuppressWarnings('PMD.MethodNamingConventions')
    @IsTest
    static void testSendetidspunktInputWithLOEPENDE() {
        TAG_ExtNotificationModel.SendetidspunktInput sendetidspunktInput;
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        sendetidspunktInput = new TAG_ExtNotificationModel.SendetidspunktInput();
        sendetidspunktInput.sendevindu = TAG_ExtNotificationModel.Sendevindu.LOEPENDE;
        sendetidspunktInput.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.LOEPENDE,
            sendetidspunktInput.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.LOEPENDE + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            sendetidspunktInput.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.SendetidspunktInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExtNotificationModel.SendetidspunktInput
     */
    @IsTest
    private static void testEksterntVarselEpostInput() {
        TAG_ExtNotificationModel.EksterntVarselEpostInput eksterntVarselEpostInput;
        String epostadresse = 'epostadresse Test';
        String epostTittel = 'eposttittel Test';
        String epostHtmlBody = 'epostHtmlBody Test';
        String tidspunkt = 'tidspunkt Test';

        Test.startTest();
        eksterntVarselEpostInput = new TAG_ExtNotificationModel.EksterntVarselEpostInput();
        eksterntVarselEpostInput.mottaker = new TAG_ExtNotificationModel.EpostMottakerInput();
        eksterntVarselEpostInput.mottaker.kontaktinfo = new TAG_ExtNotificationModel.EpostKontaktInfoInput();
        eksterntVarselEpostInput.mottaker.kontaktinfo.epostadresse = epostadresse;
        eksterntVarselEpostInput.epostTittel = epostTittel;
        eksterntVarselEpostInput.epostHtmlBody = epostHtmlBody;
        eksterntVarselEpostInput.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        eksterntVarselEpostInput.sendetidspunkt.sendevindu = TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        eksterntVarselEpostInput.sendetidspunkt.tidspunkt = tidspunkt;
        Test.stopTest();

        System.assertEquals(
            epostadresse,
            eksterntVarselEpostInput.mottaker.kontaktinfo.epostadresse,
            'Excpected to have the value "' + epostadresse + '" returned.'
        );
        System.assertEquals(
            epostTittel,
            eksterntVarselEpostInput.epostTittel,
            'Excpected to have the value "' + epostTittel + '" returned.'
        );
        System.assertEquals(
            epostHtmlBody,
            eksterntVarselEpostInput.epostHtmlBody,
            'Excpected to have the value "' + epostHtmlBody + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselEpostInput.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            eksterntVarselEpostInput.sendetidspunkt.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.EksterntVarselInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExtNotificationModel.EksterntVarselInput
     */
    @IsTest
    private static void testEksterntVarselInput() {
        TAG_ExtNotificationModel.EksterntVarselInput eksterntVarselInput;
        String epostHtmlBody = 'epostHtmlBody Test';
        String epostTittel = 'epostTittel Test';
        String epostadresse = 'epostadresse Test';
        String tidspunkt = 'tidspunkt Test';
        String tlf = 'tlf Test';
        String sendetidspunkt = 'sendetidspunkt Test';
        String smsTekst = 'smsTekst Test';

        Test.startTest();
        eksterntVarselInput = new TAG_ExtNotificationModel.EksterntVarselInput();
        eksterntVarselInput.epost = new TAG_ExtNotificationModel.EksterntVarselEpostInput();
        eksterntVarselInput.epost.epostHtmlBody = epostHtmlBody;
        eksterntVarselInput.epost.epostTittel = epostTittel;
        eksterntVarselInput.epost.mottaker = new TAG_ExtNotificationModel.EpostMottakerInput();
        eksterntVarselInput.epost.mottaker.kontaktinfo = new TAG_ExtNotificationModel.EpostKontaktInfoInput();
        eksterntVarselInput.epost.mottaker.kontaktinfo.epostadresse = epostadresse;
        eksterntVarselInput.epost.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        eksterntVarselInput.epost.sendetidspunkt.sendevindu = TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        eksterntVarselInput.epost.sendetidspunkt.tidspunkt = tidspunkt;
        eksterntVarselInput.sms = new TAG_ExtNotificationModel.EksterntVarselSmsInput();
        eksterntVarselInput.sms.mottaker = new TAG_ExtNotificationModel.SmsMottakerInput();
        eksterntVarselInput.sms.mottaker.kontaktinfo = new TAG_ExtNotificationModel.SmsKontaktInfoInput();
        eksterntVarselInput.sms.mottaker.kontaktinfo.tlf = tlf;
        eksterntVarselInput.sms.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        eksterntVarselInput.sms.sendetidspunkt.sendevindu = TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        eksterntVarselInput.sms.sendetidspunkt.tidspunkt = tidspunkt;
        eksterntVarselInput.sms.smsTekst = smsTekst;
        Test.stopTest();

        System.assertEquals(
            epostHtmlBody,
            eksterntVarselInput.epost.epostHtmlBody,
            'Excpected to have the value "' + epostHtmlBody + '" returned.'
        );
        System.assertEquals(
            epostTittel,
            eksterntVarselInput.epost.epostTittel,
            'Excpected to have the value "' + epostTittel + '" returned.'
        );
        System.assertEquals(
            epostadresse,
            eksterntVarselInput.epost.mottaker.kontaktinfo.epostadresse,
            'Excpected to have the value "' + epostadresse + '" returned.'
        );
        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            eksterntVarselInput.epost.sendetidspunkt.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselInput.epost.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
        System.assertEquals(
            tlf,
            eksterntVarselInput.sms.mottaker.kontaktinfo.tlf,
            'Excpected to have the value "' + tlf + '" returned.'
        );
        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            eksterntVarselInput.sms.sendetidspunkt.sendevindu,
            'Excpected to have the value "' + TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            eksterntVarselInput.sms.sendetidspunkt.tidspunkt,
            'Excpected to have the value "' + tidspunkt + '" returned.'
        );
        System.assertEquals(
            smsTekst,
            eksterntVarselInput.sms.smsTekst,
            'Excpected to have the value "' + smsTekst + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.MottakerInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExtNotificationModel.MottakerInput
     */
    @IsTest
    static void testMottakerInput() {
        TAG_ExtNotificationModel.MottakerInput mottaker;
        String serviceCode = 'serviceCode Test';
        String serviceEdition = 'serviceEdition Test';
        String fnr = 'fnr Test';
        String roleDefinitionCode = 'roleDefinitionCode Test';
        String ansattFnr = 'ansattFnr Test';
        String naermesteLederFnr = 'naermesteLederFnr Test';

        Test.startTest();
        mottaker = new TAG_ExtNotificationModel.MottakerInput();
        mottaker.altinn = new TAG_ExtNotificationModel.AltinnMottakerInput();
        mottaker.altinn.serviceCode = serviceCode;
        mottaker.altinn.serviceEdition = serviceEdition;
        mottaker.altinnReportee = new TAG_ExtNotificationModel.AltinnReporteeMottakerInput();
        mottaker.altinnReportee.fnr = fnr;
        mottaker.altinnRolle = new TAG_ExtNotificationModel.AltinnRolleMottakerInput();
        mottaker.altinnRolle.roleDefinitionCode = roleDefinitionCode;
        mottaker.naermesteLeder = new TAG_ExtNotificationModel.NaermesteLederMottakerInput();
        mottaker.naermesteLeder.ansattFnr = ansattFnr;
        mottaker.naermesteLeder.naermesteLederFnr = naermesteLederFnr;

        Test.stopTest();

        System.assertEquals(
            serviceCode,
            mottaker.altinn.serviceCode,
            'Expected to have the value "' + serviceCode + '" returned.'
        );
        System.assertEquals(
            serviceEdition,
            mottaker.altinn.serviceEdition,
            'Expected to have the value "' + serviceEdition + '" returned.'
        );
        System.assertEquals(fnr, mottaker.altinnReportee.fnr, 'Expected to have the value "' + fnr + '" returned.');
        System.assertEquals(
            roleDefinitionCode,
            mottaker.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' + roleDefinitionCode + '" returned.'
        );
        System.assertEquals(
            ansattFnr,
            mottaker.naermesteLeder.ansattFnr,
            'Expected to have the value "' + ansattFnr + '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr,
            mottaker.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' + naermesteLederFnr + '" returned.'
        );
    }

    /**
     * @description Test method for testing of the
     * `TAG_ExtNotificationModel.NyBeskjedInput` inner class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-26 Created.
     *
     * @see TAG_ExtNotificationModel.NyBeskjedInput
     */
    @IsTest
    private static void testNyBeskjedInput() {
        TAG_ExtNotificationModel.NyBeskjedInput nyBeskjedInput;
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
        nyBeskjedInput = new TAG_ExtNotificationModel.NyBeskjedInput();
        nyBeskjedInput.mottaker = new TAG_ExtNotificationModel.MottakerInput();
        nyBeskjedInput.mottaker.altinn = new TAG_ExtNotificationModel.AltinnMottakerInput();
        nyBeskjedInput.mottaker.altinn.serviceCode = serviceCode;
        nyBeskjedInput.mottaker.altinn.serviceEdition = serviceEdition;
        nyBeskjedInput.mottaker.altinnReportee = new TAG_ExtNotificationModel.AltinnReporteeMottakerInput();
        nyBeskjedInput.mottaker.altinnReportee.fnr = fnr;
        nyBeskjedInput.mottaker.altinnRolle = new TAG_ExtNotificationModel.AltinnRolleMottakerInput();
        nyBeskjedInput.mottaker.altinnRolle.roleDefinitionCode = roleDefinitionCode;
        nyBeskjedInput.mottaker.naermesteLeder = new TAG_ExtNotificationModel.NaermesteLederMottakerInput();
        nyBeskjedInput.mottaker.naermesteLeder.ansattFnr = ansattFnr;
        nyBeskjedInput.mottaker.naermesteLeder.naermesteLederFnr = naermesteLederFnr;

        nyBeskjedInput.mottakere = new List<TAG_ExtNotificationModel.MottakerInput>();

        String mottakerOneTextPostfix = 'One';
        TAG_ExtNotificationModel.MottakerInput mottakerOne = new TAG_ExtNotificationModel.MottakerInput();
        mottakerOne.altinn = new TAG_ExtNotificationModel.AltinnMottakerInput();
        mottakerOne.altinn.serviceCode = serviceCode + mottakerOneTextPostfix;
        mottakerOne.altinn.serviceEdition = serviceEdition + mottakerOneTextPostfix;
        mottakerOne.altinnReportee = new TAG_ExtNotificationModel.AltinnReporteeMottakerInput();
        mottakerOne.altinnReportee.fnr = fnr + mottakerOneTextPostfix;
        mottakerOne.altinnRolle = new TAG_ExtNotificationModel.AltinnRolleMottakerInput();
        mottakerOne.altinnRolle.roleDefinitionCode = roleDefinitionCode + mottakerOneTextPostfix;
        mottakerOne.naermesteLeder = new TAG_ExtNotificationModel.NaermesteLederMottakerInput();
        mottakerOne.naermesteLeder.ansattFnr = ansattFnr + mottakerOneTextPostfix;
        mottakerOne.naermesteLeder.naermesteLederFnr = naermesteLederFnr + mottakerOneTextPostfix;
        nyBeskjedInput.mottakere.add(mottakerOne);

        String mottakerTwoTextPostfix = 'Two';
        TAG_ExtNotificationModel.MottakerInput mottakerTwo = new TAG_ExtNotificationModel.MottakerInput();
        mottakerTwo.altinn = new TAG_ExtNotificationModel.AltinnMottakerInput();
        mottakerTwo.altinn.serviceCode = serviceCode + mottakerTwoTextPostfix;
        mottakerTwo.altinn.serviceEdition = serviceEdition + mottakerTwoTextPostfix;
        mottakerTwo.altinnReportee = new TAG_ExtNotificationModel.AltinnReporteeMottakerInput();
        mottakerTwo.altinnReportee.fnr = fnr + mottakerTwoTextPostfix;
        mottakerTwo.altinnRolle = new TAG_ExtNotificationModel.AltinnRolleMottakerInput();
        mottakerTwo.altinnRolle.roleDefinitionCode = roleDefinitionCode + mottakerTwoTextPostfix;
        mottakerTwo.naermesteLeder = new TAG_ExtNotificationModel.NaermesteLederMottakerInput();
        mottakerTwo.naermesteLeder.ansattFnr = ansattFnr + mottakerTwoTextPostfix;
        mottakerTwo.naermesteLeder.naermesteLederFnr = naermesteLederFnr + mottakerTwoTextPostfix;
        nyBeskjedInput.mottakere.add(mottakerTwo);

        nyBeskjedInput.metadata = new TAG_ExtNotificationModel.MetadataInput();
        nyBeskjedInput.metadata.eksternId = eksternId;
        nyBeskjedInput.metadata.grupperingsid = grupperingsid;
        nyBeskjedInput.metadata.hardDelete = new TAG_ExtNotificationModel.FutureTemporalInput();
        nyBeskjedInput.metadata.hardDelete.den = den;
        nyBeskjedInput.metadata.hardDelete.om = om;

        nyBeskjedInput.notifikasjon = new TAG_ExtNotificationModel.NotifikasjonInput();
        nyBeskjedInput.notifikasjon.lenke = lenke;
        nyBeskjedInput.notifikasjon.merkelapp = merkelapp;
        nyBeskjedInput.notifikasjon.tekst = tekst;

        nyBeskjedInput.eksterneVarsler = new TAG_ExtNotificationModel.EksterntVarselInput();
        nyBeskjedInput.eksterneVarsler.epost = new TAG_ExtNotificationModel.EksterntVarselEpostInput();
        nyBeskjedInput.eksterneVarsler.epost.epostHtmlBody = epostHtmlBody;
        nyBeskjedInput.eksterneVarsler.epost.epostTittel = epostTittel;
        nyBeskjedInput.eksterneVarsler.epost.mottaker = new TAG_ExtNotificationModel.EpostMottakerInput();
        nyBeskjedInput.eksterneVarsler.epost.mottaker.kontaktinfo = new TAG_ExtNotificationModel.EpostKontaktInfoInput();
        nyBeskjedInput.eksterneVarsler.epost.mottaker.kontaktinfo.epostadresse = epostadresse;
        nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.sendevindu = TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.tidspunkt = tidspunkt;
        nyBeskjedInput.eksterneVarsler.sms = new TAG_ExtNotificationModel.EksterntVarselSmsInput();
        nyBeskjedInput.eksterneVarsler.sms.mottaker = new TAG_ExtNotificationModel.SmsMottakerInput();
        nyBeskjedInput.eksterneVarsler.sms.mottaker.kontaktinfo = new TAG_ExtNotificationModel.SmsKontaktInfoInput();
        nyBeskjedInput.eksterneVarsler.sms.mottaker.kontaktinfo.tlf = tlf;
        nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt = new TAG_ExtNotificationModel.SendetidspunktInput();
        nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.sendevindu = TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.tidspunkt = tidspunkt;
        nyBeskjedInput.eksterneVarsler.sms.smsTekst = smsTekst;
        Test.stopTest();

        System.assertEquals(
            serviceCode,
            nyBeskjedInput.mottaker.altinn.serviceCode,
            'Expected to have the value "' + serviceCode + '" returned.'
        );
        System.assertEquals(
            serviceEdition,
            nyBeskjedInput.mottaker.altinn.serviceEdition,
            'Expected to have the value "' + serviceEdition + '" returned.'
        );
        System.assertEquals(
            fnr,
            nyBeskjedInput.mottaker.altinnReportee.fnr,
            'Expected to have the value "' + fnr + '" returned.'
        );
        System.assertEquals(
            roleDefinitionCode,
            nyBeskjedInput.mottaker.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' + roleDefinitionCode + '" returned.'
        );
        System.assertEquals(
            ansattFnr,
            nyBeskjedInput.mottaker.naermesteLeder.ansattFnr,
            'Expected to have the value "' + ansattFnr + '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr,
            nyBeskjedInput.mottaker.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' + naermesteLederFnr + '" returned.'
        );

        System.assertEquals(
            serviceCode + mottakerTwoTextPostfix,
            mottakerTwo.altinn.serviceCode,
            'Expected to have the value "' + serviceCode + mottakerTwoTextPostfix + '" returned.'
        );
        System.assertEquals(
            serviceEdition + mottakerTwoTextPostfix,
            mottakerTwo.altinn.serviceEdition,
            'Expected to have the value "' + serviceEdition + mottakerTwoTextPostfix + '" returned.'
        );
        System.assertEquals(
            fnr + mottakerTwoTextPostfix,
            mottakerTwo.altinnReportee.fnr,
            'Expected to have the value "' + fnr + mottakerTwoTextPostfix + '" returned.'
        );
        System.assertEquals(
            roleDefinitionCode + mottakerTwoTextPostfix,
            mottakerTwo.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' + roleDefinitionCode + mottakerTwoTextPostfix + '" returned.'
        );
        System.assertEquals(
            ansattFnr + mottakerTwoTextPostfix,
            mottakerTwo.naermesteLeder.ansattFnr,
            'Expected to have the value "' + ansattFnr + mottakerTwoTextPostfix + '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr + mottakerTwoTextPostfix,
            mottakerTwo.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' + naermesteLederFnr + mottakerTwoTextPostfix + '" returned.'
        );

        System.assertEquals(
            serviceCode + mottakerOneTextPostfix,
            mottakerOne.altinn.serviceCode,
            'Expected to have the value "' + serviceCode + mottakerOneTextPostfix + '" returned.'
        );
        System.assertEquals(
            serviceEdition + mottakerOneTextPostfix,
            mottakerOne.altinn.serviceEdition,
            'Expected to have the value "' + serviceEdition + mottakerOneTextPostfix + '" returned.'
        );
        System.assertEquals(
            fnr + mottakerOneTextPostfix,
            mottakerOne.altinnReportee.fnr,
            'Expected to have the value "' + fnr + mottakerOneTextPostfix + '" returned.'
        );
        System.assertEquals(
            roleDefinitionCode + mottakerOneTextPostfix,
            mottakerOne.altinnRolle.roleDefinitionCode,
            'Expected to have the value "' + roleDefinitionCode + mottakerOneTextPostfix + '" returned.'
        );
        System.assertEquals(
            ansattFnr + mottakerOneTextPostfix,
            mottakerOne.naermesteLeder.ansattFnr,
            'Expected to have the value "' + ansattFnr + mottakerOneTextPostfix + '" returned.'
        );
        System.assertEquals(
            naermesteLederFnr + mottakerOneTextPostfix,
            mottakerOne.naermesteLeder.naermesteLederFnr,
            'Expected to have the value "' + naermesteLederFnr + mottakerOneTextPostfix + '" returned.'
        );

        System.assertEquals(
            eksternId,
            nyBeskjedInput.metadata.eksternId,
            'Expected to have the value "' + eksternId + '" returned.'
        );
        System.assertEquals(
            grupperingsid,
            nyBeskjedInput.metadata.grupperingsid,
            'Expected to have the value "' + grupperingsid + '" returned.'
        );
        System.assertEquals(
            den,
            nyBeskjedInput.metadata.hardDelete.den,
            'Expected to have the value "' + den + '" returned.'
        );
        System.assertEquals(
            om,
            nyBeskjedInput.metadata.hardDelete.om,
            'Expected to have the value "' + om + '" returned.'
        );

        System.assertEquals(
            lenke,
            nyBeskjedInput.notifikasjon.lenke,
            'Expected to have the value "' + lenke + '" returned.'
        );
        System.assertEquals(
            merkelapp,
            nyBeskjedInput.notifikasjon.merkelapp,
            'Expected to have the value "' + merkelapp + '" returned.'
        );
        System.assertEquals(
            tekst,
            nyBeskjedInput.notifikasjon.tekst,
            'Expected to have the value "' + tekst + '" returned.'
        );

        System.assertEquals(
            epostHtmlBody,
            nyBeskjedInput.eksterneVarsler.epost.epostHtmlBody,
            'Expected to have the value "' + epostHtmlBody + '" returned.'
        );
        System.assertEquals(
            epostTittel,
            nyBeskjedInput.eksterneVarsler.epost.epostTittel,
            'Expected to have the value "' + epostTittel + '" returned.'
        );
        System.assertEquals(
            epostadresse,
            nyBeskjedInput.eksterneVarsler.epost.mottaker.kontaktinfo.epostadresse,
            'Expected to have the value "' + epostadresse + '" returned.'
        );
        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID,
            nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.sendevindu,
            'Expected to have the value "' + TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            nyBeskjedInput.eksterneVarsler.epost.sendetidspunkt.tidspunkt,
            'Expected to have the value "' + tidspunkt + '" returned.'
        );
        System.assertEquals(
            tlf,
            nyBeskjedInput.eksterneVarsler.sms.mottaker.kontaktinfo.tlf,
            'Expected to have the value "' + tlf + '" returned.'
        );
        System.assertEquals(
            TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG,
            nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.sendevindu,
            'Expected to have the value "' + TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG + '" returned.'
        );
        System.assertEquals(
            tidspunkt,
            nyBeskjedInput.eksterneVarsler.sms.sendetidspunkt.tidspunkt,
            'Expected to have the value "' + tidspunkt + '" returned.'
        );
        System.assertEquals(
            smsTekst,
            nyBeskjedInput.eksterneVarsler.sms.smsTekst,
            'Expected to have the value "' + smsTekst + '" returned.'
        );
    }
}
