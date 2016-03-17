//
//  CDLibAlertViewHelper.m
//  CDLibrary
//
//  Created by Mehdi Mlala on 02/02/2016.
//  Copyright © 2016 CyberDandy. All rights reserved.
//

#import "CDLibAlertViewHelper.h"
#import <objc/runtime.h>

@interface CDUIAlertViewWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation CDUIAlertViewWrapper

#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock)
        self.completionBlock(alertView, buttonIndex);
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView
{
    // Just simulate a cancel button click
    if (self.completionBlock)
        self.completionBlock(alertView, alertView.cancelButtonIndex);
}

@end

static const char kCDUIAlertViewWrapper;

@implementation CDLibAlertViewHelper
#pragma mark - Class Public

+ (void)showAlertView:(UIAlertView*)alertView withCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion
{
    CDUIAlertViewWrapper *alertWrapper = [[CDUIAlertViewWrapper alloc] init];
    alertWrapper.completionBlock = completion;
    alertView.delegate = alertWrapper;
    
    // Set the wrapper as an associated object
    objc_setAssociatedObject(self, &kCDUIAlertViewWrapper, alertWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // Show the alert as normal
    [alertView show];
}

@end
