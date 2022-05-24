import { LightningElement } from 'lwc';
import USER_ID from '@salesforce/user/Id';
import calculateSharingForUser from '@salesforce/apex/RecordShareInitializerController.calculateSharingForUser';

export default class RecordSharingInitializer extends LightningElement {
    isRendered = false;
    orgNumber = null;
    currentUserId = USER_ID;

    renderedCallback() {
        if (!this.isRendered) {
            this.isRendered = true;
            this.orgNumber = this.getUrlParam('orgNummer');
            this.calculateSharing();
        }
    }

    getUrlParam(urlParam) {
        let reader = this.template.querySelector('c-url-reader');
        return reader.getUrlParemeter(urlParam);
    }

    calculateSharing() {
        calculateSharingForUser({ userId: this.currentUserId, orgNumber: this.orgNumber })
            .then((result) => {
                // handle result
            })
            .catch((error) => {
                // redirect to error page
            });
    }
}
