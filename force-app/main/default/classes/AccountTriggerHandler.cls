public class AccountTriggerHandler {
    
    public static Boolean isFirstTime = true;

    public static void updateAddresses(List<Account> newAccountList) {
        //Some comment here to describe better
        AccountTriggerHelper.updateAddresses(newAccountList);
    }

    public static void updateContactCheckbox(List<Account> newAccountList) {
        AccountTriggerHelper.updateCheckBox(newAccountList);
    }
}