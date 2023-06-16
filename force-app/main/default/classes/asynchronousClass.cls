public class asynchronousClass {
    
    public List<Account> accounts {get;set;}
    public String name {get;set;}
    
    public PageReference search_now(){
        accounts = [SELECT Id, Name, Phone,BillingCity,BillingState,BillingCountry  FROM Account WHERE Name like :(name+'%')];
        return null;
    }

}