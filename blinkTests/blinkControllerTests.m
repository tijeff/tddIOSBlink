//
//  blinkControllerTests.m
//  blink
//
//  Created by jeff on 11/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//
// *****************************************************************************

#import <XCTest/XCTest.h>
#import "mockBlinkModel.h"

// *****************************************************************************

#import "epiViewController.h"

// *****************************************************************************

#define PERIOD (20u)
#define PERIOD_NSSTRING ([[NSString alloc] initWithFormat:@"%u",PERIOD])
#define START_NSSTRING @"START"

// *****************************************************************************

@interface blinkControllerTests : XCTestCase
{
    epiViewController*sutController;
    mockBlinkModel*theMockBlinkModel;
}
@end

// *****************************************************************************

@implementation blinkControllerTests

// -----------------------------------------------------------------------------
- (void)setUp
{
    [super setUp];
    [self allocControllerWithMockModel:true];
}

// -----------------------------------------------------------------------------
- (void)tearDown
{
    sutController = nil;
    [super tearDown];
}

// -----------------------------------------------------------------------------
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-(void)testControllerActionPlusCallModelIncrementPeriod
{
    [sutController actionPlus:nil];
    XCTAssertEqual(1u, [theMockBlinkModel nbCallIncrementPeriode],
                   @"Action Plus shall call Model IncremetPeriode");
}

// -----------------------------------------------------------------------------
-(void)testControllerActionStartStopCallModelStartBeat
{
    [sutController actionStartStop:nil];
    XCTAssertEqual(1u, [theMockBlinkModel nbCallStartBeat],
                   @"Action StartStop shall call Model startBeat");
}

// -----------------------------------------------------------------------------
-(void)testControllerInitWithModel
{
    XCTAssertEqual([sutController model], theMockBlinkModel,
                   @"View Controller set Model wrong");
}

// -----------------------------------------------------------------------------
- (void)testControllerViewDidLoadInitModel
{
    [self recreateSutControllerWithNoMockModel];
    [sutController viewDidLoad];
    XCTAssertNotNil([sutController model],
                    @"viewDidLoad of View Controller shall init Model");
}

// -----------------------------------------------------------------------------
-(void)testControllerViewDidLoadShallKeepExistingModel
{
    [sutController viewDidLoad];
    XCTAssertEqualObjects([sutController model], theMockBlinkModel,
                    @"viewDidLoad of View Controller shall keep existing Model");
}


// -----------------------------------------------------------------------------
-(void)testControllerViewDidLoadShallSetLabelPeriodWithModelPeriod
{
    UILabel* theLabel = [[UILabel alloc] init];
    sutController.labelPeriod = theLabel;
    [sutController viewDidLoad];
    XCTAssertEqualObjects(PERIOD_NSSTRING, [[sutController labelPeriod] text],
                          @"viewDidLoad shall initialize labelPeriod with Model Period");
    
}

// -----------------------------------------------------------------------------
-(void)testControllerViewDidLoadShallSetLabelStartStop
{
    UIButton* theButton = [[UIButton alloc] init];
    sutController.buttonStartStop = theButton;
    [sutController viewDidLoad];
    XCTAssertEqualObjects(START_NSSTRING, theButton.titleLabel.text,
                          @"viewDidLoad shall initialize StartStop button to START");
}

// -----------------------------------------------------------------------------
-(void)testControllerViewModelNotificationShallHighlighteLabelBlinker
{
    UILabel* theLabel = [[UILabel alloc] init];
    theLabel.highlighted = false;
    sutController.labelBlinker = theLabel;
    [sutController viewDidLoad];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beatNotification"
                                                        object:nil];
    XCTAssert(theLabel.highlighted,
              @"model notification shall reverse highligthted state of labelPeriod");
    
}

// -----------------------------------------------------------------------------
-(void)testControllerViewModelNotificationShallReverseHighlighteLabelBlinker
{
    UILabel* theLabel = [[UILabel alloc] init];
    theLabel.highlighted = false;
    sutController.labelBlinker = theLabel;
    [sutController viewDidLoad];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beatNotification"
                                                        object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beatNotification"
                                                        object:nil];
    XCTAssertFalse(theLabel.highlighted,
              @"model 2xnotification shall keep highligthted state of labelPeriod");
    
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// -----------------------------------------------------------------------------
-(void)allocControllerWithMockModel:(bool)UseMockModel
{
    if (!UseMockModel) {
        sutController = [[epiViewController alloc] init];
    } else {
        theMockBlinkModel = [[mockBlinkModel alloc] initWithPeriod:PERIOD];
        sutController = [[epiViewController alloc] initWithModel:theMockBlinkModel];
    }
}

// -----------------------------------------------------------------------------
- (void)recreateSutControllerWithNoMockModel
{
    sutController = nil;
    [self allocControllerWithMockModel:false];
}

@end
