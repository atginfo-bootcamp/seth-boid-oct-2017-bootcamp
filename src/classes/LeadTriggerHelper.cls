public with sharing class LeadTriggerHelper {

	public static void beforeInsert(List<Lead> leadsList){
		//call your code to do stuff

		//Change first lead title to king - No DML needed in "BEFORE" context
		//leads[0].Title = 'King';

		for(Lead currLead : leadsList){
			currLead.Title = 'CEO';
		}

		hotLead(leadsList);
	}
	public static void afterUpdate(List<Lead> leadsList, Map<Id, Lead> oldLeadsMap){
		
		//for(Lead currLead : leadsList){
		//	currLead.Title = currLead.Id;
		//}
		//update leadsList;
		//leads[0].Title = leads[0].Id;
		// do stuff after update
		//call helper methods
	}

	public static void hotLead(List<lead> leads){	
		//New method called hotLead in Lead trigger
		//Query all Leads with Title from prior class (I used King).
		//Add 5 more Leads to the list (not through existing King method so that they are not inserted yet)
		//Make all Leads have a Rating of 'Hot'
		//Upsert the entire list of leads
		//**Verify**
		//Remove 5 additional leads code
		//Add in check to only update when needed

		//Query for existing Kings
		List<Lead> kingLeads = [SELECT Title, Rating FROM Lead WHERE Title = 'King'];

		//Looped 5 times to create 5 new leads, all Coylers unfortunately.  And made them all hot kings.
		//Added each new lead to the kingLeads list to keep track of all our Kings
		//for(Integer i = 0; i < 5; i++){
		//	Lead newLead = new Lead();
		//	newLead.LastName = 'Coyler'+i;
		//	newLead.Company = 'ATG';
		//	newLead.Rating = 'Hot';
		//	newLead.Title = 'King';

		//	kingLeads.add(newLead);
		//}

		//looped through the newly inserted leads checking for Kings
		//Because they would not have been returned by the SOQL Query
		for(Lead currLead : leads){
			if(currLead.Title == 'King'){
				//kingLeads.add(currLead);
				currLead.Rating = 'Hot';
			}
		}

		//Loop through all of the Kings leads and make them hot
		for(Lead currLead : kingLeads){
			currLead.Rating = 'Hot';
		}
		upsert kingLeads;
	}
}