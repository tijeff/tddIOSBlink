//
//  blinkControllerTests.m
//  blink
//
//  Created by jeff on 11/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "epiViewController.h"

@interface blinkControllerTests : XCTestCase

@end

@implementation blinkControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testControllerModelNotNil
{
    epiViewController*sutController;
    sutController = [[epiViewController alloc] init];
    XCTAssertNotNil([sutController model], @"View Controller Model nil");
}

@end
