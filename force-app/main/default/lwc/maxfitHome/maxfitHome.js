import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MaxfitHome extends NavigationMixin(LightningElement) {
    handleSuccess(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Saved',
                message: `Record created: ${event.detail.id}`,
                variant: 'success'
            })
        );
    }

    openEvents() {
        this.openObjectHome('Event__c');
    }

    openAttendees() {
        this.openObjectHome('Attendee__c');
    }

    openSpeakers() {
        this.openObjectHome('Speaker__c');
    }

    openObjectHome(objectApiName) {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName,
                actionName: 'home'
            }
        });
    }
}
