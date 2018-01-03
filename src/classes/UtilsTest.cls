@isTest
private class UtilsTest {
	
	@isTest static void checkForchangedFieldsTest() {
		// Implement test code
		List<Account> accounts = new List<Account>{
			new Account(Id='0011I00000EY7qc', Name='test name'),
			new Account(Id='0011I00000EY7qd', Name='test name')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{
			'0011I00000EY7qc' => new Account(Id='0011I00000EY7qc', Name ='test name CHANGED'),
			'0011I00000EY7qd' => new Account(Id='0011I00000EY7qc', Name ='test name')
		};

		String fieldsToCheck = 'Name';

		List<SObject> changedRecords = Utils.checkForChangedFields(accounts, oldAccountMap, fieldsToCheck);

		//assert size
		System.assertEquals(1, changedRecords.size());
		System.assertEquals(accounts[0], changedRecords[0]);

	}
	
	@isTest static void checkForchangedFieldsTestException() {
		// Implement test code
		List<Account> accounts = new List<Account>{
			new Account(Id='0011I00000EY7qc', Name='test name'),
			new Account(Id='0011I00000EY7qd', Name='test name', Type='Other')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{
			'0011I00000EY7qc' => new Account(Id='0011I00000EY7qc', Name ='test name CHANGED'),
			'0011I00000EY7qd' => new Account(Id='0011I00000EY7qc', Name ='test name', Type='Prospect')
		};

		List<String> fieldsToCheck = new List<String>{'Name', 'I dont exist', 'Type'};

		List<SObject> changedRecords = Utils.checkForChangedFields(accounts, oldAccountMap, fieldsToCheck);

		//assert size
		System.assertEquals(1, changedRecords.size());
		System.assertEquals(accounts[0], changedRecords[0]);
		System.assertEquals(accounts[1], changedRecords[1]);

	}
	@isTest static void checkForchangedFieldsTestExceptionVal() {
		// Implement test code
		List<Account> accounts = new List<Account>{
			new Account(Id='0011I00000EY7qc', Name='test name', Type='Other'),
			new Account(Id='0011I00000EY7qd', Name='test name', Type='External')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{
			'0011I00000EY7qc' => new Account(Id='0011I00000EY7qc', Name ='test name', Type='Prospect'),
			'0011I00000EY7qd' => new Account(Id='0011I00000EY7qc', Name ='test name', Type='Prospect')
		};

		List<String> fieldsToCheck = new List<String>{'Name', 'I dont exist', 'Type'};

		List<SObject> changedRecords = Utils.checkForChangedFields(accounts, oldAccountMap, 'Type', 'Other' );

		System.assertEquals(1, changedRecords.size());
		System.assertEquals(accounts[0], changedRecords[0]);

	}	

}