public without sharing class MH_OpportunityListLazyLoadingHelper {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(String inputID) {
        return [SELECT Id, Name FROM Opportunity WITH SECURITY_ENFORCED];
    }
}