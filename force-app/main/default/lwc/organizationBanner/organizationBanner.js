import { LightningElement, wire, track, api } from 'lwc';
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
    contractUrlRequested = false;
    

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
            this.error = error;
            this.organization = undefined;
            console.error(error);
        }
    }
@api
    get organizationName() {
        return this.organization.Name;
    }
@api
    get organizationNumber() {
        return this.organization.INT_OrganizationNumber__c;
    }
@api
    getUrlParameter1(paramName) {
        return this.currentPageReference.state[paramName];
    }
@api
    get showBanner() {
        return this.organization && this.urlContract;
    }

       renderedCallback(){
            this.agreementNumberShow = this.getUrlParameter1('avtalenummer');
            console.log(this.agreementNumberShow +  " agreementnumbershow");
            if (!this.contractUrlRequested && this.agreementNumberShow) {
                this.contractUrlRequested = true;
                

            getContractUrl({ contractNr: this.agreementNumberShow })
                .then((result) => {
                    this.urlcontract = result;
                    console.log(this.urlContract +  " urlcontract");
                })
                .catch((error) => {
                    console.log('Error: ' + error.body.message);
                    this.urlcontract = undefined;

                }); 
                
        

             }else{
                this.contractUrlRequested = false;
             }
        console.log(this.contractUrlRequested + " skal være true");
            }
           
}

