public class EmployerNotificationOppgaveWrapper {
    private String tildeltEnhetsnr; //Enheten oppgaven er tildelt. Dersom enhet ikke er angitt, så vil oppgaven automatisk fordeles iht. standard arbeidsfordelingsregler (se norg2)
    private String opprettetAvEnhetsnr;
    private String orgnr;
    private String tilordnetRessurs;
    private String beskrivelse;
    private String tema; // REQUIRED- TIL for Tiltak
    private String behandlingstema; //ab0336 for "Midlertidig lønnstilskudd"
    private String oppgavetype; //'KONT_BRUK', term: Kontakt bruker'
    private String behandlingstype; //ae0034 - gyldig behandlingstype for "Midlertidig lønnstilskudd"
    private String aktivDato; //Datestring, REQUIRED
    private String fristFerdigstillelse; //Datestring
    private String prioritet; // [HOY, NORM, LAV],
    //status is not used for POST request, only EDIT
    //version is not required when task is being created, but is required when EDIT
    public EmployerNotificationOppgaveWrapper() {
    }
    //Constructor for converting a NavTaskRequest to a valid API oppgave request
    public EmployerNotificationOppgaveWrapper(EmployerNotificationOppgaveHandler.NotificationOppgaveRequest request) {
        tildeltEnhetsnr = request.assignToUnitNumber;
        opprettetAvEnhetsnr = request.assignToUnitNumber;
        orgnr = request.organizationNumber;
        tilordnetRessurs = request.assignedResource;
        beskrivelse = request.description;
        tema = request.theme;
        behandlingstema = request.processingTheme;
        oppgavetype = request.taskTypeCode;
        behandlingstype = request.processingType;
        aktivDato = Datetime.now().format('yyyy-MM-dd');
        fristFerdigstillelse = Datetime.now().addDays(request.dueDays).format('yyyy-MM-dd');
        prioritet = request.priority;
    }
}
