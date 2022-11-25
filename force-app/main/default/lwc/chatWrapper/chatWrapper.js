import { LightningElement, api } from 'lwc';

export default class ChatWrapper extends LightningElement {
    @api recordId;
    termsAccepted = false;

    handleAccept() {
        this.termsAccepted = true;
    }

    handleReject() {
        this.termsAccepted = false;
    }

    // TODO:
    /*
    Save result to either session storage or user table.
    Clarify how often the terms need to be accepted.
    Add method to check if the terms were previously accepted and still valid on componenet load.
    Update html with final text
    */
}
