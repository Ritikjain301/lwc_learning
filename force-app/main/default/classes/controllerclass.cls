public class controllerclass {
    List<Account> acts = [SELECT Id, Name, BillingCity, BillingAddress, BillingState From Account Limit 100];
    public List<Account> getAccounts(){
   			return acts;
    }


}