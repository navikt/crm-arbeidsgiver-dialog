import { LightningElement, api, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getCacheExpired from '@salesforce/apex/EmployerThreadDialogHelper.getCacheExpired';
import saveTermsAccepted from '@salesforce/apex/EmployerThreadDialogHelper.saveTermsAccepted';
import USER_ID from '@salesforce/user/Id';

export default class ChatWrapper extends LightningElement {
    @api recordId;
    termsAccepted = false;
    currentPageReference = null;
    @track agreementNumber;
    @track currentUserId = USER_ID;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.currentPageReference = currentPageReference;
        }
    }

    connectedCallback() {
        this.agreementNumber = this.getUrlParameter('avtalenummer');
        this.checkCacheExpired();
    }

    handleAccept() {
        this.termsAccepted = true;
        this.sendTermsAccepted();
    }

    handleReject() {
        this.termsAccepted = false;
    }

    checkCacheExpired() {
        getCacheExpired({ agreementNumber: this.agreementNumber, userId: this.currentUserId })
            .then((result) => {
                this.termsAccepted = result;
            })
            .catch((error) => {
                console.error('checkCacheExpired error', error);
            });
    }

    sendTermsAccepted() {
        saveTermsAccepted({ contractNumber: this.agreementNumber, user: this.currentUserId }).catch((error) => {
            console.error('sendTermsAccepted error', error);
        });
    }

    getUrlParameter(paramName) {
        return this.currentPageReference.state[paramName];
    }
}
