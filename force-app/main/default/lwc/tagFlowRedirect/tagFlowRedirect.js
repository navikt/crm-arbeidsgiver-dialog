import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { FlowNavigationFinishEvent } from 'lightning/flowSupport';

export default class TagFlowRedirect extends NavigationMixin(LightningElement) {
    @api recordId;
    @api objectApiName;
    @api listViewName;


    connectedCallback() {
        if(this.objectApiName!=null && this.recordId!=null) { 
            this.navToRecord();
            this.fireFlowFinish();
        }
        else if(this.objectApiName!=null && this.listViewName!=null ) {
            this.navToListView();
            this.fireFlowFinish();
        }
        
    }

    fireFlowFinish() {        
        const finishEvent = new FlowNavigationFinishEvent();
        this.dispatchEvent(finishEvent);
    }
    
    navToRecord() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId:  this.recordId,
                actionName: 'view'
            }
        });
    }

    navToListView() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: this.objectApiName,
                actionName: 'list'
            },
            state: {
                filterName: this.listViewName
            }
        });
    }


}