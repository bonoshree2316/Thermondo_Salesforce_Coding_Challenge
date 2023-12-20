/*
* Name            :    NPSAPICalloutAction
* Description     :    This class contains invocable method which will fire flow when order status will be marked as fullfilled
* Created Date    :    [18th Dec , 2023]
* Created By      :    Bonoshree Mondal
*
* Date Modified        Modified By             Description of the update
   18th-Dec-2023      Bonoshree Mondal          Initial Version
*/

public class NPSAPICalloutAction {
  @InvocableMethod(label='Call NPS API' description='Sends order data to NPS API when order status is changed to Fulfilled' category= 'Order')
    
    // Method to perform HTTP callout
    public static void callNPSAPI(List<Id> ordersIds) {
        List<NPSAPIWrapper> orderWrapper = new List<NPSAPIWrapper>();
        try{
            for(Order o : [select id, BillToContact.Email, OrderNumber from Order where Id = : ordersIds]){
                orderWrapper.add(new NPSAPIWrapper(o));
            }
                  
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:NPSAPI');
            request.setMethod('POST'); 
            request.setBody(JSON.serialize(orderWrapper));
            HttpResponse response = http.send(request);
            
        }
      	catch(CalloutException ex){
            System.debug('Callout Exception occurred :'+ ex);
      	}
      	catch(Exception ex){
            System.debug('Exception occurred :'+ ex.getStackTraceString());
      	}
  }

}