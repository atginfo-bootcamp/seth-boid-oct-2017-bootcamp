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

		List<Account> accountsFromDB = [
			SELECT Id 
			FROM Account 
			WHERE Name LIKE :accountName + '%'
		];
		List<Contact> contactList = new List<Contact>();
		for(Account acct : accountsFromDB){

			Integer numberOfContacts = (Integer)(Math.random()*4);

			for(Integer i = 0;i<numberOfContacts;i++){
				
				Contact contact = new Contact();
				contact.LastName = 'Test Boid';
				contact.AccountId = acct.Id;
				contactList.add(contact);	
			}
			
		}
		insert contactList;
	}



	@isTest static void insertTriggerTest() {

		stageData(10, 'Seth');

		List<Account> accountList = [
			SELECT Name, Current_Number_of_Contacts__c,
				(SELECT LastName, AccountId FROM Contacts)
			FROM Account
		];
		System.assertEquals(accountList.size(), 10, 'You did not enter 10 accounts');

		for (Account acct : accountList){
			System.debug('For Account ' + acct.name + ' there are ' + acct.Contacts.size() + ' accounts');
		}
		// Implement test code
	}
	
	@isTest static void updateTriggerTest() {
		
		// Implement test code
	}
	
}