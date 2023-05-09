/**
 * @description This is the
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-05-08 Created.
 *
 * @group TAG External Notification
 */
public with sharing class TAG_ExtNotificationFlowController {
    @InvocableMethod(
        label='Send SMS Notification'
        description='Sending SMS notification to phonenumber.'
        category='Notifications'
        iconName='slds:standard:sms'
    )
    public static List<SMSNotificationResults> sendSMSNotification(List<SMSNotificationRequests> requests) {
        TAG_DispatchWindow_e dispatchWindow;

        switch on requests[0].dispatchWindow {
            when 'NKS_BUSINESS_HOURS' {
                dispatchWindow = TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;
            }
            when 'DAYTIME_NOT_SUNDAY' {
                dispatchWindow = TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY;
            }
            when 'CONTINUOUSLY' {
                dispatchWindow = TAG_DispatchWindow_e.CONTINUOUSLY;
            }
            when else {
                dispatchWindow = null;
            }
        }

        TAG_ExtNotificationService extNotificationService = new TAG_ExtNotificationService();
        extNotificationService.notification(
                requests[0].enterpriseNumber,
                requests[0].externalId,
                requests[0].groupingId,
                requests[0].notificationText,
                requests[0].url
            )
            .smsNotification(requests[0].phoneNumber, requests[0].smsText, dispatchWindow)
            .build()
            .send();

        HttpResponse response = extNotificationService.getResponse();

        List<SMSNotificationResults> resultsList = new List<SMSNotificationResults>();

        SMSNotificationResults results = new SMSNotificationResults();

        /*
        {"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"f764bdf3-9905-40b2-a081-acb902a4cecf"}}}
        {"data":{"nyBeskjed":{"__typename":"NyBeskjedVellykket","id":"f764bdf3-9905-40b2-a081-acb902a4cecf", "eksterneVarsler":{"id":"f764bdf3-9905-40b2-a081-acb809a4cccf"}}}}
        {"data":{"nyBeskjed":{"__typename":"DuplikatEksternIdOgMerkelapp","feilmelding":"notifikasjon med angitt eksternId og merkelapp finnes fra før"}}}
        */

        Map<String, Object> responseDeserialize = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> data = (Map<String, Object>) responseDeserialize?.get('data');
        Map<String, Object> nyBeskjed = (Map<String, Object>) data?.get('nyBeskjed');
        results.typeName = (String) nyBeskjed?.get('__typename');
        results.errorMessage = (String) nyBeskjed?.get('feilmelding');
        results.notificationId = (String) nyBeskjed?.get('id');
        Map<String, Object> eksterneVarsler = (Map<String, Object>) nyBeskjed?.get('eksterneVarsler');
        results.externalNotificationId = (String) eksterneVarsler?.get('id');

        resultsList.add(results);

        return resultsList;
    }

    public class SMSNotificationRequests {
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

        @InvocableVariable(
            label='Phone Number'
            description='The Phone Number to send the SMS Notification to.'
            required=true
        )
        public String phoneNumber;

        @InvocableVariable(label='SMS Text' description='The SMS Notification text.' required=true)
        public String smsText;

        @InvocableVariable(
            label='Dispatch Window'
            description='Dispatch Window. Values: NKS_BUSINESS_HOURS, DAYTIME_NOT_SUNDAY, CONTINUOUSLY'
            required=true
        )
        public String dispatchWindow;
    }

    public class SMSNotificationResults {
        @InvocableVariable
        public String notificationId;

        @InvocableVariable
        public String externalNotificationId;

        @InvocableVariable
        public String typeName;

        @InvocableVariable
        public String errorMessage;
    }
}
