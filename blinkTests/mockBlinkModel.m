//
//  mockBlinkModel.m
//  blink
//
//  Created by jeff on 11/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import "mockBlinkModel.h"

@implementation mockBlinkModel

-(id)initWithPeriod:(unsigned int)thePeriod
{
    self = [super init];
    period = thePeriod;
    return self;
}

-(void)incrementPeriod: (unsigned int)increment
{
    _nbCallIncrementPeriode++;
}

-(void)startBeat
{
    _nbCallStartBeat++;
}

@end
