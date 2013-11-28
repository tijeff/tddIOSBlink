//
//  epiBlinkModel.m
//  blink
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import "epiBlinkModel.h"

@implementation epiBlinkModel

@synthesize frequency;

-(id)init
{
    self = [super init];
    self.frequency = 10;
    return self;
}

@end
