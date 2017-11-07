trigger LeadTrigger on Lead (before insert, 
							before update, 
							before delete, 
							after insert,
							after update, 
							after delete, 
							after undelete
) 
{

//	System.debug('Trigger.isInsert: ' + Trigger.isInsert);
//	System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
//	System.debug('Trigger.isDelete: ' + Trigger.isDelete);
//	System.debug('Trigger.isUndelete: ' + Trigger.isUndelete);

//	System.debug('Trigger.isBefore: ' + Trigger.isBefore);
//	System.debug('Trigger.isAfter: ' + Trigger.isAfter);

//	//Records in new state being inserted to the DB
//	List<Lead> leads = Trigger.new;
//	Map<Id, Lead> leadMap = Trigger.newMap;



//	//Records are populated with old values vefore update
//	List<Lead> oldLeads = Trigger.old;
//	Map<Id, Lead> oldLeadMap = Trigger.oldmap;

//	System.debug('Trigger.new: ' + Trigger.new);
//	System.debug('Trigger.newMap: ' + Trigger.newMap);
//	System.debug('Trigger.old: ' + Trigger.old);
//	System.debug('Trigger.oldMap: ' + Trigger.oldMap);

//	// Common way to choose what code to call and when
	if(Trigger.isBefore && Trigger.isInsert) {
		LeadTriggerHelper.beforeInsert(Trigger.new);
		//call your code to do stuff

		//Change first lead title to king - No DML needed in "BEFORE" context
		//leads[0].Title = 'King';

	} else if(Trigger.isAfter && trigger.isUpdate) {
		LeadTriggerHelper.afterUpdate(Trigger.new, Trigger.oldMap);
		//leads[0].Title = leads[0].Id;
		// do stuff after update
		//call helper methods
	}

}