@isTest
private class ContactTriggerHelperTest {
	
	private static void stageData(Integer numAccounts, String accountName){

		//create new accounts based on numAccounts parameter
		//Set up Account fields (i.e. use accountName)
		//Need to insert Accounts to the database
		//Query accounts from DB
		//Loop through accounts
		//Create some contacts for each account (accountId populated)
		//Modify fields on Contacts (Populate AccountId)
		//Insert contacts to the database

		List<Account> account = new List<Account>();
		for (Integer i = 0 ; i < numAccounts ; i++) {
			Account acct = new Account();
			acct.Name = accountName + ' ' + i;
			account.add(acct);
		}

		insert account;
	}



	@isTest static void test_method_one() {
		// Implement test code
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}