//
//  blinkViewTests.m
//  blink
//
//  Created by jeff on 03/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "epiViewController.h"

@interface blinkViewTests : XCTestCase
{
    epiViewController* viewController;
}
@end

@implementation blinkViewTests

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [storyboard instantiateInitialViewController];
    [viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
    viewController = nil;
    [super tearDown];
}

- (void)testButtonPlus
{
    XCTAssertNotNil([viewController buttonPlus]);
}

- (void)testButtonMinus
{
    XCTAssertNotNil([viewController buttonMinus]);
}

- (void)testLabelFreq
{
    XCTAssertNotNil([viewController labelFrequence]);
}

- (void)testLabelFreqColor
{
    XCTAssertEqualObjects([[viewController labelFrequence] textColor], [UIColor greenColor], @"Frequence label should be green");
}

- (void)testLabelFreqCenter
{
    XCTAssertEqual([[viewController labelFrequence] textAlignment], NSTextAlignmentCenter, @"Frequence label should center align");
}


@end
