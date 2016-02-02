//
//  D2GEventsFilterViewController.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 16/11/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D2GEventsFilterViewController : UIViewController
{
    __weak IBOutlet UIToolbar*          _toolbar;
    __weak IBOutlet UIBarButtonItem*    _validateBarButtonItem;
    __weak IBOutlet NSLayoutConstraint* _toolbarTopMargin;
    
}

- (IBAction)clickedOnValidateBarButtonItem:(UIBarButtonItem*)barButtonItem;

@end
