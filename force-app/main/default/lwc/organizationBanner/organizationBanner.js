import { LightningElement, wire, track } from 'lwc';
import USER_ID from '@salesforce/user/Id';
import calculateSharingForUser from '@salesforce/apex/OrganizationBannerController.getRepresentedOrganization';
import getContractUrl from '@salesforce/apex/OrganizationBannerController.getContractUrl';
import icons from '@salesforce/resourceUrl/icons';
import { CurrentPageReference } from 'lightning/navigation';

export default class OrganizationBanner extends LightningElement {
    @track organization;
    @track urlContract;
    @track agreementNumberShow;

    chevrondown = icons + '/chevrondown.svg';

    currentPageReference = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.currentPageReference = currentPageReference;
        }
    }

    @wire(calculateSharingForUser, { userId: USER_ID })
    wiredAccount({ error, data }) {
        if (data) {
            this.organization = data;
            this.error = undefined;
        } else if (error) {
            console.error(error);
        }
    }

    get organizationName() {
        return this.organization.Name;
    }

    get organizationNumber() {
        return this.organization.INT_OrganizationNumber__c;
    }

    getUrlParameter1(paramName) {
        return this.currentPageReference.state[paramName];
    }

    // get agreementNumberShow() {
    //     return this.getUrlParam('avtalenummer');
    // }

    // getContractUrl({ contractNr: this.agreementNumberShow })
    // .then((result) => {
    //     this.urlContract = result;
    // })
    // .catch((error) => {
    //     console.log('Error: ' + error.body.message);
    // })

    connectedCallback() {
        this.agreementNumberShow = this.getUrlParameter1('avtalenummer');
        //     // this.urlContract = '';
        // @wire(getContractUrl, { contractNr: '$agreementNumberShow' })
        // this.urlContract;
        getContractUrl({ contractNr: this.agreementNumberShow })
            .then((result) => {
                this.urlContract = result;
            })
            .catch((error) => {
                console.log('Error: ' + error.body.message);
            });
        // }
        // getUrlParam(urlParam) {
        //     return this.template.querySelector('c-url-reader').getUrlParameter(urlParam);
    }

    // getUrlParam() {
    //     return getUrlParameter1(urlParam);
    // }
}
