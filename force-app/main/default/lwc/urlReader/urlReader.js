import { LightningElement, api, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

export default class UrlReader extends LightningElement {
    currentPageReference = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.currentPageReference = currentPageReference.state;
        }
    }

    @api
    getUrlParameter(paramName) {
        return this.currentPageReference[paramName];
    }
}
