trigger AccountTrigger on Account (after update) {
    
    if(AccountTriggerHandler.isFirstTime) {
        AccountTriggerHandler.isFirstTime = False;
        AccountTriggerHandler.updateContactCheckbox(Trigger.new);
    }
}