import { LightningElement } from 'lwc';
import { publishToAmplitude } from 'c/amplitude';

export default class AmplitudeAgAppAccountAktiviteter extends LightningElement {
    renderedCallback() {
        publishToAmplitude('AgApp-Account', { type: 'Aktiviteter' });
    }
}