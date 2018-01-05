public with sharing class ProductTriggerHelper {

	public  static void handleAfterUpdate(List<Product2> products, Map<Id, Product2> oldProductMap) {
		checkIfNameChanged(products, oldProductMap);
		trackIfProductChanged(products, oldProductMap);
	}

	public  static void checkIfNameChanged(List<Product2> products, Map<Id, Product2> oldProductMap) {
		//LoopProducts
		//Determine if product name changed, if so, print to console
		List<String> trackChanges = new List<String>{'Name', 'ProductCode', 'isActive', 'fakefield'};
		List<Product2> changedProducts = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, trackChanges);
		for(Product2 product : changedProducts){
			System.debug('Product Changed: ' + product);
		}

		List<Product2> changedProductsWithExpectedPF = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, 'Family', 'Special');
		for(Product2 product : changedProductsWithExpectedPF){
			System.debug('Product Family Changed to Special: ' + product);
		}

	}

	public  static void trackIfProductChanged(List<Product2> products, Map<Id, Product2> oldProductMap) {
		//LoopProducts

		List<Product2> changedProducts = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, Constants.TRACK_PRODUCT_CHANGES);
		List<Product_Changes__c> productChanges = new List<Product_Changes__c>();

		for(Product2 product : changedProducts){

			System.debug('Product Changed: ' + product);
			
			Product_Changes__c productChange = new Product_Changes__c();
			
			productChange.Product__c = product.Id;
			productChange.Date_Changed__c = Datetime.now();
			productChange.Changed_user__c = product.LastModifiedById;

			productChanges.add(productChange);

		}

		insert productChanges;

	}	

	//This is the old version before moving to generic SObject
	//public  static void checkIfNameChanged(List<Product2> products, Map<Id, Product2> oldProductMap) {
	//	//LoopProducts
	//	//Determine if product name changed, if so, print to console

	//	for(Product2 currProd : products){
	//		Product2 oldProd = oldProductMap.get(currProd.Id);
	//		if(currProd.Name != oldProd.Name){
	//			System.debug('Product Name Changed: ' + currProd.Name);
	//		}
	//	}


	//}	


}














