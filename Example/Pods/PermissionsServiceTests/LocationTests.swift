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
    let defaultAuthorizationType = CLAuthorizationStatus.authorizedWhenInUse
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocationInit_defaultConfiguration() {
        object = Location(with: DefaultConfiguration())
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.type, defaultAuthorizationType)
    }
    
    func testLocationInit_defaultLocationConfiguration() {
        object = Location(with: LocationConfiguration())
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.type, defaultAuthorizationType)
    }
    
    func testLocationInit_whenInUseLocationConfiguration() {
        object = Location(with: LocationConfiguration(.whenInUse))
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.type, defaultAuthorizationType)
    }
    
    func testLocationInit_alwaysLocationConfiguration() {
        object = Location(with: LocationConfiguration(.always))
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.type, CLAuthorizationStatus.authorizedAlways)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
