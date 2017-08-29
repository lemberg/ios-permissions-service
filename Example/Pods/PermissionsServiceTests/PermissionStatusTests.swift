//
//  PermissionStatusTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/29/17.
//
//

import XCTest
@testable import PermissionsService

class PermissionStatusTests: XCTestCase {
    
    var permissionStatus: PermissionStatus!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_unknownStatus() {
        permissionStatus = PermissionStatus.init(rawValue: -1)
        XCTAssertNotNil(permissionStatus)
        XCTAssertEqual(permissionStatus, .unknown)
    }
    
    func testInit_notDeterminedStatus() {
        permissionStatus = PermissionStatus.init(rawValue: 0)
        XCTAssertNotNil(permissionStatus)
        XCTAssertEqual(permissionStatus, .notDetermined)
    }
    
    func testInit_restrictedStatus() {
        permissionStatus = PermissionStatus.init(rawValue: 1)
        XCTAssertNotNil(permissionStatus)
        XCTAssertEqual(permissionStatus, .restricted)
    }
    
    func testInit_deniedStatus() {
        permissionStatus = PermissionStatus.init(rawValue: 2)
        XCTAssertNotNil(permissionStatus)
        XCTAssertEqual(permissionStatus, .denied)
    }
    
    func testInit_authorizedStatus() {
        permissionStatus = PermissionStatus.init(rawValue: 3)
        XCTAssertNotNil(permissionStatus)
        XCTAssertEqual(permissionStatus, .authorized)
    }
    
    func testInit_uncorrectStatus() {
        permissionStatus = PermissionStatus.init(rawValue: 5)
        XCTAssertNil(permissionStatus)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
