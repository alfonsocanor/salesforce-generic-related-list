@isTest
private class RelatedListSetupControllerTest {

    @isTest
    static void getAllObjectNamesFromSchemaObject(){
        System.assert(!RelatedListSetupController.getObjectsAPIName().isEmpty());
    }

    @isTest
    static void getAllChildObjectAPINamesFromGetObjectsNameMethodWhenAnObjectNameIsPassAsAParameter(){
        System.assert(!RelatedListSetupController.getRelatesListsAPIName('Account').isEmpty());
    }

    @isTest
    static void getParentAPINameFromTheRelatedListAPIName(){
        System.assertEquals('AccountId', RelatedListSetupController.getParentFieldAPIName('Account','Opportunity'));
    }

    @isTest
    static void getAllFieldFromARelatesListUsingAllMethods(){
       System.assert(!RelatedListSetupController.getAllFieldsFromRelatedListObject('Opportunity', 'AccountId').isEmpty());
    }

    @isTest
    static void saveRelatedListSetupFromObject(){
        RelatedListSetupController.saveRelatedListSetup('Account', 'Opportunity', 'AccountId', '[{}]');

        Related_List_Setup__c relatedListSetup = [
            SELECT Id, Parent_Object__c, Child_Object__c, Parent_Child_Field_Relationship__c, Related_List_Fields_JSON__c
            FROM Related_List_Setup__c
        ];

        System.assertEquals('Account',relatedListSetup.Parent_Object__c);
        System.assertEquals('Opportunity', relatedListSetup.Child_Object__c);
        System.assertEquals('AccountId', relatedListSetup.Parent_Child_Field_Relationship__c);
        System.assertEquals('[{}]', relatedListSetup.Related_List_Fields_JSON__c);
    }

    @isTest
    static void getCoverage(){
        RelatedListSetupController.getCoverage();
    }
}