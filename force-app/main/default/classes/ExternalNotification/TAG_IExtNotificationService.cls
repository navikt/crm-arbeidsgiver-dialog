/**
 * @description
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-06-12 Created.
 *
 * @group TAG External Notification
 */
@SuppressWarnings('PMD.ExcessiveParameterList')
public interface TAG_IExtNotificationService {
    /**
     * @description Base notification method for setting needed notification values.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-12 Created.
     *
     * @param enterpriseNumber
     * @param label
     * @param serviceCode
     * @param serviceEdition
     * @param externalId
     * @param groupingId
     * @param notificationText
     * @param url
     * @return  `Object`
     */
    Object notification(
        String label,
        String serviceCode,
        String serviceEdition,
        String enterpriseNumber,
        String externalId,
        String groupingId,
        String notificationText,
        String url
    );

    /**
     * @description SMS Notification.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-12 Created.
     *
     * @param phoneNumber
     * @param smsText
     * @param dispatchWindow
     * @return  `Object`
     */
    TAG_IExtNotificationService smsNotification(
        String phoneNumber,
        String smsText,
        TAG_DispatchWindow_e dispatchWindow
    );

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-12 Created.
     *
     * @return  `TAG_IExtNotificationService`
     */
    TAG_IExtNotificationService build();

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-12 Created.
     *
     * @return  `TAG_IExtNotificationService`
     */
    TAG_IExtNotificationService send();

    /**
     * @description ...
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-12 Created.
     */
    HttpResponse getResponse();
}
