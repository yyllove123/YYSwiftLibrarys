//
//  UIColorExtendOCTests.m
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/19.
//  Copyright © 2017年 yalin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YYSwiftLibrarysTests-Swift.h"

@interface UIColorExtendOCTests : XCTestCase

@end

@implementation UIColorExtendOCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_toImage {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    UIImage *image = [[UIColor redColor] toImage];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
