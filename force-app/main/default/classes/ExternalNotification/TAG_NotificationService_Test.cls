@IsTest
public with sharing class TAG_NotificationService_Test {
    /*
    mutation OpprettNyBeskjed(
        $eksternId: String!
        $virksomhetsnummer: String!
        $lenke: String!
        $epostHtmlBody: String!
        $ansattFnr: String!
        $naermesteLederFnr: String!
        $tlf: String!
        $epost: String!
    ) {
        nyBeskjed(
            nyBeskjed: {
                metadata: { eksternId: $eksternId, virksomhetsnummer: $virksomhetsnummer }
                mottakere: [{
                    naermesteLeder: {
                        ansattFnr: $ansattFnr
                        naermesteLederFnr: $naermesteLederFnr
                    }
                }]
                notifikasjon: {
                    merkelapp: "Sykemelding"
                    tekst: "Du har mottatt en ny sykemelding."
                    lenke: $lenke
                }
                eksterneVarsler: [
                    {
                        sms: {
                            mottaker: {
                                kontaktinfo: {
                                    tlf: $tlf
                                }
                            }
                            smsTekst: "Du har en ny sykemelding. Logg inn på NAV på Min side – arbeidsgiver for å finne den"
                            sendetidspunkt: {
                                sendevindu: NKS_AAPNINGSTID
                            }
                        }
                    }
                    {
                        epost: {
                            mottaker: {
                                kontaktinfo: {
                                    epostadresse: $epost
                                }
                            }
                            epostTittel: "Du har en ny sykemelding."
                            epostHtmlBody: $epostHtmlBody
                            sendetidspunkt: {
                                sendevindu: LOEPENDE
                            }
                        }
                    }
                ]
            }
        ) {
            __typename
            ... on NyBeskjedVellykket {
                id
            }
            ... on Error {
                feilmelding
            }
        }
    }

    Variabler:
    {
        "eksternId": "1234556",
        "virksomhetsnummer":"012345678",
        "lenke": "https://dev.nav.no/sykemelding/12345",
        "tlf": "123445",
        "epost": "foobar@baz.no",
        "epostHtmlBody": "<h1>Du har en ny sykemelding.</h1><br>Logg inn på NAV sin hjemmeside som arbeidsgiver. <br> Hilsen NAV",
        "ansattFnr": "1234",
        "naermesteLederFnr": "1234"
    }

    */

    @IsTest
    static void methodName() {
        Test.startTest();
        GQLOperationType type = new GQLOperationType(GQLOperationType_e.MUTATION);
        String name = 'OpprettNyBeskjed';

        List<GQLVariable> gqlVariables = new List<GQLVariable>();
        gqlVariables.add(new GQLVariable('eksternId', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('virksomhetsnummer', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('lenke', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('epostHtmlBody', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('ansattFnr', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('naermesteLederFnr', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('tlf', new GQLVariableType('String', false, true, false)));
        gqlVariables.add(new GQLVariable('epost', new GQLVariableType('String', false, true, false)));

        GQLVariableDefinitions definitions = new GQLVariableDefinitions(gqlVariables);

        List<TAG_ExternalNotificationModel.MottakerInput> mottakere = new List<TAG_ExternalNotificationModel.MottakerInput>();
        TAG_ExternalNotificationModel.MottakerInput mottakerInputOne = new TAG_ExternalNotificationModel.MottakerInput();

        TAG_ExternalNotificationModel.AltinnMottakerInput altinn = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        altinn.serviceCode = 'serviceCode Test One';
        altinn.serviceEdition = 'serviceEdition Test One';
        mottakerInputOne.altinn = altinn;

        TAG_ExternalNotificationModel.NaermesteLederMottakerInput naermesteLeder = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        naermesteLeder.ansattFnr = 'ansattFnr Test One';
        naermesteLeder.naermesteLederFnr = 'naermesteLederFnr Test One';
        mottakerInputOne.naermesteLeder = naermesteLeder;

        TAG_ExternalNotificationModel.AltinnRolleMottakerInput altinnRolle = new TAG_ExternalNotificationModel.AltinnRolleMottakerInput();
        altinnRolle.roleDefinitionCode = 'roleDefinitionCode Test One';
        mottakerInputOne.altinnRolle = altinnRolle;

        TAG_ExternalNotificationModel.AltinnReporteeMottakerInput altinnReportee = new TAG_ExternalNotificationModel.AltinnReporteeMottakerInput();
        altinnReportee.fnr = 'fnr Test One';
        mottakerInputOne.altinnReportee = altinnReportee;

        mottakere.add(mottakerInputOne);

        TAG_ExternalNotificationModel.MottakerInput mottakerInputTwo = new TAG_ExternalNotificationModel.MottakerInput();

        TAG_ExternalNotificationModel.AltinnMottakerInput altinnTwo = new TAG_ExternalNotificationModel.AltinnMottakerInput();
        altinnTwo.serviceCode = 'serviceCode Test Two';
        altinnTwo.serviceEdition = 'serviceEdition Test Two';
        mottakerInputTwo.altinn = altinnTwo;

        TAG_ExternalNotificationModel.NaermesteLederMottakerInput naermesteLederTwo = new TAG_ExternalNotificationModel.NaermesteLederMottakerInput();
        naermesteLederTwo.ansattFnr = 'ansattFnr Test Two';
        naermesteLederTwo.naermesteLederFnr = 'naermesteLederFnr Test Two';
        mottakerInputTwo.naermesteLeder = naermesteLederTwo;

        mottakere.add(mottakerInputTwo);
        TAG_ExternalNotificationModel.NyBeskjedInput nyBeskjedInput = new TAG_ExternalNotificationModel.NyBeskjedInput();
        nyBeskjedInput.mottakere = mottakere;

        TAG_ExternalNotificationModel.NotifikasjonInput notifikasjon = new TAG_ExternalNotificationModel.NotifikasjonInput();
        notifikasjon.merkelapp = 'merkelapp Test';
        notifikasjon.lenke = 'lenke Test';
        notifikasjon.tekst = 'tekst Test';
        nyBeskjedInput.notifikasjon = notifikasjon;

        List<GQLArgument> arguments = new List<GQLArgument>();
        arguments.add(new GQLArgument('nyBeskjed', new GQLValue(nyBeskjedInput)));

        GQLSelectionSet selectionSetOne = new GQLSelectionSet();
        selectionSetOne.addItem(new GQLField('noko'));

        GQLSelectionSet selectionSetTwo = new GQLSelectionSet();
        selectionSetTwo.addItem(new GQLField('nyBeskjed', new GQLArguments(arguments), selectionSetOne));

        GQLOperation operation = new GQLOperation(type, name, definitions, selectionSetTwo);

        GQLQuery query = new GQLQuery(operation, 'TestVariable');
        System.debug(query.build());
        Test.stopTest();
    }

    @IsTest
    static void testGQLOperationType() {
        String result;

        Test.startTest();
        GQLOperationType operationType = new GQLOperationType(GQLOperationType_e.QUERY);
        result = operationType.build();
        Test.stopTest();

        System.assertEquals('query', result);
    }

    @IsTest
    static void testGQLVariableType() {
        String result;

        Test.startTest();
        GQLVariableType variableType = new GQLVariableType('TestVariableType');
        result = variableType.build();
        Test.stopTest();

        System.assertEquals('TestVariableType', result);
    }

    @IsTest
    static void testGQLVariableTypeNonNullType() {
        String result;

        Test.startTest();
        GQLVariableType variableType = new GQLVariableType('TestVariableType', false, true, false);
        result = variableType.build();
        Test.stopTest();

        System.assertEquals('TestVariableType!', result);
    }

    @IsTest
    static void testGQLVariableTypeListType() {
        String result;

        Test.startTest();
        GQLVariableType variableType = new GQLVariableType('TestVariableType', true, false, false);
        result = variableType.build();
        Test.stopTest();

        System.assertEquals('[TestVariableType]', result);
    }

    @IsTest
    static void testGQLVariableTypeNonNullTypeAndListTypeAndnonNullListType() {
        String result;

        Test.startTest();
        GQLVariableType variableType = new GQLVariableType('TestVariableType', true, true, true);
        result = variableType.build();
        Test.stopTest();

        System.assertEquals('[TestVariableType!]!', result);
    }
}
