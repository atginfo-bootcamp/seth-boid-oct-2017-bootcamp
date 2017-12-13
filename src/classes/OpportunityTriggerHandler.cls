public with sharing class OpportunityTriggerHandler {

    public static void afterInsert(List<Opportunity> oppList){
        //

    }


    public static void afterUpdate(List<Opportunity> oppList, Map<Id, Opportunity> oldOppMap){


    }
        
    //private static List<Opportunity> queryOpps(List<Opportunity> opps){

    //    Set<Id> oppIds = new Set<Id>();

    //    for(Opportunity opp : opps){
    //        if(opp.StageName = 'Closed Won'){
    //            oppIds.add(opp.opportunityId);
    //        }
    //    }
    //    return oppIds;
    //}

}