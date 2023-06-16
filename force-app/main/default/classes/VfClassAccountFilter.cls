public class VfClassAccountFilter 
    { 
    public List<Account> accList {get; set;}
    public VfClassAccountFilter()
    {
        accList = [SELECT Id, BillingCity, BillingCountry, BillingState FROM Account];
    }   
        
}