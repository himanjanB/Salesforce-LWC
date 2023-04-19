import { LightningElement, api } from 'lwc';

export default class ConfigureProducts extends LightningElement {
    @api recordId;
    proposalLinesAvailable;
    showNavBar;
    progressValue = 50;
    navigationBarMessage;
    showError;
    errorMessage;
    showFooter;

    connectedCallback() {
        console.log('Connected Callback');
        this.proposalLinesAvailable = true;
        this.showNavBar = true;
        this.navigationBarMessage = 'Configuring Products ..';
        this.progressValue = 60;
    }

    closeModal() {
        const closePopUp = new CustomEvent('close');
        this.dispatchEvent(closePopUp);
    }
}