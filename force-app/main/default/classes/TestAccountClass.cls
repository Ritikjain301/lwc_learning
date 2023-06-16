public with sharing class TestAccountClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        List<Account> accList = [Select Id, Name, Phone,  AccountNumber  FROM Account LIMIT 20];

        if(!accList.isEmpty()){
            return accList;
        }
        return null;
    }
    @AuraEnabled
    public static string updateAccountDetails(Object accountData){
        system.debug('accountData:' +accountData);

        List<Account> accountList = (List<Account>) JSON.deserialize(
        JSON.serialize(accountData), List<Account>.class);

        if(!accountList.isEmpty()){
            update accountList;
            return 'Success';

        }
         return 'failed';
        
    }

    

}
