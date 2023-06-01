import { LightningElement, api, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

export default class UrlReader extends LightningElement {
    currentPageReference = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.currentPageReference = currentPageReference;
        }
    }

    @api
    getUrlParameter(paramName) {
        return this.currentPageReference.state[paramName];
    }

    @api
    getPageType() {
        return this.currentPageReference.type;
    }

    @api
    getAttributes(attributeName) {
        return this.currentPageReference.attributes[attributeName];
    }
}
