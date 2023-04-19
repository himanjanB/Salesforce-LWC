public with sharing class AccountTriggerHelper {
    
    public static void updateAddresses(List<Account> newAccountList) {

        for(Account account : newAccountList) {
            System.debug('Account Name is ' + account.Name);
            account.Phone = '123';
        }
    }

    public static void updateCheckBox(List<Account> newAccountList) {
        List<Account> accountList = [SELECT Id, ContactUpdated__c, (SELECT Id, Name, AccountUpdated__c FROM Contacts) FROM Account WHERE Id IN : newAccountList];
        List<Contact> contactList = new List<Contact>();
        System.debug('Account List size ' + accountList.size());
        for(Account acc : accountList) {
            for(Contact con : acc.Contacts) {
                System.debug('Contact Name is ' + con.Name);
                System.debug('Contact Checkbox is ' + acc.ContactUpdated__c);
                con.AccountUpdated__c = acc.ContactUpdated__c;
                contactList.add(con);
            }
        }

        if(!contactList.isEmpty()) {
            System.debug('Updating contacts');
            update contactList;
        }
    }
}