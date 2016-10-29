//
//  eCommTests.swift
//  eCommTests
//
//  Created by Neegbeah Reeves on 10/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import XCTest

@testable import eComm

class eCommTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
      //  self.measure {
            // Put the code you want to measure the time of here.
        //}
    }
    
    func testPostCustomer() {
        // construct the Customer object you want to create
        // in this case, address is an object so it needs its own initializer
        let address = Address(streetName: "Street", streetNumber: "1", city: "City", state: "VA", zipCode: "12345")
        let customerToCreate = Customer(firstName: "Victor", lastName: "Lopez", address: address, customerId: "sup3rc00la1ph4num3r1cId")
        
        // send the request using the wrapper!
        CustomerRequest().postCustomer(customerToCreate, completion:{(response, error) in
            if (error != nil) {
                // handling the error. You could alternatively not have this block if you so choose
                print(error)
            } else {
                // map the response and determine how to use i
                // in this case, we only print to console
                let customerResponse = response as BaseResponse<Customer>?
                let message = customerResponse?.message
                let customerCreated = customerResponse?.object
                print("\(message): \(customerCreated)")
                self.testPutCustomer(customerCreated!)
            }
        })
    }
    
    func testPutAccount(accountId: String, nickname: String, accountNumber: String?) {
        AccountRequest().putAccount(accountId, nickname: nickname, accountNumber: accountNumber, completion:{(response, error) in
            if (error != nil) {
                print(error)
            } else {
                let accountResponse = response as BaseResponse<Account>?
                let message = accountResponse?.message
                let accountCreated = accountResponse?.object
                print("\(message): \(accountCreated)")
            }
        })
    }
    
    func testPutCustomer(customerToBeModified: Customer) {
        customerToBeModified.firstName = "Raul"
        CustomerRequest().putCustomer(customerToBeModified, completion:{(response, error) in
            if (error != nil) {
                print(error)
            } else {
                let accountResponse = response as BaseResponse<Customer>?
                let message = accountResponse?.message
                let accountCreated = accountResponse?.object
                print("\(message): \(accountCreated)")
            }
        })
    }

}
