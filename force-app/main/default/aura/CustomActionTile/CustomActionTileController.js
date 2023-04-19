({
    doInit : function(component, event, helper) {
        var action = component.get('v.Action');
    },

    invokeAction : function(component, event, helper) {
        var action = component.get('v.Action');

        if(action.onClickValidationMessages.length > 0) {
            helper.showToast(component, event, helper);
        } else if(!action.actionButton.Popup__c) {
            if(action.isUnfilterAssets) {
                helper.updateRecord(component, event, helper);
            }
            helper.invokeMethod(component, event, helper);
        } else {
            helper.openModal(component, event, helper);
        }
    }
})