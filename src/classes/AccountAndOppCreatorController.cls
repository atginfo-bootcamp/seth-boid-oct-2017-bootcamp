public with sharing class AccountAndOppCreatorController {
	public Account account {get; set;}
	public Contact contact {get; set;}
	public Opportunity opportunity {get; set;}


	public AccountAndOppCreatorController() {
		account = new Account();
		contact = new Contact();
		opportunity = new Opportunity();
		opportunity.stageName = 'Needs Analysis';
		opportunity.closeDate = Date.today().addDays(30);
	}
	public PageReference save(){
		try{
			insert account;

			contact.accountId = account.Id;
			opportunity.accountId = account.Id;

			insert contact;

			if (opportunity.name==null){
				opportunity.name=account.name;
			}

			insert opportunity;
		} 	catch (Exception ex) { 
			System.debug(ex);
			ApexPages.addMessages(ex);
		}
		System.debug('Account = ' + account);
		System.debug('Contact = ' + contact);
		System.debug('Opportunity = ' + opportunity);
		System.debug('Opportunity Name = ' + opportunity.name);


		return null;
	}
}