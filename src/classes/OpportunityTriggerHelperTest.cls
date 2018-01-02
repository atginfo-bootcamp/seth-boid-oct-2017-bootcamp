@isTest
private class OpportunityTriggerHelperTest {

	//Things we need to create
	//Account with contacts
	//Account without contacts
	//create contacts
	//aacount with opps
	//account w/o opps
	//create opps


	
	@isTest static void accountWithNoContacts() {

	}
	

	public static Account CreateAccount(){
		//create account
		Account account = new Account();
		account.Name = 'New Account';
		//insert account;

		return account;
		}

	public static Opportunity createOpportunity(Id accountId, String stageName){

		Opportunity opp = new Opportunity();

		opp.AccountId = accountId;
		opp.Name = 'Test Account';
		opp.stageName = stageName;
		opp.closeDate = System.today();

		return opp;
		}

		
		//Account with contacts

			//Create Contacts
		//Create Accounts with Opportunities
			//Create opps
	
}