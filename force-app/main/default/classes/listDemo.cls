public class listDemo {
    
    public void memo(){
        List<Student__c> accList =  new List<Student__c>();
        Set<Id> accIds = new Set<Id>();
        accList = [SELECT Id,First_Name__c,DOB__c From Student__c Limit 10];
        if(!accList.isEmpty())
            for(Student__c acc : accList){
                accIds.add(acc.id);
			}
        System.debug('accids = ' +accIds);
        
        
        
        
        
        
        
        
        
    }
		
}