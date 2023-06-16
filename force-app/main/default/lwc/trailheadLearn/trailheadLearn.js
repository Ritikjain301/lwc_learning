import { LightningElement, api,wire } from 'lwc';
//import NAME_FIELD from '@salesforce/schema/Account.Name';
//import PHONE_FIELD from '@salesforce/schema/Account.Phone'; 
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
export default class TrailheadLearn extends LightningElement {

    
    
    @api recordId;
    

    @wire(getRecord, {recordId : '$recordID' , fields : ['Account.Name' , 'Account.Phone']})
    record;

    get name(){
            return this.record.data.fields.Name.value;
       
    }
    get phone(){
        return this.record.data ? getFieldValue(this.record.data, 'Account.Phone') : '';
        console.log(this.record);

    }
}