//
//  LocationTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import XCTest
import CoreLocation
@testable import PermissionsService

class LocationTests: XCTestCase {
    
    var object: Location!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        testLocationInit()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test if inits without problems
    func testLocationInit() {
        object = Location(with: LocationConfiguration())
        XCTAssertNotNil(object)
    }
    
    func testLocationInit_defaultConfiguration() {
        object = Location(with: DefaultConfiguration())
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.type, CLAuthorizationStatus.authorizedWhenInUse)
    }
    
    func testLocationInit_defaultLocationConfiguration() {
        object = Location(with: LocationConfiguration())
        XCTAssertNotNil(object)
    }
    
    func testLocationInit_alwaysLocationConfiguration() {
        object = Location(with: LocationConfiguration(.always))
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.type, CLAuthorizationStatus.authorizedAlways)
    }
    
    func testLocationInit_inUseLocationConfiguration() {
        object = Location(with: LocationConfiguration())
        XCTAssertNotNil(object)
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
