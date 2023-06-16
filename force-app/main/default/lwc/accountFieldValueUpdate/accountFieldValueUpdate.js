import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/TestAccountClass.getAccount';
import updateAccountDetails from '@salesforce/apex/TestAccountClass.updateAccountDetails';

 const columns = [
    { label : 'Account Name' , fieldName : 'Name', editable : true },
    { label : 'Phone' , fieldName : 'Phone', editable : true },
    { label : 'Account Number' , fieldName : 'AccountNumber', editable : true },

];

export default class AccountSearchWithPagination extends LightningElement {
    columns = columns;
    data = [];
    saveDraftValue = [];
    @wire(getAccounts)
    accountData(result){
        console.log("result:"+JSON.stringify(result))
        if(result.error){
            this.data = undefined;


        }
        else if(result.data){
            this.data = result.data;
        }
    }

    handleSave(event){
        const updateField = event.detail.draftValues;
        console.log('hi' +JSON.stringify(updateField));
        updateAccountDetails({accountData : updateField})
        .then(result =>{
            console.log(JSON.stringify(result));
        })

        .catch(error=>{
            console.error("err:" +JSON.stringify(error))
        })
    }
    



}