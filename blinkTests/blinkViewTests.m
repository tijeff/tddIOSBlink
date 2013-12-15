//
//  blinkViewTests.m
//  blink
//
//  Created by jeff on 03/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//
// *****************************************************************************

#import <XCTest/XCTest.h>

// *****************************************************************************

#import "epiViewController.h"

// *****************************************************************************

@interface blinkViewTests : XCTestCase
{
    epiViewController* viewController;
}
@end

// *****************************************************************************

@implementation blinkViewTests

// -----------------------------------------------------------------------------
- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    viewController = [storyboard instantiateInitialViewController];
    [viewController performSelectorOnMainThread:@selector(loadView)
                                     withObject:nil
                                  waitUntilDone:YES];
}

// -----------------------------------------------------------------------------
- (void)tearDown
{
    viewController = nil;
    [super tearDown];
}

// -----------------------------------------------------------------------------
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)testButtonMinus
{
    XCTAssertNotNil([viewController buttonMinus]);
}

// -----------------------------------------------------------------------------
- (void)testButtonPlus
{
    XCTAssertNotNil([viewController buttonPlus]);
}

// -----------------------------------------------------------------------------
-(void)testButtonStartStop
{
    XCTAssertNotNil([viewController buttonStartStop]);
}

// -----------------------------------------------------------------------------
-(void)testLabelBlinker
{
    XCTAssertNotNil([viewController labelBlinker]);
}

// -----------------------------------------------------------------------------
- (void)testLabelPeriod
{
    XCTAssertNotNil([viewController labelPeriod]);
}

// -----------------------------------------------------------------------------
- (void)testLabelPeriodCenter
{
    XCTAssertEqual([[viewController labelPeriod] textAlignment],
                   NSTextAlignmentCenter, @"Period label should center align");
}

// -----------------------------------------------------------------------------
- (void)testLabelPeriodColor
{
    XCTAssertEqualObjects([[viewController labelPeriod] textColor],
                          [UIColor greenColor], @"Périod label should be green");
}

// -----------------------------------------------------------------------------
-(void)testLabelPeriodDefaultValue
{
    XCTAssertEqualObjects(@"", [[viewController labelPeriod] text],
                          @"View: default label period value shall be 0");
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@end
