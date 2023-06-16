public class GetProductData {
@auraEnabled(cacheable=true)
    public static List<Product_Category__c> fetchProductCategory()
    {
        List<Product_Category__c> prodCatList=[SELECT Id,Name FROM Product_Category__c];
        return prodCatList;
    }
    @auraEnabled
    public static List<Product__c> getProducts(String productCategoryId)
    {
        List<Product__c> prodList=[SELECT Id,Name,Product_Category__c FROM Product__c WHERE Product_Category__c=:productCategoryId LIMIT 10000];
        return prodList;
    }
}