({
    invokeMethod : function(component, event, helper) {
        var idx = component.get("v.Action.actionButton.URL_Redirect__c");
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : idx.replace("IDRECORD", component.get("v.recordId"))
        });
        urlEvent.fire();
    },

    openModal : function(component, event, helper) {
        component.set("v.isModalOpen", true);
    },

    showToast : function(component, event, helper) {
        var validationList = component.get('v.Action').onClickValidationMessages;
        var validationMsg;
        for(var i in validationList) {
            if(validationMsg) {
                validationMsg = validationMsg + '\n' + validationList[i];
            } else {
                validationMsg = validationList[i];
            }
        }

        var toastEvent = $A.get("e.forece:showToast");
        toastEvent.setParams({
            "title" : "Error",
            "type" : "error",
            "message" : validationMsg
        });
        toastEvent.fire();
    },

    updateRecord : function(component, event, helper) {
        var action = component.get("c.updateProposal");
        action.setParams({
            "recordId" : component.get("v.recordId"),
        });
        $A.enqueueAction(action);
    }
})