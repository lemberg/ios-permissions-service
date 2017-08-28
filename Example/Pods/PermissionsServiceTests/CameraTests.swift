//
//  CameraTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import XCTest
import Photos
@testable import PermissionsService

class CameraTests: XCTestCase {
    
    var object: Camera!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testCameraInit()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test if inits without problems
    func testCameraInit() {
        object = Camera(with: DefaultConfiguration())
        XCTAssertNotNil(object)
    }
    
    //this class supports not all types, so we test if type is correct
    func testIfPermissionTypeIsCorrect() {
        XCTAssertEqual(object.type, AVMediaTypeVideo)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
