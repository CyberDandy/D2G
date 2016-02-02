//
//  D2GEventsFilterViewController.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 16/11/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GEventsFilterViewController.h"

@interface D2GEventsFilterViewController ()

@end

@implementation D2GEventsFilterViewController

- (instancetype)eventFilterViewController
{
    return [[D2GEventsFilterViewController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _toolbarTopMargin.constant = self.topLayoutGuide.length;
}

- (IBAction)clickedOnValidateBarButtonItem:(UIBarButtonItem*)barButtonItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
