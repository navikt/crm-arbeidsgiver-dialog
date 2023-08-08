/**
 * @description This is the
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 * @since 2023-07-18 Updated to reflect the use of Asynchronous and Synchronous sending of notifications.
 *
 * @see [License](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/LICENSE)
 * @see [Github](https://github.com/navikt/crm-arbeidsgiver-dialog)
 *
 * @group TAG External Notification
 */
public with sharing class TAG_ExtNotificationFlowController {
    @TestVisible
    private static TAG_ExtNotificationService extNotificationService = new TAG_ExtNotificationService();

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@mav.no>
     * @since 2023-05-08
     *
     * @param requests
     * @return
     */
    @InvocableMethod(
        label='Send SMS Notification'
        description='Sending notification to employer on the employer my page on nav.no. Also possible to include an notification by sms to provided phone number'
        category='Notifications'
        iconName='slds:custom:custom53'
    )
    public static List<ExtNotificationResult> sendExternalNotification(List<ExtNotificationRequest> requests) {
        ExtNotificationRequest request = requests[0];

        createNotification(extNotificationService, request);
        if (request.sendSms) {
            addSMSNotification(extNotificationService, request);
        }

        if (request.sendAsync) {
            buildAndSendExternalNotificationAsync(extNotificationService);

            List<ExtNotificationResult> resultsList = new List<ExtNotificationResult>();
            ExtNotificationResult result = new ExtNotificationResult();
            result.success = true;
            result.sentAsync = true;
            resultsList.add(result);

            return resultsList;
        }

        return getResponseAndCreateResults(buildAndSendExternalNotification(extNotificationService));
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-0 Created.
     *
     * @param dispatchWindow
     * @return
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
     * @param requests
     * @return
     */
    @TestVisible
    private static TAG_IExtNotificationService createNotification(
        TAG_IExtNotificationService extNotificationService,
        ExtNotificationRequest request
    ) {
        extNotificationService.notification(
            request.enterpriseNumber,
            request.externalId,
            request.groupingId,
            request.notificationText,
            request.url
        );

        return extNotificationService;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-06 Created.
     *
     * @param requests
     * @return
     */
    @TestVisible
    private static TAG_IExtNotificationService addSMSNotification(
        TAG_IExtNotificationService extNotificationService,
        ExtNotificationRequest request
    ) {
        extNotificationService.smsNotification(
            request.phoneNumber,
            request.smsText,
            getDispatchWindowEnum(request.dispatchWindow)
        );

        return extNotificationService;
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
     * @return
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
     * @return  `List<ExtNotificationResult>`
     */
    @TestVisible
    private static List<ExtNotificationResult> getResponseAndCreateResults(
        TAG_IExtNotificationService extNotificationService
    ) {
        HttpResponse response = extNotificationService.getResponse();

        List<ExtNotificationResult> resultsList = new List<ExtNotificationResult>();
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
            Map<String, Object> responseDeserialize = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> data = (Map<String, Object>) responseDeserialize?.get('data');
            Map<String, Object> nyBeskjed = (Map<String, Object>) data?.get('nyBeskjed');
            result.typeName = (String) nyBeskjed?.get('__typename');
            result.errorMessage = (String) nyBeskjed?.get('feilmelding');
            result.notificationId = (String) nyBeskjed?.get('id');
            Map<String, Object> eksterneVarsler = (Map<String, Object>) nyBeskjed?.get('eksterneVarsler');
            result.externalNotificationId = (String) eksterneVarsler?.get('id');
        }

        if (String.isBlank(result.errorMessage)) {
            result.success = true;
        }

        resultsList.add(result);

        return resultsList;
    }

    /**
     * @description
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
     * @description
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
