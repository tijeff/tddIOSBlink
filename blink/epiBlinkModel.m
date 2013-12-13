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

@synthesize period;
@synthesize isStarted;

-(bool)isStarted
{
    isStarted = [self->beatThread isExecuting] && ![self->beatThread isCancelled];
    return isStarted;
}

-(id)init
{
    self = [super init];
    self.period = 10;
    self->beatThread = [[NSThread alloc] initWithTarget:self
                                         selector:@selector(threadBeat)
                                           object:nil];
    return self;
}

-(void)incrementPeriod:(unsigned int)increment
{
    self.period += increment;
}

-(void)decrementPeriod:(unsigned int)decrement
{
    if (decrement>self.period)
    {
        self.period = 0;
    } else {
        self.period -= decrement;
    }
}

-(void)startBeat
{
    if (![self->beatThread isExecuting]) {
        [self->beatThread start];
    }
}

-(void)stopBeat
{
    [self->beatThread cancel];
}

-(void)threadBeat
{
    while(![self->beatThread isCancelled])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"beatNotification"
                                                            object:nil];
        sleep(self.period);
    }
}
@end
