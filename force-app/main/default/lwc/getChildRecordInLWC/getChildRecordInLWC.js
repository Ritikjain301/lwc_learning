import { LightningElement , api} from 'lwc';
import getChildDetails from '@salesforce/apex/GetRecordData.getChildDetails';

export default class GetChildRecordInLWC extends LightningElement {
    

columns1 =[
    {label: "Product Category Id", fieldName: 'Id'},
    {label: "Product Category Name", fieldName: 'Name'}
]

columns2 =[
    {label: "Product Id", fieldName: 'Id'},
    {label: "Product Name", fieldName: 'Name'}
]

    @api buttonLabel = "Show";
    productCategorydata = [];
    productData = [];

    columns1 = columns1;
    columns2 = columns2;

    @api recordId;
    @api showDatatable = false;

    handleShow(event){
        if(event.target.label == "Show"){
            this.buttonLabel = "Hide";
            this.showDatatable = true;
        }

        else if(event.target.label == "Hide"){
            this.buttonLabel = "Show";
            this.showDatatable = false;
        }
    }
    connectedCallback(){
        getChildDetails({ recId : this.recordId})
        .then( res => {
            let tempRecords = res;
            console.log("tempRecords:"+ JSON.stringify(tempRecords));
        })
        .catch(error =>{
            console.error("error:"+JSON.stringify(error));
        })
    }

}