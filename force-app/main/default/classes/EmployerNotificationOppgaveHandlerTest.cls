@isTest
public class EmployerNotificationOppgaveHandlerTest {
    @TestSetup
    static void makeData() {
        Account acc = new Account();
        acc.Name = 'Test account';
        insert acc;

        CRM_HENV_TestDataFactory.createRecord(new NavUnit__c(INT_UnitNumber__c = '4100'));

        Thread__c t = new Thread__c();
        t.CRM_Related_Object__c = acc.Id;

        Thread__c t2 = new Thread__c();
        t2.CRM_Related_Object__c = acc.Id;

        Thread__c t3 = new Thread__c();
        t3.CRM_Related_Object__c = acc.Id;

        CRM_HENV_TestDataFactory.createRecordList(new List<Thread__c>{ t, t2, t3 });

        Message__c m = new Message__c();
        m.CRM_Thread__c = t.Id;
        m.CRM_Message_Text__c = 'Lorem Ipsum Dolor Si Amet';
        insert m;
    }
    @isTest
    static void testpostTask() {
        String responseBody;
        EmployerNotificationOppgaveHandler.OppgaveResponse resp = new EmployerNotificationOppgaveHandler.OppgaveResponse();
        resp.id = 123456789;
        Message__c message = getMessage();

        EmployerNotificationOppgaveHandler.NotificationOppgaveRequest taskRequest = new EmployerNotificationOppgaveHandler.NotificationOppgaveRequest(
            'POST',
            message
        );
        taskRequest.dueDays = 2;

        Test.setMock(HttpCalloutMock.class, new SingleRequestMock(200, 'OK', JSON.serialize(resp), null));

        Test.startTest();
        List<EmployerNotificationOppgaveHandler.NotificationOppgaveResponse> taskResponses = EmployerNotificationOppgaveHandler.handleNotificationOppgaveRequests(
            new List<EmployerNotificationOppgaveHandler.NotificationOppgaveRequest>{ taskRequest }
        );
        Test.stopTest();

        System.assert(taskResponses[0].success);
    }

    @isTest
    static void testPostTaskFail() {
        String responseBody;
        EmployerNotificationOppgaveHandler.OppgaveResponse resp = new EmployerNotificationOppgaveHandler.OppgaveResponse();
        resp.id = 123456789;
        Message__c message = getMessage();

        EmployerNotificationOppgaveHandler.NotificationOppgaveRequest taskRequest = new EmployerNotificationOppgaveHandler.NotificationOppgaveRequest(
            'POST',
            message
        );
        taskRequest.dueDays = 2;

        Test.setMock(HttpCalloutMock.class, new SingleRequestMock(403, 'Forbidden', JSON.serialize(resp), null));

        Test.startTest();
        List<EmployerNotificationOppgaveHandler.NotificationOppgaveResponse> taskResponses = EmployerNotificationOppgaveHandler.handleNotificationOppgaveRequests(
            new List<EmployerNotificationOppgaveHandler.NotificationOppgaveRequest>{ taskRequest }
        );
        Test.stopTest();

        System.assert([SELECT COUNT() FROM Application_Log__c WHERE Log_Level__c = 'Error'] == 1);
    }

    private static Message__c getMessage() {
        return [SELECT Id, TAG_NotificationOppgaveId__c FROM Message__c LIMIT 1];
    }
}
