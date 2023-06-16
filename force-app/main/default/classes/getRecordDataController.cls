public with sharing class getRecordDataController {
  // @AuraEnabled(cacheable = true)
  // public static List<Product_Category__c> getProducts(){
  //   return [SELECT Id, Name FROM Product_Category__c];
  // }   
  @AuraEnabled
  public static List<Product_Category__c> getChildDetails(String recId){
    List<Product_Category__c> prodCateList = [Select Id, (Select Id, Name from Products__r) from Product_Category__c where Id =: recId];
    System.debug('catList:' +prodCateList);

    if(!prodCateList.isEmpty()){
      return prodCateList;
    }
    return null;
  }
}