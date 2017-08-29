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
    
    var configuration: Configurator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfiguratorInit_events() {
        configuration = Configurator(for: Events.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_mediaLibrary() {
        configuration = Configurator(for: MediaLibrary.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_camera() {
        configuration = Configurator(for: Camera.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_gallery() {
        configuration = Configurator(for: Gallery.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_contacts() {
        configuration = Configurator(for: Contacts.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_siri() {
        configuration = Configurator(for: Siri.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_speechRecognition() {
        configuration = Configurator(for: SpeechRecognition.self)
        XCTAssertTrue(configuration.configuration is DefaultConfiguration)
    }
    
    func testConfiguratorInit_location() {
        configuration = Configurator(for: Location.self)
        XCTAssertTrue(configuration.configuration is LocationConfiguration)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
