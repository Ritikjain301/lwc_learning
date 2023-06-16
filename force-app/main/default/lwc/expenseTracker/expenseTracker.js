import { LightningElement, track } from 'lwc';

export default class ExpenseTracker extends LightningElement {
    @track expenses = [];

    handleExpenseAdded(event){
        const newExpense = event.detail;
        this.expenses = [...this.expenses , newExpense];
    }

    handleExpenseDeleted(event){
        const deletedExpenseId = event.detail;
        this.expenses  = this.expenses.filter((expense) => expense.id !== deletedExpenseId);
        

    }

}