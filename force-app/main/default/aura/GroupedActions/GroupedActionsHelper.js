({
    componentName : [],
    loadActions : function(component, event, helper) {
        var getActions = component.get("c.getActionButtons");
        getActions.setParams({
            "recordId" : component.get("v.recordId"),
            'sObjectName' : component.get("v.sObjectName")
        });

    getActions.setCallback(this, function(response) {
        var state = response.getState();
        console.log('State is ' + state);
        if(state == 'SUCCESS') {
            var listOfAction = response.getReturnValue();
            var body = [];
            for(var i = 0; i < listOfAction.length; i++) {
                var action = listOfAction[i];
                console.log('Action is ' + action.actionShow);
                console.log('sObject is ' + component.get("v.sObjectName"));
                $A.createComponent(
                    "c:CustomActionTile", {
                        "Action" : action,
                        "recordId" : component.get("v.sObjectName")
                    },
                    function(newCmp, status, errorMessage) {
                        console.log('Status is ' + status);
                        if(status == "SUCCESS") {
                            body.push(newCmp);
                        }
                    }
                );
            }
            component.set("v.body", body);
        }
    });
    $A.enqueueAction(getActions);
    }
})