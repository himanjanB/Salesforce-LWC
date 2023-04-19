public with sharing class CustomActionPanelController {
    @testVisible private static final String CARTBUTTONNAME = 'Configure_Products';
    @testVisible private static final String INSTALLEDPRODUCTSBUTTONNAME = 'InstalledProductsRenewal';

    @AuraEnabled
    public static List<ActionWrapper> getActionButtons(Id recordId, String sObjectName){
        String extraFieldAPIName;

        List<Custom_Action_Panel_Button__mdt> actionButtons = [SELECT Id, DeveloperName, Action_Name__c, Action_Label__c, IconName__c, Order_Place__c,
        URL_Redirect__c, Is_Active__c, Popup__c, Component_Header__c
        FROM Custom_Action_Panel_Button__mdt WHERE Is_Active__c = TRUE AND Destination_Object__c =: sObjectName WITH SECURITY_ENFORCED ORDER BY Order_Place__c];

        List<Action_Panel_Conditions__mdt> actionButtonConditions = [SELECT Id, Custom_Conditions__c, Active__c, DeveloperName, MasterLabel, 
        Custom_Action_Panel_Button__c, Field_Comparator__c, Field_Name__c, Field_Value__c, Hide__c, Validation_Message__c 
        FROM Action_Panel_Conditions__mdt WHERE 
        Custom_Action_Panel_Button__c IN : actionButtons AND Active__c = TRUE WITH SECURITY_ENFORCED];

        Map<Id, List<Action_Panel_Conditions__mdt>> buttonToActionPaneConditionsMap = new Map<Id, List<Action_Panel_Conditions__mdt>>();
        Set<String> fieldSet = new Set<String>();
        List<String> fieldsList = new List<String>();

        for(Action_Panel_Conditions__mdt condition : actionButtonConditions) {
            if(String.isNotBlank(condition.Field_Name__c)) {
                fieldSet.add(condition.Field_Name__c);
            }

            if(buttonToActionPaneConditionsMap.containsKey(condition.Custom_Action_Panel_Button__c)) {
                buttonToActionPaneConditionsMap.get(condition.Custom_Action_Panel_Button__c).add(condition);
            } else {
                buttonToActionPaneConditionsMap.put(condition.Custom_Action_Panel_Button__c, new List<Action_Panel_Conditions__mdt>{condition});
            }
        }

        /*String query = 'SELECT Id, Name FROM Opportunity WHERE Id = 0065j00000Y0FaIAAV';
        sObject record = Database.query(query);*/

        List<ActionWrapper> output = new List<ActionWrapper>();
        List<String> validationMessages = new List<String>();

        for(Custom_Action_Panel_Button__mdt currentAction : actionButtons) {
            List<Action_Panel_Conditions__mdt> conditionList = buttonToActionPaneConditionsMap.get(currentAction.Id);

            if(!conditionList.isEmpty()) {
                for(Action_Panel_Conditions__mdt condition : conditionList) {
                    validationMessages.add('Test');
                    System.debug('Condition ' + condition);
                }
            }

            ActionWrapper wrapper = new ActionWrapper(true, currentAction, validationMessages, false);
            output.add(wrapper);
        }

        return output;
    }

    public class ActionWrapper {
        @AuraEnabled public Boolean actionShow {get; set;}
        @AuraEnabled public List<String> onClickValidationMessages {get; set;}
        @AuraEnabled public Custom_Action_Panel_Button__mdt actionButton {get; set;}
        @AuraEnabled public Boolean isUnfilteredAssets {get; set;}

        public ActionWrapper(Boolean actionShow, Custom_Action_Panel_Button__mdt action, List<String> messages, Boolean isUnfilteredAssets) {
            this.actionShow = actionShow;
            this.actionButton = action;
            this.onClickValidationMessages = messages;
            this.isUnfilteredAssets = isUnfilteredAssets;
        }
    }
}