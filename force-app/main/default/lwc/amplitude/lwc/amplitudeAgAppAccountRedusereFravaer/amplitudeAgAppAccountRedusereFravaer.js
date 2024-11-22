import { LightningElement } from 'lwc';
import { publishToAmplitude } from 'c/amplitude';

export default class AmplitudeAgAppAccountRedusereFravaer extends LightningElement {
    renderedCallback() {
        publishToAmplitude('AgApp-Account', { type: 'Redusere Fravaer' });
    }
}