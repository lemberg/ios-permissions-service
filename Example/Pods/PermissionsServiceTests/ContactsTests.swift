//
//  ContactsTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//
import XCTest
@testable import PermissionsService

class ContactsTests: XCTestCase {
    
    var object: Contacts!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testContactsInit()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test if inits without problems
    func testContactsInit() {
        object = Contacts(with: DefaultConfiguration())
        XCTAssertNotNil(object)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
