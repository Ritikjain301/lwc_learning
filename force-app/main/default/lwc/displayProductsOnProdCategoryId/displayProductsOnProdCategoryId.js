import { LightningElement, wire, track, api} from 'lwc';
import retrieveProductCategoryRecords from '@salesforce/apex/lwcAppExampleApex.retrieveProductCategoryRecords';

export default class DisplayProductsOnProdCategoryId extends LightningElement {
    @wire (retrieveProductCategoryRecords) prodCateData;
    @track getProdCateId;
    async handleChangeRadio(event){        
        this.getProdCateId = event.target.value;
        window.console.log('getProdCateId ' + this.getProdCateId);
       const myCustomEventItem = new CustomEvent('myeventdemo',{
            detail: this.getProdCateId
       });
       this.dispatchEvent(myCustomEventItem);
    }
}