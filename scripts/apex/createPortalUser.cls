// Assign user to role
User usr = [SELECT Id FROM User WHERE Name = 'User User'];
usr.UserRoleId = [SELECT Id FROM UserRole WHERE Name = 'PO Arbeidsgiver' LIMIT 1]?.Id;
update usr;

//Create community user
Account personAccount = [SELECT FirstName, LastName, PersonContactId FROM Account WHERE INT_PersonIdent__c = '16120102137'];
String experienceProfileId = [SELECT Id FROM Profile WHERE Name='Customer Community Plus Login User' Limit 1]?.Id;
String experienceUserEmail  = personAccount.FirstName + '.' +personAccount.LastName + '@' + URL.getOrgDomainUrl().getHost();

User experienceUser = new User(
    UserName = experienceUserEmail,
    FirstName = personAccount.FirstName,
    LastName = personAccount.LastName,
    Alias = 'expusr',
    email = experienceUserEmail,
    ContactId = personAccount.PersonContactId,
    ProfileId = experienceProfileId,
    EmailEncodingKey = 'UTF-8',
    CommunityNickname = 'expusr1234',
    TimeZoneSidKey = 'America/Los_Angeles',
    LocaleSidKey = 'en_US',
    LanguageLocaleKey = 'en_US'
);
insert experienceUser;

//Assign correct permission set to the user.
String permissionSetId = [SELECT Id FROM PermissionSet WHERE Name = 'Arbeidsgiver_Dialog_Eksterne'].Id;
PermissionSetAssignment permSetAssignment = new PermissionSetAssignment(PermissionSetId = permissionSetId, AssigneeId = experienceUser.Id);
List<PermissionSetAssignment> perms = new List<PermissionSetAssignment>{permSetAssignment};
insert perms;





