import { LightningElement, wire, track, api } from 'lwc';
import getBannerData from '@salesforce/apex/OrganizationBannerController.getBannerData';
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

    _recordId;

    @api
    get recordId() {
        return this._recordId;
    }
    set recordId(value) {
        if (value !== this._recordId) {
            this._recordId = value;
            if (value) {
                this.getBanner(); // Fetch data when recordId is set
            }
        }
    }

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.currentPageReference = currentPageReference;
        }
    }
    connectedCallback() {
        console.log('Component connected. Waiting for recordId to be set...');
    }

    getBanner() {
        if (!this.recordId) {
            console.error('Cannot fetch banner data without recordId');
            return;
        }
        getBannerData({ threadId: this.recordId })
            .then((result) => {
                this.organizationName = result.TAG_Account__r.Name;
                this.organizationNumber = result.TAG_Account__r.INT_OrganizationNumber__c;
                this.urlContract = result.TAG_ExternalURL__c;
                this.participantContract = result.TAG_MeasureParticipant__c;
                this.agreementNumber = result.ExternalId__c;
            })
            .catch((error) => {
                console.log('Error retrieving banner data: ', error);
            });
    }

    //Funksjon som gjør hovedbanneret sticky når man scroller
    renderedCallback() {
        try {
            window.onscroll = () => {
                let stickysection = this.template.querySelector('.myStickyHeader');
                let sticky2 = stickysection.offsetTop;
                if (window.scrollY > sticky2) {
                    stickysection.classList.add('slds-is-fixed');
                } else {
                    stickysection.classList.remove('slds-is-fixed');
                }
            };
        } catch (error) {
            console.log('error =>', error);
        }
    }
}
