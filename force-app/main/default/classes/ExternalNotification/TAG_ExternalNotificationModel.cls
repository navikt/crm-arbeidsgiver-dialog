public with sharing class TAG_ExternalNotificationModel {
    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#nybeskjedinput
     */
    public class NyBeskjedInput {
        public MottakerInput mottaker;
        public List<MottakerInput> mottakere;
        public NotifikasjonInput notifikasjon;
        public MetadataInput metadata;
        public EksterntVarselInput eksterneVarsler;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#mottakerinput
     */
    public class MottakerInput {
        public AltinnMottakerInput altinn;
        public NaermesteLederMottakerInput naermesteLeder;
        public AltinnRolleMottakerInput altinnRolle;
        public AltinnReporteeMottakerInput altinnReportee;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#altinnmottakerinput
     */
    public class AltinnMottakerInput {
        public String serviceCode;
        public String serviceEdition;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#naermesteledermottakerinput
     */
    public class NaermesteLederMottakerInput {
        public String naermesteLederFnr;
        public String ansattFnr;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#altinnrollemottakerinput
     */
    public class AltinnRolleMottakerInput {
        public String roleDefinitionCode;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#altinnreporteemottakerinput
     */
    public class AltinnReporteeMottakerInput {
        public String fnr;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#notifikasjoninput
     */
    public class NotifikasjonInput {
        public String merkelapp;
        public String tekst;
        public String lenke;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#metadatainput
     */
    public class MetadataInput {
        public String virksomhetsnummer;
        public String eksternId;
        public String opprettetTidspunkt;
        public String grupperingsid;
        public FutureTemporalInput hardDelete;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#futuretemporalinput
     */
    public class FutureTemporalInput {
        public String den;
        public String om;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#eksterntvarselinput
     */
    public class EksterntVarselInput {
        public EksterntVarselSmsInput sms;
        public EksterntVarselEpostInput epost;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#eksterntvarselsmsinput
     */
    public class EksterntVarselSmsInput {
        public SmsMottakerInput mottaker;
        public String smsTekst;
        public SendetidspunktInput sendetidspunkt;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#smsmottakerinput
     */
    public class SmsMottakerInput {
        public SmsKontaktInfoInput kontaktinfo;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#smsmottakerinput
     */
    public class SmsKontaktInfoInput {
        public String tlf;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#sendetidspunktinput
     */
    public class SendetidspunktInput {
        public String tidspunkt;
        public sendevindu sendevindu;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#sendevindu
     */
    public enum Sendevindu {
        NKS_AAPNINGSTID,
        DAGTID_IKKE_SOENDAG,
        LOEPENDE
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#eksterntvarselepostinput
     */
    public class EksterntVarselEpostInput {
        public EpostMottakerInput mottaker;
        public String epostTittel;
        public String epostHtmlBody;
        public SendetidspunktInput sendetidspunkt;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#epostmottakerinput
     */
    public class EpostMottakerInput {
        public EpostKontaktInfoInput kontaktinfo;
    }

    /**
     * @description
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#epostkontaktinfoinput
     */
    public class EpostKontaktInfoInput {
        public String epostadresse;
    }
}
