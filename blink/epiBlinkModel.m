//
//  epiBlinkModel.m
//  blink
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import "epiBlinkModel.h"

@implementation epiBlinkModel
{
    NSThread*beatThread;
}

@synthesize frequency;

-(id)init
{
    self = [super init];
    self.frequency = 10;
    self->beatThread = [[NSThread alloc] initWithTarget:self
                                         selector:@selector(threadBeat)
                                           object:nil];
    return self;
}

-(void)incrementFrequency:(unsigned int)increment
{
    self.frequency += increment;
}

-(void)decrementFrequency:(unsigned int)decrement
{
    if (decrement>self.frequency)
    {
        self.frequency = 0;
    } else {
        self.frequency -= decrement;
    }
}

-(void)startBeat
{
    if (![self->beatThread isExecuting]) {
        [self->beatThread start];
    }
}

-(void)threadBeat
{
    while(true)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"beatNotification"
                                                            object:nil];
        sleep(self.frequency);
    }
}
@end
