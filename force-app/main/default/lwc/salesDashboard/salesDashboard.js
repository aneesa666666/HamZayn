// Sample LWC - Sales Dashboard
import { LightningElement, track } from 'lwc';

export default class SalesDashboard extends LightningElement {
    @track opportunities = [];
    @track isLoading = false;
    @track error = null;

    connectedCallback() {
        this.loadOpportunities();
    }

    loadOpportunities() {
        this.isLoading = true;
        // TODO: Call Apex method to load opportunities
        this.isLoading = false;
    }
}
