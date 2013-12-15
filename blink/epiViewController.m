//
//  epiViewController.m
//  blink
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//
// *****************************************************************************

#define START_NSTRING @"START"

// *****************************************************************************

#import "epiBlinkModel.h"

// *****************************************************************************

#import "epiViewController.h"

// *****************************************************************************

@implementation epiViewController

// -----------------------------------------------------------------------------
@synthesize buttonPlus;
@synthesize model;

// -----------------------------------------------------------------------------
-(id)initWithModel: (epiBlinkModel*)theModel
{
    self = [super init];
    self.model = theModel;
    return self;
}

// -----------------------------------------------------------------------------
- (IBAction)actionPlus:(id)sender {
    [model incrementPeriod:1];
}

// -----------------------------------------------------------------------------
- (IBAction)actionStartStop:(id)sender {
    [model startBeat];
}

// -----------------------------------------------------------------------------
-(void)beatNotificationHandle:(NSNotification*)note
{
    self.labelBlinker.highlighted = !self.labelBlinker.highlighted;
}

// -----------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// -----------------------------------------------------------------------------
-(void)initModel
{
    if (model == nil)
    {
        model = [[epiBlinkModel alloc] init];
    }
}

// -----------------------------------------------------------------------------
- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(beatNotificationHandle:)
                                                 name:@"beatNotification"
                                               object:nil];
    [super viewDidLoad];
    [self initModel];
    [self labelPeriod].text = [[NSString alloc] initWithFormat:@"%u",model.period ];
    [self buttonStartStop].titleLabel.text = START_NSTRING;
}

@end
