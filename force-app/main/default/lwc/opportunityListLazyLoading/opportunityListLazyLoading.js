import { LightningElement, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/MH_OpportunityListLazyLoadingHelper.getOpportunities';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [
    {label : 'ID', fieldName : 'Id'},
    {label : 'Account Name', fieldName : 'Name'}
];

export default class OpportunityListLazyLoading extends LightningElement {
    allOpportunityList;
    currentOpportunityList;
    rowLimit = 0;
    rowOffset = 2;
    error;
    columns = columns;
    tableElement;

    @wire(getOpportunities, {inputID : 'test'})
    wiredgetOpportunities({error, data}) {        

        console.log('Here data ' + data);
        console.log('Here error ' + error);
        
        if(data) {
            console.log('Data received');
            this.allOpportunityList = data;
            if(this.allOpportunityList.length >= this.rowOffset) {
                this.currentOpportunityList = this.allOpportunityList.slice(this.rowLimit, this.rowOffset);
            } else {
                this.currentOpportunityList = this.allOpportunityList;
            }
        }

        if(error) {
            console.log('Error ' + error);
            this.error = error;
            const toastEvent = new ShowToastEvent({
                message : 'Error in fetching opportunities',
                variant : 'error'
            });
            this.dispatchEvent(toastEvent);
        }
    }

    /*Implemented lazy loading of data with an offset of 25 records */ 
    loadMoreData(event) {

        if(this.currentOpportunityList.length < this.allOpportunityList.length) {
            if(event.target) {
                event.target.isLoading = true;
            }

            this.tableElement = event.target;
            this.loadMoreStatus = 'Loading..';
            this.rowLimit = this.rowOffset;
            this.rowOffset = this.rowOffset + this.rowLimit;

            var newData = [];
            newData = this.allOpportunityList.slice(this.rowLimit, this.rowOffset);
            this.currentOpportunityList = this.currentOpportunityList.concat(newData);

            this.loadMoreStatus = '';

            if(this.tableElement) {
                this.tableElement.isLoading = false;
            }
        } else {
            const toastEvent = new ShowToastEvent({
                message : 'No more interactions to load',
                variant : 'success'
            });
            this.dispatchEvent(toastEvent);
        }
    }
}