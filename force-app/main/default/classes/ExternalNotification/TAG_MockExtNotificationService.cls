/**
 * @description This is mocking class for the External Notification Service.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-06-12 Created.
 *
 * @see [License](https://github.com/navikt/crm-arbeidsgiver-dialog/blob/master/LICENSE)
 * @see [Github](https://github.com/navikt/crm-arbeidsgiver-dialog)
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationService
 * @see https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_stub_api.htm
 *
 * @example
 * TAG_ExtNotificationService mockExtNotificationService = (TAG_ExtNotificationService) System.Test.createStub(
 *     TAG_ExtNotificationService.class,
 *         new TAG_MockExtNotificationService()
 *     );
 */
@SuppressWarnings('PMD.ExcessiveParameterList')
@isTest
public class TAG_MockExtNotificationService implements System.StubProvider {
    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    public static final Integer DEFAULT_STATUS_CODE = 200;
    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    public static final String DEFAULT_STATUS = 'OK';
    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    public static final String DEFAULT_BODY = 'Success';

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    private Integer statusCode;
    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    private String status;
    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    private String body;

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     */
    public TAG_MockExtNotificationService() {
        this(DEFAULT_STATUS_CODE, DEFAULT_STATUS, DEFAULT_BODY);
    }

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     *
     * @param statusCode
     */
    public TAG_MockExtNotificationService(Integer statusCode) {
        this(statusCode, DEFAULT_STATUS, DEFAULT_BODY);
    }

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     *
     * @param statusCode
     * @param status
     */
    public TAG_MockExtNotificationService(Integer statusCode, String status) {
        this(statusCode, status, DEFAULT_BODY);
    }

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     *
     * @param body
     */
    public TAG_MockExtNotificationService(String body) {
        this(DEFAULT_STATUS_CODE, DEFAULT_STATUS, body);
    }

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-19
     *
     * @param statusCode
     * @param status
     * @param body
     */
    public TAG_MockExtNotificationService(Integer statusCode, String status, String body) {
        this.statusCode = statusCode;
        this.status = status;
        this.body = body;
    }

    /**
     * @description This method is called by the Apex runtime to return a mock method response.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-12
     * @param stubbedObject The stubbed object.
     * @param stubbedMethodName The name of the invoked method.
     * @param returnType The return type of the invoked method.
     * @param listOfParamTypes A list of the parameter types of the invoked method.
     * @param listOfParamNames A list of the parameter names of the invoked method.
     * @param listOfArgs The actual argument values passed into this method at runtime.
     * @return  `Object`
     */
    public Object handleMethodCall(
        Object stubbedObject,
        String stubbedMethodName,
        Type returnType,
        List<Type> listOfParamTypes,
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        if (stubbedMethodName == 'notification') {
            return this.notification(
                stubbedObject,
                stubbedMethodName,
                returnType,
                listOfParamTypes,
                listOfParamNames,
                listOfArgs
            );
        } else if (stubbedMethodName == 'smsNotification') {
            return this.smsNotification(
                stubbedObject,
                stubbedMethodName,
                returnType,
                listOfParamTypes,
                listOfParamNames,
                listOfArgs
            );
        } else if (stubbedMethodName == 'build') {
            return this.build(
                stubbedObject,
                stubbedMethodName,
                returnType,
                listOfParamTypes,
                listOfParamNames,
                listOfArgs
            );
        } else if (stubbedMethodName == 'send') {
            return this.send(
                stubbedObject,
                stubbedMethodName,
                returnType,
                listOfParamTypes,
                listOfParamNames,
                listOfArgs
            );
        } else if (stubbedMethodName == 'getResponse') {
            return this.getResponse(
                stubbedObject,
                stubbedMethodName,
                returnType,
                listOfParamTypes,
                listOfParamNames,
                listOfArgs
            );
        } else {
            return null;
        }
    }

    private String getClassName(Object stubbedObject) {
        return (String.valueOf(stubbedObject).split(':')[0]).removeEnd('__sfdc_ApexStub');
    }

    private TAG_ExtNotificationService getExternalNotificationServiceFromStubbedObject(Object stubbedObject) {
        if (getClassName(stubbedObject) == 'TAG_ExtNotificationService') {
            return (TAG_ExtNotificationService) stubbedObject;
        } else {
            throw new MockExtNotificationServiceException();
        }
    }

    private Object getParameterValue(List<String> listOfParamNames, List<Object> listOfArgs, String parameterName) {
        return listOfArgs.get(listOfParamNames.indexOf(parameterName));
    }

    private TAG_ExtNotificationService notification(
        Object stubbedObject,
        String stubbedMethodName,
        Type returnType,
        List<Type> listOfParamTypes,
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        TAG_ExtNotificationService extNotificationService = getExternalNotificationServiceFromStubbedObject(
            stubbedObject
        );
        extNotificationService.enterpriseNumber = (String) getParameterValue(
            listOfParamNames,
            listOfArgs,
            'enterpriseNumber'
        );
        extNotificationService.externalId = (String) getParameterValue(listOfParamNames, listOfArgs, 'externalId');
        extNotificationService.groupingId = (String) getParameterValue(listOfParamNames, listOfArgs, 'groupingId');
        extNotificationService.notificationText = (String) getParameterValue(
            listOfParamNames,
            listOfArgs,
            'notificationText'
        );
        extNotificationService.url = (String) getParameterValue(listOfParamNames, listOfArgs, 'url');
        return extNotificationService;
    }

    private TAG_ExtNotificationService smsNotification(
        Object stubbedObject,
        String stubbedMethodName,
        Type returnType,
        List<Type> listOfParamTypes,
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        TAG_ExtNotificationService extNotificationService = getExternalNotificationServiceFromStubbedObject(
            stubbedObject
        );
        extNotificationService.phoneNumber = (String) getParameterValue(listOfParamNames, listOfArgs, 'phoneNumber');
        extNotificationService.smsText = (String) getParameterValue(listOfParamNames, listOfArgs, 'smsText');
        System.debug(
            LoggingLevel.DEBUG,
            'smsNotification - listOfParamNames: ' + JSON.SerializePretty(listOfParamNames)
        );
        System.debug(LoggingLevel.DEBUG, 'smsNotification - listOfArgs: ' + JSON.SerializePretty(listOfArgs));
        extNotificationService.dispatchWindow = (TAG_DispatchWindow_e) getParameterValue(
            listOfParamNames,
            listOfArgs,
            'dispatchWindow'
        );
        return extNotificationService;
    }

    private TAG_ExtNotificationService build(
        Object stubbedObject,
        String stubbedMethodName,
        Type returnType,
        List<Type> listOfParamTypes,
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        TAG_ExtNotificationService extNotificationService = getExternalNotificationServiceFromStubbedObject(
            stubbedObject
        );
        extNotificationService.notificationBody = 'TestNotificationBody';

        return extNotificationService;
    }

    private TAG_ExtNotificationService send(
        Object stubbedObject,
        String stubbedMethodName,
        Type returnType,
        List<Type> listOfParamTypes,
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        TAG_ExtNotificationService extNotificationService = getExternalNotificationServiceFromStubbedObject(
            stubbedObject
        );
        HttpResponse response = new HttpResponse();
        response.setStatusCode(this.statusCode);
        response.setStatus(this.status);
        response.setHeader('Content-Type', 'application/json');
        response.setBody(this.body);
        extNotificationService.notificationResponse = response;

        return extNotificationService;
    }

    private HttpResponse getResponse(
        Object stubbedObject,
        String stubbedMethodName,
        Type returnType,
        List<Type> listOfParamTypes,
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        TAG_ExtNotificationService extNotificationService = getExternalNotificationServiceFromStubbedObject(
            stubbedObject
        );
        extNotificationService = send(
            stubbedObject,
            stubbedMethodName,
            returnType,
            listOfParamTypes,
            listOfParamNames,
            listOfArgs
        );

        return extNotificationService.notificationResponse;
    }

    public class MockExtNotificationServiceException extends Exception {
    }
}
