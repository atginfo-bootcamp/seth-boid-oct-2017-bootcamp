public with sharing class ProductTriggerHelper {

	public  static void handleAfterUpdate(List<Product2> products, Map<Id, Product2> oldProductMap) {
		checkIfNameChanged(products, oldProductMap);
	}

	public  static void checkIfNameChanged(List<Product2> products, Map<Id, Product2> oldProductMap) {
		//LoopProducts
		//Determine if product name changed, if so, print to console
		List<String> trackChanges = new List<String>{'Name', 'ProductCode', 'isActive', 'fakefield'};
		List<Product2> changedProducts = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, trackChanges);
		for(Product2 product : changedProducts){
			System.debug('Product Changed: ' + product);
		}



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














