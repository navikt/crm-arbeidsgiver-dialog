public with sharing class TAG_ExtNotificationFlowController {
    @InvocableMethod(
        label='Send SMS Notification'
        description='Sending SMS notification to phonenumber.'
        category='Notifications'
        iconName='slds:standard:sms'
    )
    public static List<SMSNotificationResults> SendSMSNotification(List<SMSNotificationRequests> requests) {
        TAG_ExtNotificationService externalNotificationService = new TAG_ExtNotificationService();
        externalNotificationService.smsNotification(
            requests[0].phoneNumber,
            requests[0].smsText,
            requests[0].dispatchTime
        );

        List<SMSNotificationResults> resultsList = new List<SMSNotificationResults>();
        return resultsList;
    }

    public class SMSNotificationRequests {
        @InvocableVariable(
            label='Phone Number'
            description='The Phone Number to send the SMS Notification to.'
            required=true
        )
        public String phoneNumber;

        @InvocableVariable(label='SMS Text' description='The SMS Notification text.' required=true)
        public String smsText;

        @InvocableVariable
        public String dispatchTime;

        @InvocableVariable
        public String dispatchWindow;
    }

    public class SMSNotificationResults {
        @InvocableVariable
        public String something;
    }
}
