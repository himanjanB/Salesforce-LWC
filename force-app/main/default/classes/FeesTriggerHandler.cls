public class FeesTriggerHandler {
    
    public static void handleBeforeInsert(List<Fees__c> listOfFee) {
        for(Fees__c fee : listOfFee) {
        	System.debug('handleBeforeInsert: Name of the fee record is ' + fee.Name);   
        }
    }
    
    public static void callSomeMethod(List<Fees__c> listOfFee) {
        for(Fees__c fee : listOfFee) {
            fee.Test_Field__c = 'Swapnadeep';
        }
    }
    
    public static void handleAfterInsert(List<Fees__c> listOfFee) {
        for(Fees__c fee : listOfFee) {
        	System.debug('handleAfterInsert: Name of the fee record is ' + fee.Name);   
        }
        
        String some = 'Cool';
        System.debug(some.substring(0,2));
        String testString = 'Hello';
        System.debug('Output is ' + testString.length());
        
    }

}