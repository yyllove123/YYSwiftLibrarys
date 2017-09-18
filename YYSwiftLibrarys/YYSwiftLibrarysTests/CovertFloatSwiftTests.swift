//
//  CovertFloatSwiftTests.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/18.
//  Copyright © 2017年 yalin. All rights reserved.
//

import XCTest

class CovertFloatSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_floatString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let value: Float = 9.996
        
        let valuestr = value.string(index: nil)
        XCTAssert(valuestr == "9.996000", "\(value).string(index: nil) - error value: \(valuestr)")
        
        let valuesstr1 = value.string(index: 1)
        XCTAssert(valuesstr1 == "9.9", "\(value).string(index: 1) - error value: \(valuesstr1)")
        
        let valuesstr2 = value.string(index: 2)
        XCTAssert(valuesstr2 == "9.99", "\(value).string(index: 2) - error value: \(valuesstr2)")
        
        let roundUpValueStr1 = value.string(index: 1, roundUp: true)
        XCTAssert(roundUpValueStr1 == "10.0", "\(value).string(index: 1, roundUp: true) - error value: \(roundUpValueStr1)")
        
        let roundUpValueStr2 = value.string(index: 2, roundUp: true)
        XCTAssert(roundUpValueStr2 == "10.00", "\(value).string(index: 2, roundUp: true) - error value: \(roundUpValueStr2)")
        
        
        let value1: Float = 9.995
        let value1str2 = value1.string(index: 2, roundUp: true)
        XCTAssert(value1str2 == "9.99", "\(value1).string(index: 2) - error value: \(value1str2)")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
