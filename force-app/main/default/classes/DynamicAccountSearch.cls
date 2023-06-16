public with sharing class DynamicAccountSearch {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey){
        List<Account> accList = [Select Id, Name, Phone, Industry, Website FROM Account WHERE Name Like : '%' + searchKey + '%'];
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
            System.debug(accountList);
            update accountList;
            return 'Success';

        }
         return 'failed';
   
    }
}