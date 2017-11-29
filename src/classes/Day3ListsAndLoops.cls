//To invoke from dev console: Day3ListsAndLoops.execute();
//

public with sharing class Day3ListsAndLoops {
	
	public static void execute() {

		//create string variable called myName
		String myName = 'Seth';

		//Create new empty list called names
		//THIS IS THE PREFERRED WAY TO INITIALIZE
		List<String> names = new List<String>();

		//Create new empty list with default names
		List<String> students = new List<String>{'seth','jason','lane','lauren'};

		//Alternate syntax for creating a new array (list) with 20 empty items
		String[] employees = new String[20];

		names.add('seth');
		names.add('jason');
		names.add('lane');
		names.add('lauren');


		System.debug('names: ' + names);

		names.remove(3);

		System.debug('names after last element removed: ' + names);

		// dynamically remove last element in array
		names.remove(names.size() - 1);
		System.debug('names after removing names.size(): ' + names);

		Set<String> uniqueNames = new Set<String>();
		uniqueNames.add('seth');
		uniqueNames.add('seth');
		uniqueNames.add('seth');
		uniqueNames.add('seth');
		uniqueNames.add('seth');
		uniqueNames.add('seth');
		uniqueNames.add('seth');
		uniqueNames.add('seth');

		//Store the number of items in our set
		Integer setSize = uniqueNames.size();

		System.debug('uniqueNames: ' + uniqueNames);
		System.debug('setSize: ' + setSize);

	}

	public static void executeLoops(){

		//for loop takes 3 'parameters'
		//indexVariable
		//condition
		//counterVariable

		for(Integer i = 0; i < 10; i++) {

			System.debug('i: ' + i);
		}

		List<String> names = new List<String>();
		names.add('seth1');
		names.add('seth2');
		names.add('seth3');
		names.add('seth4');

		for(Integer i = 0; i < names.size(); i++){
			System.debug('names: ' + names.get(i));

		}

		for(Integer i = 0; i < names.size(); i++){
			System.debug('names: ' + names[i]);
		}
		for(String name : names){
			System.debug(name);
		}
	}

	public static void querySobjects(){

		Account myAccount = new Account();
		myAccount.Name = 'atg2';
		myAccount.Type = 'Prospect';

		System.debug('myAccount before insert: ' + myAccount);

		//insert myAccount;

		System.debug('myAccount after insert: ' + myAccount);



	}

	public static void updateExistingAccount() {
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type 
			FROM Account 
			WHERE Name = 'atg2'
		];
		System.debug(queriedAccounts);

		if(queriedAccounts.size() > 0) {
			Account myAccount = queriedAccounts[0];
			myAccount.Name = 'Seths Badass Motherfuckin Account';
			update myAccount;
		}
	}

	public static void updateAccountTypeOnEveryAccount() {
		//Query all Accounts
		List<Account> queriedAccounts = [
			SELECT Id, Type 
			FROM Account 
		];
		//Loop through Accounts
		for(Account currentAccount : queriedAccounts){
			currentAccount.Type = 'Other';
			System.debug(currentAccount);
		}
		//update accounts (DML)
		update queriedAccounts;
	}

}