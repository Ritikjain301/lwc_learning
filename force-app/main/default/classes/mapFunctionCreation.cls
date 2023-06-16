public class mapFunctionCreation {
@auraEnabled(cacheable=true)
    public static Map<Id, List<Student__c>> getStudents()
    {	
        Set<Id> classIds = new Set<Id>();
        Set<Class__c> classList = new Set<Class__c>([SELECT Id from Class__c]);
        for(Class__c cls : classList) {
          classIds.add(cls.Id);  
        }
        System.debug('classIds: ' + classIds);
        //List<Student__c> studList=[SELECT Name,Class__c FROM Student__c WHERE Class__c=:classIds];
        Map<Id, List<Student__c>> mapList = new map<Id, List<Student__c>>();
        for(Id clas: classIds) {
         List<Student__c> studList=[SELECT Name,Class__c FROM Student__c WHERE Class__c=:clas];
         mapList.put(clas, studList);   
        }
        System.debug('MapList: ' + mapList);
        return mapList;
    }
}