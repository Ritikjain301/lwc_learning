import { LightningElement, track, wire} from 'lwc';
import getAccounts from '@salesforce/apex/DynamicAccountSearch.getAccounts';
import updateAccountDetails from '@salesforce/apex/DynamicAccountSearch.updateAccountDetails';
export default class AccountSearchWithPagination extends LightningElement {
    key;
    data=[];
    key2=false;

    showTable=false;
    @track accounts;
    saveDraftValue = [];
    accountid;
    accountid;


    updatekey(event){
        this.key2=true;
        this.key = event.target.value;
    }
    handleSearch(){ 
       
        getAccounts({searchKey : this.key})   
        .then(result=>{
                this.showTable = true;
                this.key2 = false;
                this.accounts = result;
        })
        .catch(error=>{
            this.accounts = null;
        });
    }
     cols = [
    { label: 'Account Name',fieldName: 'Name',type: 'text' ,editable : true },
    { label: 'Phone',fieldName: 'Phone',type: 'text' ,editable:true},
    { label: 'Industry', fieldName: 'Industry', type: 'text' , editable:true},
    { label: 'Website', fieldName: 'Industry', type:'url' ,editable:true}
    ];

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
       // console.log('up :' +JSON.stringify(updateField));
        updateAccountDetails({accountData : updateField})
        .then(result =>{
            console.log(JSON.stringify(result));
        })

        .catch(error=>{
            console.error("err:" +JSON.stringify(error))
        })
    }
}