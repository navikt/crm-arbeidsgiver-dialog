Id recordTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = 'MeasureAgreement' LIMIT 1]?.Id;
Account account = [SELECT Id FROM Account WHERE INT_OrganizationNumber__c = '910825585'];

Contract__c contract = new Contract__c(
    ExternalId__c = '1234',
    TAG_Account__c = account.Id,
    RecordTypeId = recordTypeId,
    TAG_Category__c = 'Midlertidig lønnstilskudd'
);
insert contract;

