import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import USER_ID from '@salesforce/user/Id';
import calculateSharingForUser from '@salesforce/apex/RecordShareInitializerController.calculateSharingForUser';
import getAgreementThreadId from '@salesforce/apex/RecordShareInitializerController.getAgreementThreadId';
export default class RecordSharingInitializer extends NavigationMixin(LightningElement) {
    organizationNumber = null;
    agreementNumber = null;
    currentUserId = USER_ID;
    isRendered = false;

    renderedCallback() {
        if (!this.isRendered) {
            this.isRendered = true;
            this.organizationNumber = this.getUrlParam('orgNummer');
            this.agreementNumber = this.getUrlParam('avtaleNummer');
            if (!this.organizationNumber || !this.agreementNumber) {
                this.navigateToErrorPage();
                return;
            }
            this.calculateSharing();
        }
    }

    getUrlParam(urlParam) {
        return this.template.querySelector('c-url-reader').getUrlParameter(urlParam);
    }

    calculateSharing() {
        calculateSharingForUser({ userId: this.currentUserId, orgNumber: this.organizationNumber })
            .then(() => {
                this.redirectToAgreementThread(this.agreementNumber);
            })
            .catch((error) => {
                console.error('Sharing calculation error', error);
                this.navigateToErrorPage();
            });
    }

    redirectToAgreementThread(agreementNumber) {
        getAgreementThreadId({ agreementNumber: agreementNumber })
            .then((result) => {
                this.navigateToThreadDetailPage(result);
            })
            .catch((error) => {
                console.error('Thread navigation error', error);
                this.navigateToErrorPage();
            });
    }

    navigateToThreadDetailPage(threadId) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                objectApiName: 'Thread__c',
                recordId: threadId,
                actionName: 'view'
            }
        });
    }

    navigateToErrorPage() {
        this[NavigationMixin.Navigate]({
            type: 'comm__namedPage',
            attributes: {
                name: 'Error'
            }
        });
    }
}
