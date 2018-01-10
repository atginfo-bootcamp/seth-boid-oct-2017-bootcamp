@isTest
private class ProductTriggerHelperTest {
	
	@isTest static void productChange() {
		
		List<Product2> products = TestUtils.CreateProduct(15);
 		insert products;

 		products[0].Name = 'Changed Name';

 		update products;

 		//query Product Changed Records
 		// Make sure size =1
 		//Make sure ProductId on ProductChangedRecords = the ID of products[]
		List<Product_Changes__c> PC = [
			SELECT Id, Product__c 
			FROM Product_Changes__c
		];

		System.assertEquals(PC.size(), 1, 'You didnt change the name of any accounts' );
		System.assertEquals(PC[0].Product__c, products[0].Id, 'You didnt change the name of any accounts');

	}
	
	@isTest static void productNoChange() {
		// change non-tracked fields
		
		List<Product2> products = TestUtils.CreateProduct(15);
 		insert products;

 		products[0].Description = 'Changed Description';

 		update products;

 		//query Product Changed Records
 		// Make sure size =1
 		//Make sure ProductId on ProductChangedRecords = the ID of products[]
		List<Product_Changes__c> PC = [
			SELECT Id, Product__c 
			FROM Product_Changes__c
		];

		System.assertEquals(PC.size(), 0, 'You didnt change the name of any accounts' );

	}
	
}