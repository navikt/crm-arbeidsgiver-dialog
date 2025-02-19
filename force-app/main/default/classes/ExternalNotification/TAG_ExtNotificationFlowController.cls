/**
 * @description This External Notification Flow Controller class exposes a Flow Action to use when
 * you send an external notification via a flow. The external notification flow action will send a
 * message to the employer identified by Enterprise Number. The notification is shown in the
 * NAV Employer Portal (employer my page on nav.no) in the notification bell. Additionally, you can
 * send a sms to the phone number identified.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 * @since 2023-07-18 Updated to reflect the use of Asynchronous and Synchronous sending of notifications.
 * @since 2023-08-09 Changed Flow Action to handle bulkification and added error message on missing request.
 *
 * @see [License](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/LICENSE)
 * @see [Github](https://github.com/navikt/crm-arbeidsgiver-dialog)
 * @see TAG_ExtNotificationService
 * @see TAG_ExtNotificationFlowController_Test
 *
 * @group TAG External Notification
 */
public with sharing class TAG_ExtNotificationFlowController {
    public static final String ERROR_MISSING_REQUEST = 'No requests provided.';

    /**
     * @description The Flow Action exposed to the Flow Builder.
     * Sending notification to employer on the NAV Employer Portal (employer my page on nav.no).
     * Also possible to include an notification by sms to provided phone number.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-05-08 Created.
     *
     * @param requests The request/input parameters from the Flow Action.
     * @return The result `List<ExtNotificationResult>` is provided back to the Flow Action.
     *
     * @see TAG_ExtNotificationFlowController.ExtNotificationRequest
     * @see TAG_ExtNotificationFlowController.ExtNotificationResult
     */
    @InvocableMethod(
        label='Send External Notification (with/without SMS)'
        description='Sending notification to employer on the Nav Employer Portal (employer my page on nav.no). Also possible to include an notification by sms to provided phone number.'
        category='Notifications'
        iconName='slds:custom:custom53'
    )
    public static List<ExtNotificationResult> sendExternalNotification(List<ExtNotificationRequest> requests) {
        List<ExtNotificationResult> resultsList = new List<ExtNotificationResult>();

        if (requests.size() == 0) {
            ExtNotificationResult result = new ExtNotificationResult();
            result.success = false;
            result.errorMessage = ERROR_MISSING_REQUEST;
            resultsList.add(result);
            return resultsList;
        }

        TAG_ExtNotificationService extNotificationService;

        for (ExtNotificationRequest request : requests) {
            extNotificationService = new TAG_ExtNotificationService();
            createNotification(extNotificationService, request);

            request.sendSms = request.sendSms == null ? false : request.sendSms;
            if (request.sendSms) {
                addSMSNotification(extNotificationService, request);
            }

            request.sendAsync = request.sendAsync == null ? false : request.sendAsync;
            if (request.sendAsync) {
                buildAndSendExternalNotificationAsync(extNotificationService);

                ExtNotificationResult result = new ExtNotificationResult();
                result.success = true;
                result.sentAsync = true;
                resultsList.add(result);
            } else {
                resultsList.add(getResponseAndCreateResults(buildAndSendExternalNotification(extNotificationService)));
            }
        }

        return resultsList;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-0 Created.
     *
     * @param dispatchWindow
     * @return ...
     */
    @TestVisible
    private static TAG_DispatchWindow_e getDispatchWindowEnum(String dispatchWindow) {
        switch on dispatchWindow {
            when 'NKS_BUSINESS_HOURS' {
                return TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;
            }
            when 'DAYTIME_NOT_SUNDAY' {
                return TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY;
            }
            when 'CONTINUOUSLY' {
                return TAG_DispatchWindow_e.CONTINUOUSLY;
            }
            when else {
                return null;
            }
        }
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     *
     * @param extNotificationService
     * @param requests
     */
    @TestVisible
    private static void createNotification(
        TAG_IExtNotificationService extNotificationService,
        ExtNotificationRequest request
    ) {
        extNotificationService.notification(
            request.label,
            request.serviceCode,
            request.serviceEdition,
            request.enterpriseNumber,
            request.externalId,
            request.groupingId,
            request.notificationText,
            request.url
        );
    }

    /**
     * @description
     *
     * @param extNotificationService
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     *
     * @param requests
     */
    @TestVisible
    private static void addSMSNotification(
        TAG_IExtNotificationService extNotificationService,
        ExtNotificationRequest request
    ) {
        extNotificationService.smsNotification(
            request.phoneNumber,
            request.smsText,
            getDispatchWindowEnum(request.dispatchWindow)
        );
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @author Piotr <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     * @since 2023-06-14 Updated ...
     *
     * @param requests
     * @return ...
     */
    @TestVisible
    private static TAG_IExtNotificationService buildAndSendExternalNotification(
        TAG_IExtNotificationService extNotificationService
    ) {
        extNotificationService.build().send();

        return extNotificationService;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-07-18 Created.
     *
     * @param requests
     */
    @TestVisible
    private static void buildAndSendExternalNotificationAsync(TAG_IExtNotificationService iExtNotificationService) {
        iExtNotificationService.build();
        TAG_ExtNotificationService extNotificationService = (TAG_ExtNotificationService) iExtNotificationService;
        TAG_ExtNotificationService.sendAsync(
            extNotificationService.externalId,
            extNotificationService.notificationBody
        );
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     *
     * @param extNotificationService
     * @return  `ExtNotificationResult`
     */
    @TestVisible
    private static ExtNotificationResult getResponseAndCreateResults(
        TAG_IExtNotificationService extNotificationService
    ) {
        HttpResponse response = extNotificationService.getResponse();

        ExtNotificationResult result = new ExtNotificationResult();
        result.success = false;
        result.sentAsync = false;

        /*
        {"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"f764bdf3-9905-40b2-a081-acb902a4cecf"}}}
        {"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"f764bdf3-9905-40b2-a081-acb902a4cecf", "eksterneVarsler":{"id":"f764bdf3-9905-40b2-a081-acb809a4cccf"}}}}
        {"data":{"nyBeskjed":{"__typename":"DuplikatEksternIdOgMerkelapp","feilmelding":"notifikasjon med angitt eksternId og merkelapp finnes fra før"}}}
        */

        if (response.getStatusCode() <> 200) {
            String errorMessage = response.getStatus();
            if (String.isNotBlank(response.getBody())) {
                errorMessage = errorMessage + ' ' + response.getBody();
            }
            result.errorMessage = errorMessage;
            result.statusCode = response.getStatusCode();
        } else {
            result.statusCode = response.getStatusCode();
            try {
                Map<String, Object> responseDeserialize = (Map<String, Object>) JSON.deserializeUntyped(
                    response.getBody()
                );
                System.debug(LoggingLevel.DEBUG, 'responseDeserialize: ' + responseDeserialize);
                Map<String, Object> data = (Map<String, Object>) responseDeserialize?.get('data');
                Map<String, Object> nyBeskjed = (Map<String, Object>) data?.get('nyBeskjed');
                result.typeName = (String) nyBeskjed?.get('__typename');
                result.errorMessage = (String) nyBeskjed?.get('feilmelding');
                result.notificationId = (String) nyBeskjed?.get('id');
                Map<String, Object> eksterneVarsler = (Map<String, Object>) nyBeskjed?.get('eksterneVarsler');
                result.externalNotificationId = (String) eksterneVarsler?.get('id');
            } catch (Exception ex) {
                result.errorMessage = 'The JSON body is not valid! - ' + ex.getTypeName() + ': ' + ex.getMessage();
            }
        }

        if (String.isBlank(result.errorMessage)) {
            result.success = true;
        }

        return result;
    }

    /**
     * @description ExtNotificationRequest ...
     *
     * @auther Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     */
    public class ExtNotificationRequest {
        @InvocableVariable(
            label='Send Notification Async'
            description='If true, the notification will be sent "Asynchronous". If false, the notification will be sent "Synchronous".'
            required=true
        )
        public boolean sendAsync;

        @InvocableVariable(label='Label' description='Notification label' required=true)
        public String label;

        @InvocableVariable(label='Service Code' description='Service code for Altinn topic' required=true)
        public String serviceCode;

        @InvocableVariable(label='Service Edition' description='Service edition for Altinn topic' required=true)
        public String serviceEdition;

        @InvocableVariable(
            label='Enterprise Number'
            description='The enterprise that should recive the notification.'
            required=true
        )
        public String enterpriseNumber;

        @InvocableVariable(
            label='External Id'
            description='The id from the external system responisble for sending the notification. This is used to unickly identify the notification.'
            required=true
        )
        public String externalId;

        @InvocableVariable(
            label='Grouping Id'
            description='The grouping ID makes it possible to link different tasks, messages and cases. It is not shown to users. The case number is a natural grouping ID.'
            required=false
        )
        public String groupingId;

        @InvocableVariable(label='Notification Text' description='The Notification text.' required=true)
        public String notificationText;

        @InvocableVariable(label='URL' description='The URL that the Notification is referring to.' required=true)
        public String url;

        @invocableVariable(
            label='Send SMS'
            description='Sends an SMS notification in additon to the notification in the bell to the provided phone number.'
            required=false
        )
        public Boolean sendSms;

        @InvocableVariable(
            label='Phone Number'
            description='The Phone Number to send the SMS Notification to.'
            required=false
        )
        public String phoneNumber;

        @InvocableVariable(label='SMS Text' description='The SMS Notification text.' required=false)
        public String smsText;

        @InvocableVariable(
            label='Dispatch Window'
            description='Dispatch Window. Values: NKS_BUSINESS_HOURS, DAYTIME_NOT_SUNDAY, CONTINUOUSLY'
            required=false
        )
        public String dispatchWindow;
    }

    /**
     * @description ExtNotificationResult...
     *
     * @auther Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     * @since 2023-07-18 Updated to reflect the use of Asynchronous and Synchronous sending of notifications.
     */
    public class ExtNotificationResult {
        @InvocableVariable(
            label='Success State'
            description='If sent Asynchronous, this will always be true. If sent Synchronous, this will be true if the notification was sent successfully, and false if not.'
        )
        public Boolean success;

        @InvocableVariable(
            label='Sent Asynchronous'
            description='If true, the notification was sent "Asynchronous". If false, the notification was sent "Synchronous".'
        )
        public Boolean sentAsync;

        @InvocableVariable
        public String notificationId;

        @InvocableVariable
        public String externalNotificationId;

        @InvocableVariable
        public String typeName;

        @InvocableVariable
        public String errorMessage;

        @InvocableVariable
        public Integer statusCode;
    }
}
