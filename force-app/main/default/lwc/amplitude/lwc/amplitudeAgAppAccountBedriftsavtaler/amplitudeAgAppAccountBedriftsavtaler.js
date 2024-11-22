import { LightningElement } from 'lwc';
import { publishToAmplitude } from 'c/amplitude';

export default class AmplitudeAgAppAccountBedriftsavtaler extends LightningElement {
    renderedCallback() {
        publishToAmplitude('AgApp-Account', { type: 'Bedriftsavtaler' });
    }
}