public with sharing class accountWithPagination {
    public String soql;
    public List<Account> accounts {get;set;}
    public String BillingCountry {get;set;}
    public String BillingState {get;set;}
    public String BillingCity {get;set;}
   	Public Integer size{get;set;}
    public ApexPages.StandardSetController standardSetCtrl{get;set;}
    public boolean fetchCalled{get;set;}

    public accountWithPagination() {
        size = 2;

    }
    public void fetch(){
        soql = 'SELECT Name,AccountNumber,OwnerId,BillingCountry,BillingCity,BillingState FROM Account WHERE';
        String whereClause = '';
        if(String.isNotEmpty(billingCountry)) {whereClause = whereClause + ' AND BillingCountry = :billingCountry';}
        if(String.isNotEmpty(billingState)) {whereClause = whereClause + ' AND BillingState = :billingState';}
        if(String.isNotEmpty(billingCity)) {whereClause = whereClause + ' AND BillingCity = :billingCity';}
        if(String.isEmpty(billingCountry) && String.isEmpty(billingState) && String.isEmpty(billingCity)){
            whereClause = whereClause + ' AND BillingCountry = :billingCountry AND BillingState = :billingState AND BillingCity = :billingCity';}

        whereClause = whereClause.removeStart(' AND');
        soql += whereClause + ' LIMIT 100';
        standardSetCtrl = new ApexPages.StandardSetController(Database.getQueryLocator(soql));
        standardSetCtrl.setPageSize(size);
        accounts = standardSetCtrl.getRecords();
        fetchCalled = true;
    }
    public void first(){
        standardSetCtrl.first();
        accounts = standardSetCtrl.getRecords();
    }
    public void last(){
        standardSetCtrl.last();
        accounts = standardSetCtrl.getRecords();
    }
    public void previous(){
        standardSetCtrl.previous();
        accounts = standardSetCtrl.getRecords();
    }
    public void next(){
        standardSetCtrl.next();
        accounts = standardSetCtrl.getRecords();
    }
    
}