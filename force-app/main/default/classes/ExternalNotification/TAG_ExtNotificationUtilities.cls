/**
 * @description This is the builder class for SMS Notification used in the
 * external notification system.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
 * @since 2023-02-07 Created.
 *
 * @group TAG External Notification
 * @see TAG_ExtNotificationModel
 */
public inherited sharing class TAG_ExtNotificationUtilities {
    public static TAG_ExtNotificationModel.Sendevindu convertDispatchWindow(TAG_DispatchWindow_e dispatchWindow) {
        if (dispatchWindow == TAG_DispatchWindow_e.NKS_BUSINESS_HOURS) {
            return TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID;
        } else if (dispatchWindow == TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY) {
            return TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG;
        } else if (dispatchWindow == TAG_DispatchWindow_e.CONTINUOUSLY) {
            return TAG_ExtNotificationModel.Sendevindu.LOEPENDE;
        }
        return null;
    }

    public static TAG_DispatchWindow_e convertDispatchWindow(TAG_ExtNotificationModel.Sendevindu dispatchWindow) {
        if (dispatchWindow == TAG_ExtNotificationModel.Sendevindu.NKS_AAPNINGSTID) {
            return TAG_DispatchWindow_e.NKS_BUSINESS_HOURS;
        } else if (dispatchWindow == TAG_ExtNotificationModel.Sendevindu.DAGTID_IKKE_SOENDAG) {
            return TAG_DispatchWindow_e.DAYTIME_NOT_SUNDAY;
        } else if (dispatchWindow == TAG_ExtNotificationModel.Sendevindu.LOEPENDE) {
            return TAG_DispatchWindow_e.CONTINUOUSLY;
        }
        return null;
    }
}
