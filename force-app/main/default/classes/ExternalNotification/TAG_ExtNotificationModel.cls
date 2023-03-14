/**
 * @description
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-01-16 Created.
 *
 * @group TAG External Notification
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public class TAG_ExtNotificationModel {
    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
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
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
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
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#altinnmottakerinput
     */
    public class AltinnMottakerInput {
        public String serviceCode;
        public String serviceEdition;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#naermesteledermottakerinput
     */
    public class NaermesteLederMottakerInput {
        public String naermesteLederFnr;
        public String ansattFnr;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#altinnrollemottakerinput
     */
    public class AltinnRolleMottakerInput {
        public String roleDefinitionCode;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#altinnreporteemottakerinput
     */
    public class AltinnReporteeMottakerInput {
        public String fnr;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#notifikasjoninput
     */
    public class NotifikasjonInput {
        public String merkelapp;
        public String tekst;
        public String lenke;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
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
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#futuretemporalinput
     */
    public class FutureTemporalInput {
        public String den;
        public String om;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#eksterntvarselinput
     */
    public class EksterntVarselInput {
        public EksterntVarselSmsInput sms;
        public EksterntVarselEpostInput epost;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#eksterntvarselsmsinput
     */
    public class EksterntVarselSmsInput {
        public SmsMottakerInput mottaker;
        public String smsTekst;
        public SendetidspunktInput sendetidspunkt;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#smsmottakerinput
     */
    public class SmsMottakerInput {
        public SmsKontaktInfoInput kontaktinfo;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#smsmottakerinput
     */
    public class SmsKontaktInfoInput {
        public String tlf;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#sendetidspunktinput
     */
    public class SendetidspunktInput {
        public String tidspunkt;
        public sendevindu sendevindu;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#sendevindu
     */
    public enum Sendevindu {
        NKS_AAPNINGSTID,
        DAGTID_IKKE_SOENDAG,
        LOEPENDE
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
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
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#epostmottakerinput
     */
    public class EpostMottakerInput {
        public EpostKontaktInfoInput kontaktinfo;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-01-16 Created.
     * @see https://navikt.github.io/arbeidsgiver-notifikasjon-produsent-api/api/#epostkontaktinfoinput
     */
    public class EpostKontaktInfoInput {
        public String epostadresse;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-02-21 Created.
     */
    public class Variabler {
        public String eksternId;
        public String virksomhetsnummer;
        public String lenke;
        public String epostHtmlBody;
        public String ansattFnr;
        public String naermesteLederFnr;
        public String tlf;
        public String epost;
    }
}
