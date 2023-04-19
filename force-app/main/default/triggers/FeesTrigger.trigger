trigger FeesTrigger on Fees__c (before insert, after insert) {
    if(Trigger.isBefore && Trigger.isInsert) {
		FeesTriggerHandler.handleBeforeInsert(Trigger.New);   
    }
    
    if(Trigger.isAfter && Trigger.isInsert) {
        FeesTriggerHandler.handleAfterInsert(Trigger.New);
    }
}