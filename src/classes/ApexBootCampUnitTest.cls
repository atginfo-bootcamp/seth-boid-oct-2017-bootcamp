@isTest
private class ApexBootCampUnitTest {
	
	@isTest static void test_method_one() {
		// Implement test code
		List <Lead> leadList = [
			SELECT Id 
			FROM Lead
			WHERE Title = 'King'
		];

		System.assert(leadList != null);

		String idealTitle = 'King';
		for(Lead lead : leadList){
		System.assertEquals(lead.Title, idealTitle, 'It\'s Good to be King');
	}
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}