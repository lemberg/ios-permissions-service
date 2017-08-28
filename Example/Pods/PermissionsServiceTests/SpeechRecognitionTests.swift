//
//  SpeechRecognitionTests.swift
//  Pods
//
//  Created by Hellen Soloviy on 8/28/17.
//
//

import XCTest

class SpeechRecognitionTests: XCTestCase {
    
    var object: SpeechRecognition!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testSpeechRecognitionInit()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test if inits without problems
    func testSpeechRecognitionInit() {
        object = SpeechRecognition(with: DefaultConfiguration())
        XCTAssertNotNil(object)
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
