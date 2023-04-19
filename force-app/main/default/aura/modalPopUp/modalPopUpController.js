({
    doInit : function(component, event, helper) {
        console.log('In doInit method');
        console.log('Is modal open? ' + component.get('v.ocallComponent'));
        if(component.get("v.isModalOpen")) {
            var componentName = component.get('v.ocallComponent');
            console.log('Component name is ' + componentName);
            if(componentName) {
                $A.createComponent(componentName, 
                    {
                        "recordId" : component.get("v.recordId"),
                        "objectApiName" : component.get("v.sObjectName"),
                        "aura:id" : "childLwc",
                        "onclose" : component.getReference("c.closeQA")
                    },
                    function(newCmp, status, errorMessage) {
                        console.log('Status is ' + status);
                        if(status == "SUCCESS") {
                            var body = [];
                            body.push(newCmp);
                            component.set("v.body", body);
                        }
                    }
                );
            }
        }
    },

    closeMethodInAuraController : function(component, event, helper) {
        var componentName = component.get("v.ocallComponent");
        if(componentName == 'c:addLicenseUser') {
            component.find('childLwc').getFiredFromAura();
        } else {
            var action = component.get("c.closeQA");
            $A.enqueueAction(action);
        }
    },

    closeQA : function(component, event, helper) {
        component.set("v.isModalOpen", false);
        $A.get("e.force.closeQuickAction").fire();
        var parentEvent = component.getEvent("passMethod");
        parentEvent.fire();
    }
})