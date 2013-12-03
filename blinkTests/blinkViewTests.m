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

@end

@implementation blinkViewTests

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

- (void)testButtonPlus
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    epiViewController* viewController = [storyboard instantiateInitialViewController];
    [viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    XCTAssertNotNil([viewController buttonPlus]);
}
@end
