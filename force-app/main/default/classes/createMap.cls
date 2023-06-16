public class createMap {
    public Map<String,String> nameStdMap{get;set;} 
    public List<Student__c> stdList{get;set;}
    public createMap(){
        stdList = new List<Student__c>();
        nameStdMap = new Map<String,String>();
        stdList = [select Id,Name,Email__c from Student__c limit 10];
        if(stdList != null && stdList.size() >= 0){
            for(Student__c acc : stdList ){
                nameStdMap.put(acc.Name,acc.Email__c);
            }
        }
    }
    

}