//
//  epiViewController.h
//  blink
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "epiBlinkModel.h"

@interface epiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UILabel *labelPeriod;
@property (weak, nonatomic) IBOutlet UIButton *buttonStartStop;
@property (weak, nonatomic) IBOutlet UILabel *labelBlinker;
@property (nonatomic)epiBlinkModel * model;

@end
