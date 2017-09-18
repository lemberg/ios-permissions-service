//
//  EventsTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import XCTest
import EventKit
@testable import PermissionsService

class EventsTests: XCTestCase {
    
    var object: Events!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testEventsInit()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test if inits without problems
    func testEventsInit() {
        object = Events(with: DefaultConfiguration())
        XCTAssertNotNil(object)
    }
    
    //this class supports only one type .event, so we test if type is correct
    func testIfPermissionTypeIsCorrect() {
        XCTAssertEqual(object.type, EKEntityType.event)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
