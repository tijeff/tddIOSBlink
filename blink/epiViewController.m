//
//  epiViewController.m
//  blink
//
//  Created by jeff on 28/11/2013.
//  Copyright (c) 2013 jeff. All rights reserved.
//

#import "epiBlinkModel.h"

// Class Under Test
#import "epiViewController.h"

@implementation epiViewController

@synthesize buttonPlus;
@synthesize model;

-(id)init
{
    self = [super init];
    self.model = [[epiBlinkModel alloc] init];
    return self;
}

-(id)initWithModel: (epiBlinkModel*)theModel
{
    self = [super init];
    self.model = theModel;
    return self;
}

- (IBAction)actionPlus:(id)sender {
    [model incrementPeriod:1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
