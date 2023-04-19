trigger ContactTrigger on Contact (after update, after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isUpdate)
            ContactTriggerHandler.updateAccount(Trigger.new);

        if(Trigger.isInsert) {
            ContactTriggerHandler.updateAccountCount(Trigger.new);
        }
    }
    
}