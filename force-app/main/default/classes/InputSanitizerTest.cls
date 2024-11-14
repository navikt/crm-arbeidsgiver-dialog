@isTest
public with sharing class InputSanitizerTest {

    @TestSetup
    static void createData() {
        insert new Contract__c(ExternalId__c='1453');
    }
    
    @isTest
    static void should_validate_organization_numbers(){   
        Assert.isTrue(InputSanitizer.isValidNorwegianOrgNumber('701730496'), '701730496 is a valid number');
        Assert.isFalse(InputSanitizer.isValidNorwegianOrgNumber('7017304961'), 'Not a valid number');
        Assert.isFalse(InputSanitizer.isValidNorwegianOrgNumber('70173049'), 'Not a valid number');
        Assert.isFalse(InputSanitizer.isValidNorwegianOrgNumber('7017-3049'), 'Not a valid number');
        Assert.isFalse(InputSanitizer.isValidNorwegianOrgNumber('777730496'), 'Not a valid number');
        Assert.isFalse(InputSanitizer.isValidNorwegianOrgNumber(null), 'Not a valid number');
    }

    @isTest
    static void should_validate_salesforce_id(){
        Contract__c contract = [SELECT id FROM Contract__c WHERE ExternalId__c = '1453' limit 1];
        Assert.isTrue(InputSanitizer.isValidRecordId(contract.id), 'Should return true when provided with valid Salesforce Id');
        Assert.isTrue(InputSanitizer.isValidRecordId('a0tKO000000CuCRYA0'), 'Should return true when provided with valid Salesforce Id, event if record does not exist');
        Assert.isTrue(InputSanitizer.isValidRecordId('a0tKO000000CuCR'), 'Should return true when provided with valid Salesforce 15-Id');
        Assert.isFalse(InputSanitizer.isValidRecordId(''), 'Should return false when input is blank or null');
        Assert.isFalse(InputSanitizer.isValidRecordId(null), 'Should return false when input is blank or null');

    }
   
    @isTest
    static void should_validate_contract_external_id(){
        Assert.isTrue(InputSanitizer.isValidContractExternalId('1453'), 'Should return true when provided with string containing numbers');
        Assert.isFalse(InputSanitizer.isValidContractExternalId(''.rightPad(49, '1')), 'Should return false if string lenght is more than 48');
        Assert.isFalse(InputSanitizer.isValidContractExternalId('A1453'), 'Should return false if containing non-numbers');
        Assert.isFalse(InputSanitizer.isValidContractExternalId(''), 'Should return false when input is blank or null');
        Assert.isFalse(InputSanitizer.isValidContractExternalId(null), 'Should return false when input is blank or null');
    }

}