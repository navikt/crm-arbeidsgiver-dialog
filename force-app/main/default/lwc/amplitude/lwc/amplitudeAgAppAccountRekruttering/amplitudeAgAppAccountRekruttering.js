import { LightningElement } from 'lwc';
import { publishToAmplitude } from 'c/amplitude';

export default class AmplitudeAgAppAccountRekruttering extends LightningElement {
    renderedCallback() {
        publishToAmplitude('AgApp-Account', { type: 'Rekruttering' });
    }
}