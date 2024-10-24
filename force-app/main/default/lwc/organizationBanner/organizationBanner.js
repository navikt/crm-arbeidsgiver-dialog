import { LightningElement, wire, track, api } from 'lwc';
import getOrganization from '@salesforce/apex/OrganizationBannerController.getOrganization';
import getContract from '@salesforce/apex/OrganizationBannerController.getContract';
import icons from '@salesforce/resourceUrl/icons';
import { CurrentPageReference } from 'lightning/navigation';

export default class OrganizationBanner extends LightningElement {
    @api organizationName;
    @api organizationNumber;
    @track urlContract;
    @track participantContract;
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
            this.getOrg();
            this.getAgreement();
        }
    }

    getOrg() {
        getOrganization({ orgNumber: this.organizationNumber })
            .then((result) => {
                this.organizationName = result.Name;
                this.organizationNumber = result.INT_OrganizationNumber__c; 
            })
            .catch((error) => {
             
                console.error('getOrg error', error);
            // history.back(); 
        
            });
}


    getAgreement() {
        getContract({ contractNr: this.agreementNumber })
            .then((result) => {
                this.urlContract = result.TAG_ExternalURL__c;
                this.participantContract = result.TAG_MeasureParticipant__c;            
            })
            .catch((error) => {
                // history.back(); 
                console.error('getAgreement error', error);
                });    
}
    getUrlParameter(paramName) {
        return this.currentPageReference.state[paramName];
    }

    /*Funksjon som gjør hovedbanneret sticky når man scroller*/
    renderedCallback() {
        try {
            window.onscroll = () => {
                let stickysection = this.template.querySelector('.myStickyHeader');
               let sticky2 = stickysection.offsetTop;
                if (window.scrollY > sticky2) {
                    stickysection.classList.add("slds-is-fixed");
                } else {
                    stickysection.classList.remove("slds-is-fixed");  
                }
            }
        } catch (error) {
            console.log('error =>', error);
        }
    }

}
