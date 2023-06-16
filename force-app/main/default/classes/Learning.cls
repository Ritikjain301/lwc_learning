public with sharing class Learning {
   
     public static list<Student__c> StdClass(Id classId)
    {  
        list<Student__c> std = [SELECT Name, Class__c FROM Student__c Where Class__c =: classId];            
        	System.debug('the student data is '+std);
         	Return std;
     }

}