import { LightningElement, api, wire } from 'lwc';
import getQuoteLines from '@salesforce/apex/QuoteLineHelper.getQuoteLines';

export default class ShowQuoteLines extends LightningElement {
    columns = [
        {
        label : 'Line Name',
        fieldName : 'Name',
        type : 'Auto Number',
        sortable : true
        },
        {
        label : 'Product Name',
        fieldName : 'SBQQ__ProductName__c',
        type : 'Text',
        sortable : true
        },
        {
        label : 'Quantity',
        fieldName : 'SBQQ__Quantity__c',
        type : 'Number',
        sortable : true
        }
    ];

    error;
    quoteLines;

    @wire(getQuoteLines)
    wiredQuoteLines({error, data}) {
        if(data) {
            this.quoteLines = data;
        } else if(error) {
            this.error = error;
        }
    }
}