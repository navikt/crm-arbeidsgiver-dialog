import { LightningElement } from 'lwc';
import { publishToAmplitude } from 'c/amplitude';

export default class AmplitudeAgAppAccountKontaktpersoner extends LightningElement {
    renderedCallback() {
        publishToAmplitude('AgApp-Account', { type: 'Kontaktpersoner' });
    }
}