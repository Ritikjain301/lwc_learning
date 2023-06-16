public class demo {
    public static void methodDemo(){
       List<Student__c> sdtList = [SELECT Id, Name FROM Student__c];
        System.debug('Student List ='  +sdtList);
       
        
    }
}