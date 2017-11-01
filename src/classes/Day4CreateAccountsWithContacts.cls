public with sharing class Day4CreateAccountsWithContacts {

	public static void createAccountsAndContacts(Integer numAccounts){


		// create accounts with contacts associated to them
		// create accounts first, then contacts
		// loop 'numAccounts' number of times, to create 'numAccounts' number of accounts
		// Account name must be "myAccount-"#
		// Insert Accounts in bulk (initially do not insert in bulk to experience limits)
		// create two contacts for each account
		// Insert contacts
		// query accounts and subquery contacts
		// loop through accounts and contacts
		// print out all contacts for each account name
		List<Account> createdAccounts = new List<Account>();
		List<Contact> createdContacts = new List<Contact>();
		for(Integer i=0; i < numAccounts; i++) {
			System.debug('Creating account ' + i);
			Account createdAccount = createAccount(i);
			createdAccounts.add(createdAccount);
			// createdAccounts.add(createAccount(i)); //This is identical to the line above
		}
		
		insert createdAccounts;

		for(Account currAccount : createdAccounts){
			createdContacts.add(createContact(currAccount.Id, 1));
			createdContacts.add(createContact(currAccount.Id, 2));

		}
		insert createdContacts;

	}		
	public static Account createAccount(Integer accountNameSuffix){
		String accountName = 'myAccount-' + accountNameSuffix;

		Account myAccount = new Account(Name = accountName);
		System.debug('myAccount ' + myAccount);


		return myAccount;
	}
	public static Contact createContact(Id accountId, Integer contactNumber){
		Contact newContact = new Contact(
			FirstName = 'Contact First Name: ' + contactNumber, 
			LastName = 'Contact Last Name :' + contactNumber,
			AccountId = accountId
			);
		System.debug('newContact: ' + newContact);
		return newContact;
	}



	public static void queryAndPrintAccountsAndContacts(){

		List<Account> queriedAccounts = [
			SELECT Id, Name, 
				(SELECT Id, FirstName, LastName, Name FROM Contacts)
			FROM Account
			WHERE Name LIKE 'myAccount%'
		];
		for(Account currAccount : queriedAccounts) {
			System.debug('currAccount: ' + currAccount.Name);
			for(Contact currContact : currAccount.Contacts) {
			System.debug('currContact: ' + currContact.Name);

			}
		}
	}















}