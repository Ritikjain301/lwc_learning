import { LightningElement, track, api } from 'lwc';
import fetchProductCategory from '@salesforce/apex/GetProductData.fetchProductCategory';
import getProducts from '@salesforce/apex/GetProductData.getProducts';

const columns = [{
    label: 'Name',
    fieldName: 'Name'
}

];

// const columnsOpp = [{
//     label: 'Name',
//     fieldName: 'Name'

// }

// ];

export default class GetProductDataInLWC extends LightningElement {

    @track prodCate;
    @track prod;
    message;
    msg;
    connectedCallback(){
        fetchProductCategory()
    .then(result => {
    this.prodCate = result;
    
    console.log("Product Category:",JSON.stringify(result));
    console.log("result",this.prodCate);
    })
    
    }
    
    
    productFetch(event){
    this.message = event.target.value;
    console.log('Hi');
    console.log('Product Id-->'+this.message);
    getProducts({productCategoryId : this.message})
    
    .then(result => {
    this.prod = result;
    
    console.log(JSON.stringify(result));
    console.log("result1",this.prod);
    })
    .catch(error =>{
    this.error = error;
    
    })
    
    }
}