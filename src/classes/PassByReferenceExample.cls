public with sharing class PassByReferenceExample {



	public static void execute (){

		Account myAccount = new Account(Name = 'My Little Pony', Type='Other');
		System.debug('initial value of myAccount: ' + myAccount);

		modifyAccount(myAccount);
		System.debug('after calling myAccount: ' + myAccount);

		modifyAccountName(myAccount.Name);
		System.debug('after calling modifyAccountName: ' + myAccount);

	}

//This method takes an account By Reference and modified properties on it
//Originial variable will be modified
	public static void modifyAccount(Account account){

		account.Name = 'The Name Was Changed in modifyAccount()';
		account.Type = 'Prospect';



	}

//This method takes the account name as a string (Primitive Data type) and modifies it
//This will not modify the original account
	public static void modifyAccountName(String accountName){
		accountName = accountName + 'I changed my name again';



		
	}
}