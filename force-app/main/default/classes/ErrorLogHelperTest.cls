@isTest
public class ErrorLogHelperTest {
    @testSetup
    static void setup() {
        // No setup required
    }

    @isTest
    static void testLogError() {
        Test.startTest();
        ErrorLogHelper.logError('TestProcess', 'Test error details');
        Test.stopTest();

        List<ErrorLog__c> logs = [SELECT Id, Process_Name__c, Log_Details__c FROM ErrorLog__c];
        System.assertEquals(1, logs.size(), 'One log record should be created');
        System.assertEquals('TestProcess', logs[0].Process_Name__c);
        System.assertEquals('Test error details', logs[0].Log_Details__c);
    }
}
