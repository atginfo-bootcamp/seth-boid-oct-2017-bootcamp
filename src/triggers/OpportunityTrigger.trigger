trigger OpportunityTrigger on Opportunity (after insert, after update) {

if(Trigger.isAfter && Trigger.isInsert){

		OpportunityTriggerHandler.afterInsert(Trigger.new);

	} else if(Trigger.isAfter && Trigger.isUpdate){

		OpportunityTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);

	}
}