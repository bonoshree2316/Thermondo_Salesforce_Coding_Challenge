/*
* Name            :    TestUtility
* Description     :    This is the Utility method for the test class for test data creation.
* Created Date    :    [18th Dec , 2023]
* Created By      :    Bonoshree Mondal
*
* Date Modified        Modified By             Description of the update
   18th-Dec-2023      Bonoshree Mondal          Initial Version

*/

public class TestUtility {
  
    public static Account createAccount(Boolean isInsert) {
        Account account = new Account(Name = 'Test Account');

        if(isInsert) {
          insert account;
        }

        return account;
    }
    
    public static Contract createContract(Boolean isInsert) {
        Account acc = TestUtility.createAccount(true);
        Contract c = new Contract(Name = 'Test Account', AccountId = acc.Id, Status = 'Draft');

        if(isInsert) {
          insert c;
        }

        return c;
    }
    
    public static Contact createContact(Boolean isInsert) {
        Account acc = TestUtility.createAccount(true);
        System.debug('account'+acc);
        Contact con = new Contact(LastName = 'Test Contact', AccountId = acc.Id, Email = 'test@test.com');
		
        if(isInsert) {
          insert con;
        }

        return con;
    }
    
    public static List<Order> createOrder(Boolean isInsert, Contract c, Contact con, Integer count) {
        Id pricebookId = Test.getStandardPricebookId();
        List<Order> orderList = new List<Order>();
        for(Integer i= 0; i < count; i++){
            Order o = new Order(Name = 'Test Account'+i, AccountId = c.AccountId, Status = 'Draft', EffectiveDate = Date.today(), Pricebook2Id =  pricebookId, BillToContactId = con.Id);
        	orderList.add(o);
        }

        if(isInsert) {
          insert orderList;
        }
        TestUtility.createOrderLineItems(true, orderList);
        return orderList;
    }
    
    public static Product2 createProduct(Boolean isInsert) {
        // Insert Product
        Product2 p = new Product2();
        p.Name = ' Test Product ';
        p.Description = 'Test Product Entry 1';
        p.productCode = 'ABC';
        p.isActive = true;
        insert p;
        return p;
    }
    
    public static PricebookEntry createPricebook() {
        // Insert Product
        Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = pricebookId;
        standardPrice.UnitPrice = 1;
        standardPrice.IsActive = true;
        standardPrice.UseStandardPrice = false;
        return standardPrice;
    }
    
    public static List<OrderItem> createOrderLineItems(Boolean isInsert, List<Order> orderList){
        Product2 p = TestUtility.createProduct(true);
        PricebookEntry standardPrice = TestUtility.createPricebook();
        standardPrice.Product2Id = p.Id;
        insert standardPrice;
        List<OrderItem> oliList = new List<OrderItem>();
        for(Order o : orderList){
            OrderItem i = new OrderItem();
            i.OrderId = o.id;
            i.Quantity = 24;
            i.UnitPrice = 240;
            i.Product2id = p.id;
            i.PricebookEntryId=standardPrice.id;
            oliList.add(i);
        }
        insert oliList;
        return oliList;
    }
    
    
   
    
}