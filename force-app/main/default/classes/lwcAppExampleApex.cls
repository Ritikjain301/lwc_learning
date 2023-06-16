public class lwcAppExampleApex {
 @AuraEnabled(cacheable=true)
    public static List<Product_Category__c> retrieveProductCategoryRecords(){
        List<Product_Category__c> prodCateList = [Select Id, Name From Product_Category__c];
        return prodCateList;
    }
 
 
    @AuraEnabled(cacheable=true)
    public static List<Product__c> retrieveProductRecords(string prodCateId){
      List<Product__c> prodObj = new List<Product__c>();
      List<Product__c> prodList = [Select Id, Name, Product_Category__c, Color__c, Size__c, Retail_Price__c,Wholesale_Price__c, MOQ__c,RecordType.Name From Product__c Where Product_Category__c=:prodCateId];
      for(Product__c prod:prodList){
        prodObj.add(prod);
      }
      return prodObj;
    }
}