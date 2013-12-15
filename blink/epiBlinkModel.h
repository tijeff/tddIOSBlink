//
//  epiBlinkModel.h
//  blink
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//
// *****************************************************************************

#import <Foundation/Foundation.h>

// *****************************************************************************

@interface epiBlinkModel : NSObject

// -----------------------------------------------------------------------------
@property(nonatomic, assign)unsigned int period;
@property(nonatomic, assign, readonly)bool isStarted;

// -----------------------------------------------------------------------------
-(void)decrementPeriod: (unsigned int)decrement;
-(void)incrementPeriod: (unsigned int)increment;
-(void)startBeat;
-(void)stopBeat;

@end
