public class EmailManager {
    public Static void sendMail(String address, String subject, String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        inspectResults(results);
    }
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        For(Messaging.SendEmailResult res:results){
            if(res.isSuccess()){
                System.debug('Email Sent Succesfully');
            }
            else{
                    sendResult = false;
                    System.debug('The Following Errors Occured: ' +res.getErrors());
                }
}
            return sendResult;
}
}