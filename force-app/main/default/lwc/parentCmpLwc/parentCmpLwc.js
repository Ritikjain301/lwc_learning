import { LightningElement, track, wire, api } from 'lwc';
import retrieveProductRecords from '@salesforce/apex/lwcAppExampleApex.retrieveProductRecords';

import MOQ_FIELD from '@salesforce/schema/Product__c.MOQ__c';
import ID_FIELD from '@salesforce/schema/Product__c.Id';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { updateRecord } from 'lightning/uiRecordApi';

export default class ParentCmpLwc extends LightningElement {
      
    @track prodCategoryId;
    @track records;
    @track errorMsg; 
    @api isloaded = false;
    showProductRecords = false;
    disabled = false;
    @track error;

    
    @wire (retrieveProductRecords, {prodCateId:'$prodCategoryId'}) 
      wireProdRecord({error,data}){
        if(data){
            
          this.records = data;    
          this.errorMsg = undefined;  
          this.isLoaded = true;
        }else{         
          this.errorMsg = error;
          this.records = undefined;
        }
      }
 
    handleChangeAction(event){
      this.prodCategoryId = event.detail;
      this.showProductRecords = true;
      window.console.log('prodCategoryId ' + this.prodCategoryId);
    }
    handleMOQChange(event) {
        if (!event.target.value) {
        event.target.reportValidity();
        this.disabled = true;
     }
    else {
        this.disabled = false;
    }
   }
   handleClick() {
    const allValid = [...this.template.querySelectorAll('lightning-input')]
        .reduce((validSoFar, inputFields) => {
            inputFields.reportValidity();
            return validSoFar && inputFields.checkValidity();
        }, true);
    

    if (allValid) {
        // Create the recordInput object
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.Id;
        fields[MOQ_FIELD.fieldApiName] = this.template.querySelector("[data-field='MOQ__c']").value;

        const recordInput = { fields };

        updateRecord(recordInput)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact updated',
                        variant: 'success'
                    })
                );
                // Display fresh data in the form
                return refreshApex(this.contact);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
        }
    else {
        // The form is not valid
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Something is wrong',
                message: 'Check your input and try again.',
                variant: 'error'
            })
         );
    }
}
}