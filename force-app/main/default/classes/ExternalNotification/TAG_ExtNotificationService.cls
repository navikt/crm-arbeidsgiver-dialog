/**
 * @description This is the
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-07 Created.
 *
 * @group TAG External Notification
 */
public inherited sharing class TAG_ExtNotificationService {
    @TestVisible
    private static final String DEFAULT_NAME = 'OpprettNyBeskjed';
    private static final String DEFAULT_FIELD_NAME = 'nyBeskjed';
    private static final String DEFAULT_ARGUMENT_NAME = 'nyBeskjed';
    @TestVisible
    private static final GQLOperationType_e DEFAULT_OPERATION_TYPE = GQLOperationType_e.MUTATION;

    @TestVisible
    private String name;
    @TestVisible
    private GQLOperationType operationType;
    @TestVisible
    private TAG_ExtNotificationBuilder notificationBuilder;
    private GQLQuery query;
    private TAG_ExtNotificationModel.NyBeskjedInput messageInput;
    private List<GQLVariable> gqlVariables;
    private TAG_ExtNotificationModel.Variabler varValue;

    @TestVisible
    private Boolean useAnsattFnr = false;
    @TestVisible
    private Boolean useEksternId = false;
    @TestVisible
    private Boolean useEpost = false;
    @TestVisible
    private Boolean useEpostHtmlBody = false;
    @TestVisible
    private Boolean useLenke = false;
    @TestVisible
    private Boolean useNaermesteLederFnr = false;
    @TestVisible
    private Boolean useTlf = false;
    @TestVisible
    private Boolean useVirksomhetsnummer = false;

    @TestVisible
    private String valueAnsattFnr = null;
    @TestVisible
    private String valueEksternId = null;
    @TestVisible
    private String valueEpost = null;
    @TestVisible
    private String valueEpostHtmlBody = null;
    @TestVisible
    private String valueLenke = null;
    @TestVisible
    private String valueNaermesteLederFnr = null;
    @TestVisible
    private String valueTlf = null;
    @TestVisible
    private String valueVirksomhetsnummer = null;

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     */
    public TAG_ExtNotificationService() {
        this(DEFAULT_NAME, DEFAULT_OPERATION_TYPE);
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @param name
     */
    public TAG_ExtNotificationService(String name) {
        this(name, DEFAULT_OPERATION_TYPE);
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @param operationType
     */
    public TAG_ExtNotificationService(GQLOperationType_e operationType) {
        this(DEFAULT_NAME, operationType);
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @param name
     * @param operationType
     */
    public TAG_ExtNotificationService(String name, GQLOperationType_e operationType) {
        this.name = name;
        this.operationType = new GQLOperationType(operationType);
        this.notificationBuilder();
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     */
    @TestVisible
    private void notificationBuilder() {
        this.notificationBuilder = TAG_ExtNotificationBuilder.start();
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @param phoneNumber
     * @param smsText
     * @param dispatchTime
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService smsNotification(String phoneNumber, String smsText, String dispatchTime) {
        TAG_SMSNotificationBuilder smsNotificationBuilder = TAG_SMSNotificationBuilder.start()
            .recipient(phoneNumber)
            .text(smsText)
            .dispatchTime(dispatchTime);

        this.notificationBuilder.smsNotification(smsNotificationBuilder);
        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @param phoneNumber
     * @param smsText
     * @param dispatchWindow
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService smsNotification(
        String phoneNumber,
        String smsText,
        TAG_DispatchWindow_e dispatchWindow
    ) {
        TAG_SMSNotificationBuilder smsNotificationBuilder = TAG_SMSNotificationBuilder.start()
            .recipient(phoneNumber)
            .text(smsText)
            .dispatchWindow(dispatchWindow);

        this.notificationBuilder.smsNotification(smsNotificationBuilder);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `ansattFnr` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableAnsattFnr() {
        this.useAnsattFnr = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `ansattFnr` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService unuseVariableAnsattFnr() {
        this.useAnsattFnr = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `ansattFnr` variable is set to the value provided by the
     * `ansattFnr` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param ansattFnr
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableAnsattFnr(String ansattFnr) {
        this.valueAnsattFnr = ansattFnr;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `ansattFnr` variable is to be used/included and set to the value
     * provided by the `ansattFnr` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param ansattFnr
     * @return  `TAG_ExtNotificationService`
     * @see useVariableAnsattFnr
     * @see setVariableAnsattFnr
     */
    public TAG_ExtNotificationService useAndSetVariableAnsattFnr(String ansattFnr) {
        this.useVariableAnsattFnr();
        this.setVariableAnsattFnr(ansattFnr);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `eksternId` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableEksternId() {
        this.useEksternId = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `eksternId` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableEksternId() {
        this.useEksternId = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `eksternId` variable is set to the value provided by the
     * `eksternId` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param eksternId
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableEksternId(String eksternId) {
        this.valueEksternId = eksternId;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `eksternId` variable is to be used/included and set to the value
     * provided by the `eksternId` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param eksternId
     * @return  `TAG_ExtNotificationService`
     * @see useVariableEksternId
     * @see setVariableEksternId
     */
    public TAG_ExtNotificationService useAndSetVariableEksternId(String eksternId) {
        this.useVariableEksternId();
        this.setVariableEksternId(eksternId);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epost` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableEpost() {
        this.useEpost = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epost` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableEpost() {
        this.useEpost = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epost` variable is set to the value provided by the
     * `epost` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param epost
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableEpost(String epost) {
        this.valueEpost = epost;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epost` variable is to be used/included and set to the value
     * provided by the `epost` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param epost
     * @return  `TAG_ExtNotificationService`
     * @see useVariableEpost
     * @see setVariableEpost
     */
    public TAG_ExtNotificationService useAndSetVariableEpost(String epost) {
        this.useVariableEpost();
        this.setVariableEpost(epost);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epostHtmlBody` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableEpostHtmlBody() {
        this.useEpostHtmlBody = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epostHtmlBody` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableEpostHtmlBody() {
        this.useEpostHtmlBody = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epostHtmlBody` variable is set to the value provided by the
     * `epostHtmlBody` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param epostHtmlBody
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableEpostHtmlBody(String epostHtmlBody) {
        this.valueEpostHtmlBody = epostHtmlBody;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `epostHtmlBody` variable is to be used/included and set to the value
     * provided by the `epostHtmlBody` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param epostHtmlBody
     * @return  `TAG_ExtNotificationService`
     * @see useVariableEpostHtmlBody
     * @see setVariableEpostHtmlBody
     */
    public TAG_ExtNotificationService useAndSetVariableEpostHtmlBody(String epostHtmlBody) {
        this.useVariableEpostHtmlBody();
        this.setVariableEpostHtmlBody(epostHtmlBody);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `lenke` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableLenke() {
        this.useLenke = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `lenke` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableLenke() {
        this.useLenke = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `lenke` variable is set to the value provided by the
     * `lenke` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param lenke
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableLenke(String lenke) {
        this.valueLenke = lenke;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `lenke` variable is to be used/included and set to the value
     * provided by the `lenke` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param lenke
     * @return  `TAG_ExtNotificationService`
     * @see useVariableLenke
     * @see setVariableLenke
     */
    public TAG_ExtNotificationService useAndSetVariableLenke(String lenke) {
        this.useVariableLenke();
        this.setVariableLenke(lenke);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `naermesteLederFnr` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableNaermesteLederFnr() {
        this.useNaermesteLederFnr = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `naermesteLederFnr` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableNaermesteLederFnr() {
        this.useNaermesteLederFnr = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `naermesteLederFnr` variable is set to the value provided by the
     * `naermesteLederFnr` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param naermesteLederFnr
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableNaermesteLederFnr(String naermesteLederFnr) {
        this.valueNaermesteLederFnr = naermesteLederFnr;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `naermesteLederFnr` variable is to be used/included and set to the value
     * provided by the `naermesteLederFnr` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param naermesteLederFnr
     * @return  `TAG_ExtNotificationService`
     * @see useVariableNaermesteLederFnr
     * @see setVariableNaermesteLederFnr
     */
    public TAG_ExtNotificationService useAndSetVariableNaermesteLederFnr(String naermesteLederFnr) {
        this.useVariableNaermesteLederFnr();
        this.setVariableNaermesteLederFnr(naermesteLederFnr);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `tlf` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableTlf() {
        this.useTlf = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `tlf` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableTlf() {
        this.useTlf = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `tlf` variable is set to the value provided by the
     * `tlf` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param tlf
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableTlf(String tlf) {
        this.valueTlf = tlf;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `tlf` variable is to be used/included and set to the value
     * provided by the `tlf` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param tlf
     * @return  `TAG_ExtNotificationService`
     * @see useVariableTlf
     * @see setVariableTlf
     */
    public TAG_ExtNotificationService useAndSetVariableTlf(String tlf) {
        this.useVariableTlf();
        this.setVariableTlf(tlf);
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `virksomhetsnummer` variable is to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService useVariableVirksomhetsnummer() {
        this.useVirksomhetsnummer = true;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `virksomhetsnummer` variable is NOT to be used/included.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return Returns itself (`TAG_ExtNotificationService` instance).
     */
    public TAG_ExtNotificationService unuseVariableVirksomhetsnummer() {
        this.useVirksomhetsnummer = false;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `virksomhetsnummer` variable is set to the value provided by the
     * `virksomhetsnummer` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param virksomhetsnummer
     * @return  `TAG_ExtNotificationService`
     */
    public TAG_ExtNotificationService setVariableVirksomhetsnummer(String virksomhetsnummer) {
        this.valueVirksomhetsnummer = virksomhetsnummer;
        return this;
    }

    /**
     * @description This is a convenience method to indicate that the
     * `virksomhetsnummer` variable is to be used/included and set to the value
     * provided by the `virksomhetsnummer` parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-22 Created.
     * @param virksomhetsnummer
     * @return  `TAG_ExtNotificationService`
     * @see useVariableVirksomhetsnummer
     * @see setVariableVirksomhetsnummer
     */
    public TAG_ExtNotificationService useAndSetVariableVirksomhetsnummer(String virksomhetsnummer) {
        this.useVariableVirksomhetsnummer();
        this.setVariableVirksomhetsnummer(virksomhetsnummer);
        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     * @return  `List<GQLVariable>`
     */
    @TestVisible
    private List<GQLVariable> buildGQLVariable() {
        List<GQLVariable> gqlVariables = new List<GQLVariable>();
        varValue = new TAG_ExtNotificationModel.Variabler();

        if (useAnsattFnr) {
            gqlVariables.add(new GQLVariable('ansattFnr', new GQLVariableType('String', false, true, false)));
            varValue.ansattFnr = this.valueAnsattFnr;
        }
        if (useEksternId) {
            gqlVariables.add(new GQLVariable('eksternId', new GQLVariableType('String', false, true, false)));
            varValue.eksternId = this.valueEksternId;
        }
        if (useEpost) {
            gqlVariables.add(new GQLVariable('epost', new GQLVariableType('String', false, true, false)));
            varValue.epost = this.valueEpost;
        }
        if (useEpostHtmlBody) {
            gqlVariables.add(new GQLVariable('epostHtmlBody', new GQLVariableType('String', false, true, false)));
            varValue.epostHtmlBody = this.valueEpostHtmlBody;
        }
        if (useLenke) {
            gqlVariables.add(new GQLVariable('lenke', new GQLVariableType('String', false, true, false)));
            varValue.lenke = this.valueLenke;
        }
        if (useNaermesteLederFnr) {
            gqlVariables.add(new GQLVariable('naermesteLederFnr', new GQLVariableType('String', false, true, false)));
            varValue.naermesteLederFnr = this.valueNaermesteLederFnr;
        }
        if (useTlf) {
            gqlVariables.add(new GQLVariable('tlf', new GQLVariableType('String', false, true, false)));
            varValue.tlf = this.valueTlf;
        }
        if (useVirksomhetsnummer) {
            gqlVariables.add(new GQLVariable('virksomhetsnummer', new GQLVariableType('String', false, true, false)));
            varValue.virksomhetsnummer = this.valueVirksomhetsnummer;
        }

        return gqlVariables;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     */
    public void build() {
        this.messageInput = this.notificationBuilder.build();

        List<GQLArgument> arguments = new List<GQLArgument>();
        arguments.add(new GQLArgument(DEFAULT_ARGUMENT_NAME, new GQLValue(this.messageInput)));

        GQLSelectionSet selectionSet = new GQLSelectionSet();
        selectionSet.addItem(new GQLField(DEFAULT_FIELD_NAME, new GQLArguments(arguments)));

        List<GQLVariable> gqlVariables = this.buildGQLVariable();

        GQLVariableDefinitions definitions = new GQLVariableDefinitions(gqlVariables);
        GQLOperation operation = new GQLOperation(this.operationType, this.name, definitions, selectionSet);

        this.query = new GQLQuery(operation, this.varValue);
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-14 Created.
     * @return  `GQLQuery`
     */
    public GQLQuery getQuery() {
        return this.query;
    }
}
