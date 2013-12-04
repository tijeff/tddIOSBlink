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
@end

@implementation blinkModelTests
{
    epiBlinkModel* blinkModel;
    unsigned int numberNotifications;
}

-(id)init
{
    self = [super init];
    numberNotifications = 0;
    return self;
}

-(void)beatNotificationHandle:(NSNotification*)note
{
    numberNotifications++;
}

- (void)setUp
{
    [super setUp];
    numberNotifications = 0;
    blinkModel = [[epiBlinkModel alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(beatNotificationHandle:)
                                                 name:@"beatNotification"
                                               object:nil];
}

- (void)tearDown
{
    [blinkModel stopBeat];
    blinkModel = Nil;
    numberNotifications = 0;
    [super tearDown];
}

- (void)testDefaultPeriod
{
    XCTAssertEqual(10u, blinkModel.period, @"Test default period");
}

-(void)testIncrementPeriod
{
    [blinkModel incrementPeriod:10];
    XCTAssertEqual(20u, blinkModel.period, @"Test increment period");
}

-(void)testDecrementPeriod
{
    [blinkModel decrementPeriod:10];
    XCTAssertEqual(0u, blinkModel.period, @"Test increment period");
}

-(void)testDecrementPeriodBiggerValue
{
    [blinkModel decrementPeriod:12];
    XCTAssertEqual(0u, blinkModel.period, @"Test decrement period");
}

-(void)testBeatNotification1sAfterStart
{
    [blinkModel startBeat];
    sleep(1u);
    XCTAssertEqual(1u, numberNotifications, @"Test beat notification");
}

-(void)testBeatNotification11sAfterStart
{
    [blinkModel startBeat];
    sleep(11u);
    XCTAssertEqual(2u, numberNotifications, @"Test beat notification");
}

-(void)testBeatNotificationStartWait11sStopWait20s
{
    [blinkModel startBeat];
    sleep(11u);
    [blinkModel stopBeat];
    sleep(20u);
    XCTAssertEqual(2u, numberNotifications, @"Test beat notification");
}

@end
