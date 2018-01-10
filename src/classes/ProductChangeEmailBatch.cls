global class ProductChangeEmailBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	String query;
	public String emailBody = 'Heres a list of the products that have been changed \n\n';
	public List<Product_Changes__c> allProductChangeRecords = new List<Product_Changes__c>();


	global ProductChangeEmailBatch() {
		
		query = 'Select Id, Date_Changed__c, Product__c, Changed_user__r.Email, Changed_user__r.Name FROM Product_Changes__c WHERE  Email_Sent_Date__c = null';

	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		System.debug('start()');
		
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<Product_Changes__c> productChangeRecords) {
		System.debug('execute: ' + productChangeRecords);

		for(Product_Changes__c currProduct : productChangeRecords){
			emailBody += currProduct.Date_Changed__c + ' ' + currProduct.Id + ' ' + currProduct.Product__c + ' ' + currProduct.Changed_user__r.Name + ' ' + currProduct.Changed_user__r.Email + ' ' + '\n';
			System.debug('Email Body: ' + emailBody);
		}
		allProductChangeRecords.addAll(productChangeRecords);

	}
	
	global void finish(Database.BatchableContext BC) {
		System.debug('finish()');
		
		sendEmail(emailBody);
		createProductUpdateChangeLog(emailBody);
	}
	
	private void createProductUpdateChangeLog(String body) {
	
		Product_Change_Email_Log__c changeLog = new Product_Change_Email_Log__c();
				
		changeLog.Date_Sent__c = Datetime.now();
		changeLog.Sent_To__c = 'seth.boid@atginfo.com';
		changeLog.Email_Body__c = body;
		
		insert changeLog;

		for (Product_Changes__c productChangeRec : allProductChangeRecords){
			productChangeRec.Product_Change_Email_Log__c = changeLog.Id;
			productChangeRec.Email_Sent_Date__c = changeLog.Date_Sent__c;
		}
		update allProductChangeRecords;
		
	}

	private void sendEmail(String body) {
		System.debug('sendEmail()');

		// First, reserve email capacity for the current Apex transaction to ensure
		// that we won't exceed our daily email limits when sending email after
		// the current transaction is committed.
		Messaging.reserveSingleEmailCapacity(1);

		// Processes and actions involved in the Apex transaction occur next,
		// which conclude with sending a single email.

		// Now create a new single email message object
		// that will send out a single email to the addresses in the To, CC & BCC list.
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

		// Strings to hold the email addresses to which you are sending the email.
		String[] toAddresses = new String[] {'seth.boid@atginfo.com'}; 
		  

		// Assign the addresses for the To and CC lists to the mail object.
		mail.setToAddresses(toAddresses);

		// Specify the address used when the recipients reply to the email. 
		mail.setReplyTo('seth.boid@atginfo.com');

		// Specify the name used as the display name.
		mail.setSenderDisplayName('Badass MFer');

		// Specify the subject line for your email address.
		// mail.setSubject('Products changed today, ' + today());

		// Specify the text content of the email.
		mail.setPlainTextBody(body);

		//mail.setHtmlBody('Your case:<b> ' + case.Id +' </b>has been created.<p>'+
		//     'To view your case <a href=https://***yourInstance***.salesforce.com/'+case.Id+'>click here.</a>');

		// Send the email you have created.
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}