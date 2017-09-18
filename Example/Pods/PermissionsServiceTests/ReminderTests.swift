//
//  ReminderTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import EventKit
import XCTest
@testable import PermissionsService

class ReminderTests: XCTestCase {
    
    var object: Reminder!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testReminderInit()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test if inits without problems
    func testReminderInit() {
        object = Reminder(with: DefaultConfiguration())
        XCTAssertNotNil(object)
    }
    
    //this class supports only one type .reminder, so we test if type is correct
    func testIfPermissionTypeIsCorrect() {
        XCTAssertEqual(object.type, EKEntityType.reminder)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
