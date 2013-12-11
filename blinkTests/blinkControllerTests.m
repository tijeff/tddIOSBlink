//
//  blinkControllerTests.m
//  blink
//
//  Created by jeff on 11/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "epiViewController.h"
#import "mockBlinkModel.h"

@interface blinkControllerTests : XCTestCase
{
    epiViewController*sutController;
    mockBlinkModel*theMockBlinkModel;
    bool dontUseMockModel;
}
@end

@implementation blinkControllerTests

-(void)allocController
{
    if (dontUseMockModel) {
        sutController = [[epiViewController alloc] init];
    } else {
        theMockBlinkModel = [[mockBlinkModel alloc] init];
        sutController = [[epiViewController alloc] initWithModel:theMockBlinkModel];
    }
}

- (void)setUp
{
    [super setUp];
    [self allocController];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testControllerModelNotNil
{
    dontUseMockModel = true;
    XCTAssertNotNil([sutController model], @"View Controller Model nil");
}

-(void)testControllerInitWithModel
{
    XCTAssertEqual([sutController model], theMockBlinkModel,
                   @"View Controller set Model wrong");
}

-(void)testControllerActionPlusCallModelIncrementPeriod
{
    [sutController actionPlus:nil];
    XCTAssertEqual(1u, [theMockBlinkModel nbCallIncrementPeriode],
                   @"Action Plus shall call Model IncremetPeriode");
}
@end
