import { LightningElement, api, wire} from 'lwc';

// import getProducts from '@salesforce/apex/getRecordDataController.getProducts'
import getChildDetails from '@salesforce/apex/GetRecordData.getChildDetails';

columns1 =[
    {label: "Product Category Id", fieldName: 'Id'},
    {label: "Product Category Name", fieldName: 'Name'}
]

columns2 =[
    {label: "Product Id", fieldName: 'Id'},
    {label: "Product Name", fieldName: 'Name'}
]

export default class GarmentsHub extends LightningElement {


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

//     @track columns = [
//         { type: 'text',
//         label: 'Product Categories',
//         fieldName: 'Name',
//         type: 'url',
//         typeAttributes: {
//           label: {
//             fieldName: 'Name'
//           },
//           tooltip: 'Name',
//           target: '_blank'
//         }
//       }
//     ];
//     @track productList;

//     @wire(getProducts) wiredProducts({data, error}) {
//         if (data) {
//             this.productList = data;
//         } else if (error) {
//             console.log(error);
//         }
//     }
// }