//
//  SimpleCalculatorUITests.swift
//  SimpleCalculatorUITests
//
//  Created by user222882 on 11/7/22.
//

import XCTest

final class SimpleCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPlus() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "4+3+6")
        view.calculateAll()
        
        let actual = view.workings
        let lowerNumber = "12"
        let expected = "13"
        let higherNumber = "14"
            
        XCTAssertNotNil(actual, "The answer mustn`t be nil!")
        XCTAssertGreaterThan(actual, lowerNumber, "The answer must be greater than 12!")
        XCTAssertLessThan(actual, higherNumber, "The answer must be less than 14!")
        XCTAssertEqual(actual, expected, "The answer must be 13!")
    }
    
    func testMinus() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "350-12-654+234-22")
        view.calculateAll()
        
        let actual = view.workings
        let wrongNumber = "104"
        let expected = "-104"
        let higherNumber = "0"
            
        XCTAssertNotNil(actual, "The answer mustn`t be nil!")
        XCTAssertLessThan(actual, higherNumber, "The answer must be less than 0!")
        XCTAssertNotEqual(actual, wrongNumber, "The answer mustn`t equal to 104")
        XCTAssertEqual(actual, expected, "The answer must be -104!")
    }
    
    func testMultiply() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "2*8")
        view.calculateAll()
        
        let actual1 = view.workings
        let expected1 = "16"
        
        view.clearAll()
        view.addToWorkings(value: "35*123")
        view.calculateAll()
        
        let actual2 = view.workings
        let expected2 = "4305"
        
        view.clearAll()
        view.addToWorkings(value: "12.2*43.5")
        view.calculateAll()
        
        let actual3 = view.workings
        let expected3 = "530.70"
        
        XCTAssertNotNil(actual1, "The answer mustn`t be nil!")
        XCTAssertEqual(actual1, expected1, "The answer must be 16!")
        XCTAssertNotNil(actual2, "The answer mustn`t be nil!")
        XCTAssertEqual(actual2, expected2, "The answer must be 4305!")
        XCTAssertNotNil(actual3, "The answer mustn`t be nil!")
        XCTAssertEqual(actual3, expected3, "The answer must be 530.70!")
    }
    
    func testDivide() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "93/3")
        view.calculateAll()
        
        let actual1 = view.workings
        let expected1 = "31"
        
        view.clearAll()
        view.addToWorkings(value: "22.5/5")
        view.calculateAll()
        
        let actual2 = view.workings
        let expected2 = "4.50"
        
        XCTAssertNotNil(actual1, "The answer mustn`t be nil!")
        XCTAssertEqual(actual1, expected1, "The answer must be 31!")
        XCTAssertNotNil(actual2, "The answer mustn`t be nil!")
        XCTAssertEqual(actual2, expected2, "The answer must be 4.50!")
    }
    
    func testPercent() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "80%6")
        view.calculateAll()
        
        let actual = view.workings
        let wrongNumber1 = "480"
        let wrongNumber2 = "4"
        let wrongNumber3 = "5"
        let expected = "4.80"
        
        XCTAssertNotNil(actual, "The answer mustn`t be nil!")
        XCTAssertNotEqual(actual, wrongNumber1, "The answer mustn`t equal to 480")
        XCTAssertNotEqual(actual, wrongNumber2, "The answer mustn`t equal to 4")
        XCTAssertNotEqual(actual, wrongNumber3, "The answer mustn`t equal to 5")
        XCTAssertEqual(actual, expected, "The answer must be 4.80!")
    }
    
    func testPow() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "2^6")
        view.calculateAll()
        
        let actual1 = view.workings
        let expected1 = "64"
        
        view.clearAll()
        view.addToWorkings(value: "0.1^2")
        view.calculateAll()
        
        let actual2 = view.workings
        let expected2 = "0.01"
        
        view.clearAll()
        view.addToWorkings(value: "-6^3")
        view.calculateAll()
        
        let actual3 = view.workings
        let expected3 = "-216"
        
        XCTAssertNotNil(actual1, "The answer mustn`t be nil!")
        XCTAssertEqual(actual1, expected1, "The answer must be 64!")
        XCTAssertNotNil(actual2, "The answer mustn`t be nil!")
        XCTAssertEqual(actual2, expected2, "The answer must be 0.01!")
        XCTAssertNotNil(actual3, "The answer mustn`t be nil!")
        XCTAssertEqual(actual3, expected3, "The answer must be -216!")
    }
    
    func testLog() throws {
        let app = XCUIApplication()
        app.launch()
            
        let view = ViewController()
            
        view.addToWorkings(value: "log 10")
        view.calculateAll()
        
        let actual1 = view.workings
        let expected1 = "1"
        
        view.clearAll()
        view.addToWorkings(value: "log 6")
        view.calculateAll()
        
        let actual2 = view.workings
        let expected2 = "0.78"
        
        view.clearAll()
        view.addToWorkings(value: "log 8.6")
        view.calculateAll()
        
        let actual3 = view.workings
        let expected3 = "0.93"
        
        view.clearAll()
        view.addToWorkings(value: "log 0.1")
        view.calculateAll()
        
        let actual4 = view.workings
        let expected4 = "-1.00"

        
        XCTAssertNotNil(actual1, "The answer mustn`t be nil!")
        XCTAssertEqual(actual1, expected1, "The answer must be 1!")
        XCTAssertNotNil(actual2, "The answer mustn`t be nil!")
        XCTAssertEqual(actual2, expected2, "The answer must be 0.78!")
        XCTAssertNotNil(actual3, "The answer mustn`t be nil!")
        XCTAssertEqual(actual3, expected3, "The answer must be 0.93!")
        XCTAssertNotNil(actual4, "The answer mustn`t be nil!")
        XCTAssertEqual(actual4, expected4, "The answer must be -1.00!")
    }
}
