public class EmployerNotificationOppgaveWrapper {
    private String tildeltEnhetsnr; //Enheten oppgaven er tildelt. Dersom enhet ikke er angitt, så vil oppgaven automatisk fordeles iht. standard arbeidsfordelingsregler (se norg2)
    private String orgnr;
    private String tilordnetRessurs;
    private String beskrivelse;
    private String tema;
    private String behandlingstema; //ab0336 for "Midlertidig lønnstilskudd"
    private String oppgavetype; // REQUIRED- TIL for Tiltak
    private String behandlingstype; //ae0034 - gyldig behandlingstype for "Midlertidig lønnstilskudd"
    private String aktivDato; //Datestring, REQUIRED
    private String fristFerdigstillelse; //Datestring
    private String prioritet; // [HOY, NORM, LAV],
    //status is not used for POST request, only EDIT
    //version is not required when task is being created, but is required when EDIT

    //Constructor for converting a NavTaskRequest to a valid API oppgave request
    public EmployerNotificationOppgaveWrapper(EmployerNotificationOppgaveService.NotificationOppgaveRequest request) {
    }
}
