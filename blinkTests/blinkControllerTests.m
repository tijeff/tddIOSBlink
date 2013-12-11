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
}
@end

@implementation blinkControllerTests

-(void)allocController
{
    sutController = [epiViewController alloc];
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
    sutController = [sutController init];
    XCTAssertNotNil([sutController model], @"View Controller Model nil");
}

-(void)testControllerInitWithModel
{
    epiBlinkModel*testModel = [[epiBlinkModel alloc] init];
    sutController = [sutController initWithModel:testModel];
    XCTAssertEqual([sutController model], testModel,
                   @"View Controller set Model wrong");
}

-(void)testControllerActionPlusCallModelIncrementPeriod
{
    mockBlinkModel*theMockBlinkModel = [[mockBlinkModel alloc] init];
    sutController = [sutController initWithModel:theMockBlinkModel];
    [sutController actionPlus:nil];
    XCTAssertEqual(1u, [theMockBlinkModel nbCallIncrementPeriode],
                   @"Action Plus shall call Model IncremetPeriode");
}
@end
