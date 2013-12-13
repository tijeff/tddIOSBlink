//
//  mockBlinkModel.h
//  blink
//
//  Created by jeff on 11/12/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import "epiBlinkModel.h"

@interface mockBlinkModel : epiBlinkModel

@property unsigned int nbCallIncrementPeriode;
@property unsigned int nbCallStartBeat;

-(id)initWithPeriod:(unsigned int)thePeriod;
-(void)incrementPeriod: (unsigned int)increment;
-(void)startBeat;

@end
