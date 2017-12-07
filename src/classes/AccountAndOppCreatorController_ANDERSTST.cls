@isTest
private class AccountAndOppCreatorController_ANDERSTST {


	private static AccountAndOppCreatorController_ANDERS initData(){
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();
		controller.account.Name = 'Test Name';
		controller.account.AccountNumber = 'Test Account Number';
		controller.account.Description = 'Test Description';
		controller.account.Type = 'Other';

		controller.contact.FirstName = 'Seth';
		controller.contact.LastName = 'Boid';
		controller.contact.Salutation = 'Mr.';

		controller.opportunity.Name= 'Opp Name';
		controller.opportunity.Type = 'New Customer';

		return controller;
	}

	
	@isTest static void testControllerInit() {
		// Implement test code
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();

		System.assertNotEquals(null, controller.account);
		System.assertNotEquals(null, controller.contact);
		System.assertNotEquals(null, controller.opportunity);
		System.assertEquals(false, controller.showCreatedDataSection);

		System.assertEquals('Needs Analysis', controller.opportunity.StageName);
		System.assertEquals(Date.today().addDays(30), controller.opportunity.CloseDate);


	}
	
	@isTest static void testAccountNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.account.Name = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
		//query accounts, contacts, opps = make sure size = 0
	
}

	@isTest static void testAccountNumberRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.account.AccountNumber = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
		//query accounts, contacts, opps = make sure size = 0
	
}

	@isTest static void testAccountTypeRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.account.Type = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
		//query accounts, contacts, opps = make sure size = 0
	
}

	@isTest static void testContactFirstNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.contact.FirstName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
		//query accounts, contacts, opps = make sure size = 0
	
}

	@isTest static void testContactLastNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.contact.LastName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
		//query accounts, contacts, opps = make sure size = 0
	
}

//	@isTest static void testOpportunityNameRequired() {
//		AccountAndOppCreatorController_ANDERS controller = initData();
		
//		controller.opportunity.Name = null;

//		controller.saveData();

//		System.assertEquals(1, ApexPages.getMessages().size());

//		List<Account> accounts = [SELECT Id FROM Account];
//		List<Contact> contact = [SELECT Id FROM Contact];
//		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

//		System.assertEquals(0, accounts.size());
//		System.assertEquals(0, contact.size());
//		System.assertEquals(0, opportunity.size());
//		//query accounts, contacts, opps = make sure size = 0
	
//}

	@isTest static void testOpportunityTypeRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.opportunity.Type = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
		//query accounts, contacts, opps = make sure size = 0
	
}


//test all required fields

	@isTest static void testOppNameDefaultsToAccountNAme() {
	//	If opp name is null, should be set to account name
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.opportunity.Name = null;
		
		controller.saveData();

		System.assertEquals(controller.opportunity.Name, controller.account.Name);

}

	@isTest static void testOppRetainsValue() {
	// ensure that specified opp name is not overwritten

		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.opportunity.Name = 'Super Awesome Opportunity';

		controller.saveData();

		//Opportunity opportunity = [SELECT name FROM Opportunity];

		System.assertEquals(controller.opportunity.Name, 'Super Awesome Opportunity') ;

}

	@isTest static void testSuccessPath() {
	//	Test that everything was created
	// test that all values were re-initialized
	
}

}









