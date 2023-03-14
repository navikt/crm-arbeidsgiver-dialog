/**
 * @description This is the
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-03-07 Created.
 *
 * @group TAG External Notification
 */
public inherited sharing class TAG_NotificationCalloutHandler {
    private static final String API_CONFIG_NAME = 'TAG_API';
    private static final String SERVICE_AUTH_HEADER = 'Tag';
    private static final String DEFAULT_QUERY_API_SERVICE_NAME = 'POST_TAG_QUERY';

    public static HttpResponse query(String query, String apiServiceName) {
        apiServiceName = String.isBlank(apiServiceName) ? DEFAULT_QUERY_API_SERVICE_NAME : apiServiceName;

        ApiController apiCtrl = new ApiController();

        apiCtrl.initRequest(API_CONFIG_NAME, apiServiceName);
        apiCtrl.addServiceAuthHeader(SERVICE_AUTH_HEADER);
        apiCtrl.addHeader('Content-Type', 'application/json');
        apiCtrl.setBody(query);
        apiCtrl.doCallout();

        return apiCtrl.getResponse();
    }
}
