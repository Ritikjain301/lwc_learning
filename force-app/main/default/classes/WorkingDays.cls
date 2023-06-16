public class WorkingDays {
    /*public static Integer datemethod(Date startDate, Date dueDate){
//startDate = Date.newInstance(2022, 9, 30);
//dueDate = Date.newInstance(2023, 9, 30);
Integer numberDaysDue = startDate.daysBetween(dueDate);
System.debug('date difference'+numberDaysDue);
return numberDaysDue;
}*/
    public static final List<Boolean> isWorkingDay;
    
    public static final Integer workingDaysInWeek;
    static {
        
        isWorkingDay = new List<Boolean> { true, true, true, true, true, false, false };
            
            workingDaysInWeek = 5;
    }
    
    public static final Date monday = Date.newInstance(2022, 6, 6);
    public static Integer getDayOfWeek(Date value) {
        return Math.mod(monday.daysBetween(value), 7);
    }
    
    public static Integer getWorkingDays(Date startDate, Date endDate) {
        //save some calculations when the number of working days is 0
        if(workingDaysInWeek == 0 || startDate == null || endDate == null) {
            return 0;
        } else {
            Integer difference = startDate.daysBetween(endDate);
            System.debug('Total No. of Days: ' + difference);
            if(difference == 0) {
                //If the 2 dates are the same day check if the day is a working day or not
                return isWorkingDay[getDayOfWeek(startDate)] ? 1 : 0;
            } else if(workingDaysInWeek == 7) {
                //when every day is a working day return the difference
                return difference;
                
            } else {
                
                Integer wholeWeeks = Math.floor(difference / 7).intValue();
                System.debug('wholeweek :' + wholeWeeks);
                Integer workingDays = wholeWeeks * workingDaysInWeek;
                System.debug('workingDays :' + workingDays);
                Integer dayOfWeek = getDayOfWeek(endDate);
                System.debug('dayOfWeek :' + dayOfWeek);
                for(Integer remainder = Math.mod(difference, 7); remainder >= 0; remainder--) {
                    if(isWorkingDay[dayOfWeek]) {
                        workingDays++;
                    }
                    dayOfWeek--;
                    if(dayOfWeek < 0) {
                        dayOfWeek = 6;
                    }
                }
                System.debug('Test 1 : ' + workingDays);
                return workingDays;
            }
        }        
    }
    
}