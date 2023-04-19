public with sharing class QuoteLineHelper {
    
    @AuraEnabled(cacheable=true)
    public static List<SBQQ__QuoteLine__c> getQuoteLines() {
        try {
            return [SELECT Id, Name, SBQQ__ProductName__c, SBQQ__Quantity__c FROM SBQQ__QuoteLine__c WITH SECURITY_ENFORCED LIMIT 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}