import { LightningElement, wire, track } from 'lwc';
import USER_ID from '@salesforce/user/Id';
import calculateSharingForUser from '@salesforce/apex/OrganizationBannerController.getRepresentedOrganization';

export default class OrganizationBanner extends LightningElement {
    @track organization;
    
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

    get agreementNumberShow() {
        return this.getUrlParam('avtalenummer');
    }

    getUrlParam(urlParam) {
        return this.template.querySelector('c-url-reader').getUrlParameter(urlParam);
    }

}
