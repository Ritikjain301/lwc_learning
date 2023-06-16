public class SearchAccountC {
    
    public List<Account> accounts {get;set;}
    public String BillingCntry {get;set;}
    public String BillingSty {get;set;}
    public String billingCity {get;set;}
    
    public PageReference search_now(){
        accounts = [SELECT Id, Name, Phone,BillingCity,BillingState,BillingCountry  FROM Account WHERE BillingCountry = :BillingCntry AND BillingState =:BillingSty AND BillingCity =:billingCity];
        return null;
    }
}