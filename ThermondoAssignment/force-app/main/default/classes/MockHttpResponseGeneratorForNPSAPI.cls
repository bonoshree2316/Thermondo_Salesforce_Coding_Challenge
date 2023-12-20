/*
* Name            :    MockHttpResponseGeneratorForNPSAPI
* Description     :    This is a Mock class to create fake the response
* Created Date    :    [18th Dec , 2023]
* Created By      :    Bonoshree Mondal
*
* Date Modified        Modified By             Description of the update
   18th-Dec-2023      Bonoshree Mondal          Initial Version
*/

/**
 * @isTest annotation indicates that this class is a test class.
 * global modifier allows the class to be used in other classes or triggers.
 */
@isTest
global class MockHttpResponseGeneratorForNPSAPI implements HttpCalloutMock {
    /**
     * respond method is required to implement the HttpCalloutMock interface.
     * It simulates the response received from the HTTP callout.
     * 
     * @param req The HTTPRequest object representing the outgoing HTTP request.
     * @return HTTPResponse The simulated HTTP response to be used in the test.
     */
    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('POST', req.getMethod());
        // Create a simulated HTTP response
        HttpResponse res = new HttpResponse();
        res.setBody('SUCCESS');
        res.setStatusCode(200); // Simulated response status code (HTTP 200 OK)
        return res;
    }
}