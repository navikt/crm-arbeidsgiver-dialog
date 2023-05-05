import { LightningElement, wire, track, api } from 'lwc';
import getOrganization from '@salesforce/apex/OrganizationBannerController.getOrganization';
import getContractUrl from '@salesforce/apex/OrganizationBannerController.getContractUrl';
import icons from '@salesforce/resourceUrl/icons';
import { CurrentPageReference } from 'lightning/navigation';

export default class OrganizationBanner extends LightningElement {
    @api organizationName;
    @api organizationNumber;
    @track urlContract;
    @track agreementNumber;
    @api showBanner;

    chevrondown = icons + '/chevrondown.svg';
    currentPageReference = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.currentPageReference = currentPageReference;
        }
    }

    connectedCallback() {
        if (this.currentPageReference.attributes.name == 'Error') {
            console.log(
                ' attributes should be error ' +
                    this.currentPageReference.attributes.name +
                    ' and banner should not show'
            );
        } else {
            this.agreementNumber = this.getUrlParameter('avtalenummer');
            this.organizationNumber = this.getUrlParameter('organisasjonsnummer');
            console.log(this.currentPageReference.attributes.name + ' current page ref');
            this.getOrg();
            this.getAgreementUrl();
        }
    }

    getOrg() {
        getOrganization({ orgNumber: this.organizationNumber })
            .then((result) => {
                this.organizationName = result.Name;
                this.organizationNumber = result.INT_OrganizationNumber__c;
            })
            .catch((error) => {
                console.error('getOrganization error', error);
            });
    }

    getAgreementUrl() {
        getContractUrl({ contractNr: this.agreementNumber })
            .then((result) => {
                this.urlContract = result;
            })
            .catch((error) => {
                console.error('getAgreementUrl error', error);
            });
    }

    getUrlParameter(paramName) {
        return this.currentPageReference.state[paramName];
    }
}
