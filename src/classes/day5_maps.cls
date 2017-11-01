public with sharing class day5_maps {

	public static void example(String name) {

		//For review, this is the syntax of a list
		List<String> namesList = new List<String>();

		namesList.add('Betty');
		namesList.add('John');
		namesList.add('Jack');
		namesList.add('Paul');

		//keep track if name is found
		Boolean foundName = false;

		for(String currentName : namesList) {
			if(currentName == name){
				System.debug('Found name in list: ' + name);
				foundName = true;
				break; //exits out of for loop
			}
		}
		//If foundname is false
		if (!foundName){
			System.debug('Name not found in list: ' + name);
		}

		Map<String, String>  namesMap = new Map<String, String>();
		namesMap.put('Betty', 'Betty Boop');
		namesMap.put('John', 'John Boop');
		namesMap.put('Jack', 'Jack Boop');
		namesMap.put('Paul', 'Paul Boop');

		if(namesMap.containsKey(name)){
			System.debug('Found name in map: ' + name);
		}else{
			System.debug('Name not found in map: ' + name);
		}
	}

	public static void associateContactsToAccounts() {

		//Alternate Syntax
		//Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, Name FROM Account]);

		List<Account> accountList = [Select Id, Name FROM Account];
		Map<Id, Account> accountMap = new Map<Id, Account>(accountList);

		List<Contact> contacts = [
		Select Id, FirstName, LastName, Name, AccountId
			FROM Contact
		];

		//loop through contacts
		//print out the name of the contact and the account name

		for(Contact currContact : contacts) {
			if (accountMap.containsKey(currContact.AccountId)){
				Account foundAccount = accountMap.get(currContact.AccountId);
				System.debug('Contact Name is: ' + currContact.Name);
				System.debug('Account Name is: ' + foundAccount.Name);				
			}
		}

	}
}