@isTest
public with sharing class InputValidatorTest {
    @TestSetup
    static void createData() {
        insert new Contract__c(ExternalId__c = '1453');
    }

    @isTest
    static void should_validate_organization_numbers() {
        Assert.isTrue(InputValidator.isValidNorwegianOrgNumber('701730496'), '701730496 is a valid number');
        Assert.isFalse(InputValidator.isValidNorwegianOrgNumber('7017304961'), 'Not a valid number');
        Assert.isFalse(InputValidator.isValidNorwegianOrgNumber('70173049'), 'Not a valid number');
        Assert.isFalse(InputValidator.isValidNorwegianOrgNumber('7017-3049'), 'Not a valid number');
        Assert.isFalse(InputValidator.isValidNorwegianOrgNumber('777730496'), 'Not a valid number');
        Assert.isFalse(InputValidator.isValidNorwegianOrgNumber(null), 'Not a valid number');
    }

    @isTest
    static void should_validate_salesforce_id() {
        Contract__c contract = [SELECT id FROM Contract__c WHERE ExternalId__c = '1453' LIMIT 1];
        Assert.isTrue(
            InputValidator.isValidRecordId(contract.id),
            'Should return true when provided with valid Salesforce Id'
        );
        Assert.isTrue(
            InputValidator.isValidRecordId('a0tKO000000CuCRYA0'),
            'Should return true when provided with valid Salesforce Id, event if record does not exist'
        );
        Assert.isTrue(
            InputValidator.isValidRecordId('a0tKO000000CuCR'),
            'Should return true when provided with valid Salesforce 15-Id'
        );
        Assert.isFalse(InputValidator.isValidRecordId(''), 'Should return false when input is blank or null');
        Assert.isFalse(InputValidator.isValidRecordId(null), 'Should return false when input is blank or null');
    }

    @isTest
    static void should_validate_contract_external_id() {
        Assert.isTrue(
            InputValidator.isValidContractExternalId('1453'),
            'Should return true when provided with string containing numbers'
        );
        Assert.isFalse(
            InputValidator.isValidContractExternalId(''.rightPad(49, '1')),
            'Should return false if string lenght is more than 48'
        );
        Assert.isFalse(
            InputValidator.isValidContractExternalId('A1453'),
            'Should return false if containing non-numbers'
        );
        Assert.isFalse(InputValidator.isValidContractExternalId(''), 'Should return false when input is blank or null');
        Assert.isFalse(
            InputValidator.isValidContractExternalId(null),
            'Should return false when input is blank or null'
        );
    }
}
