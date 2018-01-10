public with sharing class TestUtils {

	public static List<Product2> CreateProduct(Integer numProducts){
		//create product

		List<Product2> products = new List<Product2>();

		for(integer i = 0; i < numProducts; i++){

			Product2 currProd = new Product2();
			currProd.Name = 'New Product ' + i;
			currProd.ProductCode = 'BITCHIN' + i;
			currProd.isActive = true;

			products.add(currProd);

		}

	return products;
	}

}