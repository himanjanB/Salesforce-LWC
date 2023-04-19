public with sharing class ContactTriggerHandler {
    
    public static void updateAccount(List<Contact> contactList) {
        ContactTriggerHelper.updateAccount(contactList);
    }

    public static void updateAccountCount(List<Contact> contactList) {
        ContactTriggerHelper.updateCount(contactList);
    }
}