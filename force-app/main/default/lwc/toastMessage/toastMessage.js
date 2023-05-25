import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import ToastContainer from 'lightning/toastContainer';

export default class ToastMessageContainer extends LightningElement {
    connectedCallback() { 
        const toastContainer = ToastContainer.instance();
        toastContainer.maxShown = 3;
    }
  showError() {
        const evt = new ShowToastEvent({
            title: 'Error',
            message: 'Journalføringen ble ikke gjennomført',
            variant: 'error'
        });
        this.dispatchEvent(evt);
    }
    showSuccess() {
        const evt = new ShowToastEvent({
            title: 'Suksess',
            message: 'Journalføring gjennomført',
            variant: 'success'
        });
        this.dispatchEvent(evt);
    }
   

    
}