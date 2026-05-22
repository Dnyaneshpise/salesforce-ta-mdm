public class ErrorLogHelper {
    public static void logError(String processName, String logDetails) {
        try {
            ErrorLog__c errorLog = new ErrorLog__c();
            errorLog.Process_Name__c = processName;
            errorLog.Log_Details__c = logDetails;
            errorLog.Log_Date_Time__c = System.now();
            insert errorLog;
        } catch (Exception e) {
            System.debug('Failed to insert error log: ' + e.getMessage());
        }
    }
}
