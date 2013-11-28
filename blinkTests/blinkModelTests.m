//
//  blinkTests.m
//  blinkTests
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "epiBlinkModel.h"

@interface blinkModelTests : XCTestCase
{
    epiBlinkModel* blinkModel;
}
@end

@implementation blinkModelTests

- (void)setUp
{
    [super setUp];
    blinkModel = [[epiBlinkModel alloc] init];
}

- (void)tearDown
{
    blinkModel = Nil;
    [super tearDown];
}

- (void)testDefaultFrequency
{
    XCTAssertEqual(10u, blinkModel.frequency, @"Test default frequency");
}

-(void)testIncrementFrequency
{
    [blinkModel incrementFrequency:10];
    XCTAssertEqual(20u, blinkModel.frequency, @"Test increment frequency");
}

-(void)testDecrementFrequency
{
    [blinkModel decrementFrequency:10];
    XCTAssertEqual(0u, blinkModel.frequency, @"Test increment frequency");
}

@end
