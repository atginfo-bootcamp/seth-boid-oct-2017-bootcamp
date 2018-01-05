global class ProductChangeEmailBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	String query;
	public String emailBody = '';


	global ProductChangeEmailBatch() {
		
		query = 'Select Id, Date_Changed__c, Product__c, Changed_user__r.Email FROM Product_Changes__c WHERE  Email_Sent_Date__c = null';

	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<Product_Changes__c> productChangeRecords) {
	
		emailBody += 'Heres a list of the products that have been changed';

	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}