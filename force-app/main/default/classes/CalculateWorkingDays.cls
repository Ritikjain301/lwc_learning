public class CalculateWorkingDays
{ 
    public static Integer calculateDays(Date d1, Date d2){
        Date startDate = Date.newInstance(d1.year(), d1.month(), d1.day());
       	Date dueDate = Date.newInstance(d2.year(), d2.month(), d2.day());
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        System.debug('date difference'+numberDaysDue);
        return numberDaysDue;
    }
}