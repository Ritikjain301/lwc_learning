import { LightningElement, track } from 'lwc';

export default class ExpenseForm extends LightningElement {
    @track expenseType;
    @track amount;
    @track expenseDate;
    @track description;

    handleTypeChange(event){
        this.expenseType = event.target.value;

    }
    handleAmountChange(event){
        this.amount = event.target.value;

    }
    handleDateChange(event){
        this.expenseDate = evenmt.target.value;

    }
    handleDescriptionChange(event){
        this.description = event.target.value;

    }
    handleAddExpense(){
        const newExpense = {
            id : Date.now(),
            type: this.expenseType,
            amount : parseFloat(this.amount),
            date : this.expenseDate,
            description : this.description

        }
        const expenseAddedEvent = new CustomEvent('expenseadded', {
            detail: newExpense
          });
          this.dispatchEvent(expenseAddedEvent);
          this.expenseType = '';
          this.amount = '';
          this.expenseDate = '';

    }
}