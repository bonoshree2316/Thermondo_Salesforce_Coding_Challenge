/*
* Name            :    NPSAPIWrapper
* Description     :    This is the Wrapper class to send the order data to NPSAPI for Fulfilled order
* Created Date    :    [18th Dec , 2023]
* Created By      :    Bonoshree Mondal
*
* Date Modified        Modified By             Description of the update
   18th-Dec-2023      Bonoshree Mondal          Initial Version

*/

public class NPSAPIWrapper {
        public String sfId;
        public String orderNumber;
        public String customerEmail;
		
		public NPSAPIWrapper(Order o){
			this.sfId = o.Id;
			this.orderNumber = o.OrderNumber;
			this.customerEmail = o.BillToContact.Email; //o.Contact.Email
		}
        
}