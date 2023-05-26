
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class ToastMessage extends LightningElement {
    journalSaved = false;
    
//Også må vi finne en måte å kjøre koden på. burde kanskje heller ha dette som en apex action. 
    saveJournal(){
        //leetkode
     if(the_journal_has_been_saved) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                variant: 'success',
                message: 'Journal has been saved',
            })
        );
        }else{
            this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: 'Journal has not been saved',
                variant: 'error'
            })
        );
        }
    }
   

   
}
    
      
