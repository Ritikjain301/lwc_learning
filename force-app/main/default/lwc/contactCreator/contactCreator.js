import { LightningElement} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT__OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import LAST_NAME from '@salesforce/schema/Contact.LastName';
export default class ContactCreator extends LightningElement {
    
    objectApiName = CONTACT__OBJECT;
    fields = [NAME_FIELD,EMAIL_FIELD,LAST_NAME];
    handleSuccess(event){
    const toastEvent = new ShowToastEvent({
        title: "Contact created",
        message: "Hey" +ContactCreator.NAME_FIELD+ " Account Is created Your Record ID: " + event.detail.id,
        variant: "success"
    });
    this.dispatchEvent(toastEvent);
}

}