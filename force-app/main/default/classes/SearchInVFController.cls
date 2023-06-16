public class SearchInVFController {
    public list <Account> acc {get;set;}
    public String searchKey {get;set;}
    public SearchInVFController( ) {
    }
    public void search(){
        string searchquery='select Name ,BillingCity , BillingState , BillingCountry  from Account where name like \'%'+searchKey+'%\' Limit 100';
        acc= Database.query(searchquery);
    }
    public void clear(){
        acc.clear();
    }
}