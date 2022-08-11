# crm-arbeidsgiver-dialog

[![Build](https://github.com/navikt/crm-arbeidsgiver-dialog/workflows/master/badge.svg)](https://github.com/navikt/crm-arbeidsgiver-dialog/actions?query=workflow%3ABuild)
[![GitHub version](https://badgen.net/github/release/navikt/crm-arbeidsgiver-dialog/stable)](https://github.com/navikt/crm-arbeidsgiver-dialog)
[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/LICENSE)
[![codecov](https://codecov.io/gh/navikt/crm-arbeidsgiver-dialog/branch/master/graph/badge.svg)](https://codecov.io/gh/navikt/crm-arbeidsgiver-dialog)

Dette repo brukes for funksjonalitet knyttet til asynkron dialog mellom nav ansatte og arbeidsgivere.

---

## Avhengigheter

Pakken har flere avhengiheter. Sjekk [sfdx-project.json](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/sfdx-project.json) filen for å se en oversikt av alle avhengigheter.

## Komme i gang

1. Salesforce DX-bruker. Kontakt #crm-plattform-team på Slack om du ikke har dette
2. Installer Salesforce DX CLI (SFDX)
    - Last ned fra [Salesforce.com](https://developer.salesforce.com/tools/sfdxcli)
    - Eller benytt npm: `npm install sfdx-cli --global`
3. Klon dette repoet ([GitHub Desktop](https://desktop.github.com) anbefales for ikke-utviklere)
4. Installer [SSDX](https://github.com/navikt/ssdx)
    - Med SSDX kan du lage scratch orger og gjøre deklarative endringer (gjøre endringer i nettleseren på Salesforce, altså ikke-utvikling)
    - **Trenger du ikke verktøy utvikling kan du stoppe her**
5. Installer [VS Code](https://code.visualstudio.com) (anbefalt)
6. Installer [Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode)
7. Installer [AdoptOpenJDK](https://adoptopenjdk.net) (kun versjon 8 eller 11)
8. Åpne VS Code Settings og søk etter `salesforcedx-vscode-apex`
9. Under `Java Home`, legg inn følgende:
    - macOS: `/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home`
    - Windows: `C:\\Program Files\\AdoptOpenJDK\\jdk-11.0.3.7-hotspot` (merk at versjonsnummer kan endre seg)

## Bygg

For å bygge lokalt uten SSDX, bruk føglende

1. Hvis du ikke har autentisert en DevHub, kjør `sfdx auth:web:login -d -a production` og så logge inn.
2. Installer sfdx plugin `echo y | sfdx plugins:install sfpowerkit@2.0.1`
3. Opprette fil prosjekets root directory med navn `env.json`

```
{
    "PACKAGE_KEY": "Your Package Key"
}

```

4. Opprette scratch org, installer avhengigheter og så pushe metadata:

```
npm install
npm run mac:build
```

# Experience Cloud

Når man skal teste funksjonaliteter i Experience Cloud under utvikling i scratch miljøet kan man bruke test brukeren "Kari Nordmann".

### Teste dialog om en avtale

Når man er på Home siden kan man legge til noen url paremetere som vil trigger en redirect til Thread\_\_c detail siden.

E.g. https://dream-business-489.my.site.com/s/?organisasjonsnummer=910825585&avtalenummer=1234

Avtalen, virksomheten og tråden skal være opprettet automatisk når mann bruker build scripten over.

Legge til dette på slutten av URLen e.g.

    ```
    ?organisasjonsnummer=910825585&avtalenummer=1234
    ```

# Henvendelser

For spørsmål om denne applikasjonen, bruk #arbeidsgiver-crm på Slack.
