@IsTest
public class EmployerNotificationOppgaveServiceTest {
    static EmployerNotificationOppgaveService service = new EmployerNotificationOppgaveService();

    @isTest
    static void testPostTask() {
        EmployerNotificationOppgaveWrapper request = new EmployerNotificationOppgaveWrapper();

        Test.setMock(HttpCalloutMock.class, new SingleRequestMock(200, 'OK', 'OK!', null));

        Test.startTest();
        HttpResponse response = service.postTask(request);
        Test.stopTest();

        System.assertEquals(200, response.getStatusCode());
        System.assertNotEquals(null, service.getTransactionId(), 'No transaction ID');
    }
}
