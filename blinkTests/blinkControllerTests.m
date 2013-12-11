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
}
@end

@implementation blinkControllerTests

-(void)allocControllerWithMockModel:(bool)UseMockModel
{
    if (!UseMockModel) {
        sutController = [[epiViewController alloc] init];
    } else {
        theMockBlinkModel = [[mockBlinkModel alloc] init];
        sutController = [[epiViewController alloc] initWithModel:theMockBlinkModel];
    }
}

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    sutController = nil;
    [super tearDown];
}

-(void)testControllerInitWithModel
{
    [self allocControllerWithMockModel:true];
    XCTAssertEqual([sutController model], theMockBlinkModel,
                   @"View Controller set Model wrong");
}

- (void)testControllerViewDidLoadInitModel
{
    // Rebuild sutController with standard model (not mock)
    [self allocControllerWithMockModel:false];
    [sutController viewDidLoad];
    XCTAssertNotNil([sutController model],
                    @"viewDidLoad of View Controller shall init Model");
}

-(void)testControllerViewDidLoadShallKeepExistingModel
{
    [self allocControllerWithMockModel:true];
    [sutController viewDidLoad];
    XCTAssertEqualObjects([sutController model], theMockBlinkModel,
                    @"viewDidLoad of View Controller shall keep existing Model");
}

-(void)testControllerActionPlusCallModelIncrementPeriod
{
    [self allocControllerWithMockModel:true];
    [sutController actionPlus:nil];
    XCTAssertEqual(1u, [theMockBlinkModel nbCallIncrementPeriode],
                   @"Action Plus shall call Model IncremetPeriode");
}

@end
