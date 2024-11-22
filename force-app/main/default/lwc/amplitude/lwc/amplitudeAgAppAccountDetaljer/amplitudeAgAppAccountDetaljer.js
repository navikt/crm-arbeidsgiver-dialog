import { LightningElement } from 'lwc';
import { publishToAmplitude } from 'c/amplitude';

export default class AmplitudeAgAppAccountDetaljer extends LightningElement {
    renderedCallback() {
        publishToAmplitude('AgApp-Account', { type: 'Detaljer' });
    }
}