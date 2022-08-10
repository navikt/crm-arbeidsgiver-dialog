@isTest
public with sharing class OrganizationBannerControllerTest {
    @TestSetup
    static void createData() {
        myTriggers.disable(PersonHandler.class);
        myTriggers.disable(PersonAccessHandler.class);
        myTriggers.disable(CommunityUserUpdateHandler.class);
        User navEmployee = TestDataFactory_Community.getUsers(1, 'System Administrator', true, true)[0];

        System.runAs(navEmployee) {
            Account businessAccount = TestDataFactory.getAccounts(1, false)[0];
            businessAccount.INT_OrganizationNumber__c = '910825585';
            insert businessAccount;

            Account personAccount = TestDataFactory_Community.getPersonAccounts(1)[0];
            personAccount.INT_PersonIdent__c = '16120102137';
            update personAccount;

            User communityUser = TestDataFactory_Community.getEmployerCommunityUser(
                new Set<Id>{ personAccount.Id },
                'Customer Community Plus User',
                false
            )[0];

            Profile communityProfile = [
                SELECT Name, Id
                FROM Profile
                WHERE Name = :'Customer Community Plus User'
                LIMIT 1
            ];
            communityUser.FirstName = 'Community User';
            communityUser.ProfileId = communityProfile.Id;

            insert communityUser;
        }
    }

    @isTest
    static void getRepresentedOrganization_success() {
        User user = [SELECT Id, AG_LastRepresentedOrganization__c FROM USER WHERE FirstName = 'Community User' LIMIT 1];
        user.AG_LastRepresentedOrganization__c = '910825585';
        update user;

        Account account = OrganizationBannerController.getRepresentedOrganization(user.id);

        system.assertEquals('910825585', account.INT_OrganizationNumber__c, 'Fetched correct organization number.');
    }
}
