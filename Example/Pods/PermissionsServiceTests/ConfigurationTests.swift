//
//  ConfigurationTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import XCTest
@testable import PermissionsService

class ConfigurationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfiguratorInit_events() {
        var configuration = Configurator(for: Events.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_mediaLibrary() {
        var configuration = Configurator(for: MediaLibrary.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_camera() {
        var configuration = Configurator(for: Camera.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_gallery() {
        var configuration = Configurator(for: Gallery.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_contacts() {
        var configuration = Configurator(for: Contacts.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_siri() {
        var configuration = Configurator(for: Siri.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_speechRecognition() {
        var configuration = Configurator(for: SpeechRecognition.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_location() {
        var configuration = Configurator(for: Location.self)
        XCTAssertTrue(configuration.configuration is LocationConfiguration)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
