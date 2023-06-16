public class GetRecordData {
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