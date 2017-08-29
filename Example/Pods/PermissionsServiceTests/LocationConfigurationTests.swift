//
//  LocationConfigurationTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import XCTest
import CoreLocation
@testable import PermissionsService

class LocationConfigurationTests: XCTestCase {
    
    var object: LocationConfiguration!
    var permissionTypeObject: LocationConfiguration.LocationPermissionType!
    let defaultPermissionType: LocationConfiguration.LocationPermissionType = .whenInUse
    fileprivate let defaultMessages = DefaultMessages()
    fileprivate let customMessages = CustomMessages()


    fileprivate struct CustomMessages: ServiceMessages {
        let deniedTitle = "Custom Access denied"
        let deniedMessage = "Custom You can enable access to camera in Privacy Settings"
        let restrictedTitle = "Custom Access restricted"
        let restrictedMessage = "Custom Access to camera is restricted"
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: Init Test Cases
    func testLocationConfigurationInit_default() {
        object = LocationConfiguration()
        XCTAssertNotNil(object)

        XCTAssertEqual(object.permissionType, defaultPermissionType)
        XCTAssertTrue(object.messages.isEqual(to: defaultMessages))
    }
    
    func testLocationConfigurationInit_alwaysTypeWithDefaultMessages() {
        object = LocationConfiguration(.always)
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.permissionType, .always)
        XCTAssertTrue(object.messages.isEqual(to: defaultMessages))

    }
    
    func testLocationConfigurationInit_whenInUseTypeWithDefaultMessages() {
        object = LocationConfiguration(.whenInUse)
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.permissionType, defaultPermissionType)
        XCTAssertTrue(object.messages.isEqual(to: defaultMessages))
        
    }
    
    func testLocationConfigurationInit_defaultTypeWithCustomMessages() {
        object = LocationConfiguration(with: customMessages)
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.permissionType, defaultPermissionType)
        XCTAssertTrue(object.messages.isEqual(to: customMessages))

    }

    func testLocationConfigurationInit_alwaysTypeWithCustomMessages() {
        object = LocationConfiguration(.always, with: customMessages)
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.permissionType, .always)
        XCTAssertTrue(object.messages.isEqual(to: customMessages))
        
    }
    
    func testLocationConfigurationInit_whenInUseTypeWithCustomMessages() {
        object = LocationConfiguration(.whenInUse, with: customMessages)
        XCTAssertNotNil(object)
        
        XCTAssertEqual(object.permissionType, defaultPermissionType)
        XCTAssertTrue(object.messages.isEqual(to: customMessages))
        
    }
    
    //MARK: LocationPermissionType Test Cases
    func testLocationPermissionTypeInit_uncorrectRawValue() {
        permissionTypeObject = LocationConfiguration.LocationPermissionType.init(rawValue: 1)
        XCTAssertNil(permissionTypeObject)

    }
    
    func testLocationPermissionTypeInit_correctRawValueAlways() {
        permissionTypeObject = LocationConfiguration.LocationPermissionType.init(rawValue: 3)
        XCTAssertNotNil(permissionTypeObject)
        XCTAssertEqual(permissionTypeObject, .always)
        
    }
    
    func testLocationPermissionTypeInit_uncorrectRawValueWhenInUse() {
        permissionTypeObject = LocationConfiguration.LocationPermissionType.init(rawValue: 4)
        XCTAssertNotNil(permissionTypeObject)
        XCTAssertEqual(permissionTypeObject, defaultPermissionType)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

