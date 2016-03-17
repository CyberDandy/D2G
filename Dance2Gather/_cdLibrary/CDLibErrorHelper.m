//
//  CDLibErrorHelper.m
//  CDLibrary
//
//  Created by Mehdi Mlala on 29/10/2015.
//  Copyright © 2015 CyberDandy. All rights reserved.
//

#import "CDLibErrorHelper.h"
#import "CDPrivateLibrary.h"
#import <MessageUI/MessageUI.h>
#import <PureLayout/PureLayout.h>
#import "CDLibAlertViewHelper.h"

@implementation CDLibErrorHelper

+ (void)handleError:(NSError*)error withConnectionErrorRetryBlock:(void(^)(void))connectionErrorRetryBlock
{
    [self handleError:error showUserMessageIfPresentInOperation:nil orDoBadServerResponseBlock:nil withConnectionErrorRetryBlock:connectionErrorRetryBlock andCancelBlock:nil];
}

+ (void)handleError:(NSError*)error withBadServerResponseBlock:(void(^)(void))badServerResponseBlock andConnectionErrorRetryBlock:(void(^)(void))connectionErrorRetryBlock
{
    [self handleError:error showUserMessageIfPresentInOperation:nil orDoBadServerResponseBlock:badServerResponseBlock withConnectionErrorRetryBlock:connectionErrorRetryBlock andCancelBlock:nil];
}

+ (void)handleError:(NSError*)error showUserMessageIfPresentInOperation:(OVCResponse *)response andConnectionErrorRetryBlock:(void (^)(void))connectionErrorRetryBlock
{
    [self handleError:error showUserMessageIfPresentInOperation:response orDoBadServerResponseBlock:nil withConnectionErrorRetryBlock:connectionErrorRetryBlock andCancelBlock:nil];
}

+ (void)handleError:(NSError*)error showUserMessageIfPresentInOperation:(OVCResponse *)response andConnectionErrorRetryBlock:(void (^)(void))connectionErrorRetryBlock andCancelBlock:(void (^)(void))cancelBlock
{
    [self handleError:error showUserMessageIfPresentInOperation:response orDoBadServerResponseBlock:nil withConnectionErrorRetryBlock:connectionErrorRetryBlock andCancelBlock:cancelBlock];
}

+ (void)handleError:(NSError*)error showUserMessageIfPresentInOperation:(OVCResponse *)response orDoBadServerResponseBlock:(void (^)(void))badServerResponseBlock withConnectionErrorRetryBlock:(void (^)(void))connectionErrorRetryBlock andCancelBlock:(void (^)(void))cancelBlock
{
    if (error != nil)
    {
        if (error.code == NSURLErrorCancelled)
        {
            NSLog(@"WARNING : A connection has been canceled !");
            return;
        }
        
        if (error.code == NSURLErrorBadServerResponse)
        {
            NSLog(@"WARNING : The error was a bad server response, thus the data was received, but with an incorrect format.");
            
            if (response != nil)
            {
                NSString* message = [(NSDictionary*)response.rawResult objectForKey:@"userMessage"];
                
                UIAlertView* errorMessageAlertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ERROR_HELPER_ALERT_TITLE", NSStringFromClass(self.class))
                                                                                message:(message != nil ? message : NSLocalizedString(@"ERROR_HELPER_ALERT_DEFAULT_MESSAGE", NSStringFromClass(self.class)))
                                                                               delegate:nil
                                                                      cancelButtonTitle:NSLocalizedString(@"OK", NSStringFromClass(self.class))
                                                                      otherButtonTitles:NSLocalizedString(@"CONTACT_US", NSStringFromClass(self.class)), nil];
                if (message != nil || badServerResponseBlock == nil)
                {
                    [CDLibAlertViewHelper showAlertView:errorMessageAlertView withCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
                        if (buttonIndex == alertView.firstOtherButtonIndex)
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:feedback@plyce.com"]];
                    }];
                    return;
                }
            }
            
            // we arrive to this point only if we have not shown the error message - for whatever reason
            if (badServerResponseBlock != nil)
                badServerResponseBlock();
            else
                [self _showErrorAlertWithConnectionErrorRetryBlock:connectionErrorRetryBlock andCancelBlock:cancelBlock];
        }
        else
        {
            NSLog(@"WARNING : The user did retry.");
            [self _showErrorAlertWithConnectionErrorRetryBlock:connectionErrorRetryBlock andCancelBlock:cancelBlock];
        }
    }
}

+ (void)_showErrorAlertWithConnectionErrorRetryBlock:(void(^)(void))connectionErrorRetryBlock andCancelBlock:(void (^)(void))cancelBlock
{
    [self _showConnectionErrorAlertWithRetryBlock:^{
        if (connectionErrorRetryBlock != nil)
            connectionErrorRetryBlock();
    }
                                   andCancelBlock:^{
                                       if (cancelBlock != nil)
                                           cancelBlock();
                                   }];
}

+ (void)_showConnectionErrorAlertWithRetryBlock:(void(^)(void))retryBlock andCancelBlock:(void (^)(void))cancelBlock
{
    UIAlertView* connectionErrorAlertView = [[UIAlertView alloc]
                                             initWithTitle:CDLibLocalizedString(@"ALERT_VIEW_CONNECTION_ERROR_TITLE")
                                             message:CDLibLocalizedString(@"ALERT_VIEW_CONNECTION_ERROR_MESSAGE")
                                             delegate:nil
                                             cancelButtonTitle:CDLibLocalizedString(@"CANCEL")
                                             otherButtonTitles:CDLibLocalizedString(@"RETRY"), nil];
    
    [CDLibAlertViewHelper showAlertView:connectionErrorAlertView withCompletion:^(UIAlertView* alertView, NSInteger buttonIndex) {
        if (buttonIndex == connectionErrorAlertView.firstOtherButtonIndex && retryBlock != nil)
            retryBlock();
        else if (buttonIndex == connectionErrorAlertView.cancelButtonIndex && cancelBlock != nil)
            cancelBlock();
    }];
}

+ (UIView*)simpleErrorViewWithErrorMessage:(NSString*)errorMessage bounds:(CGRect)bounds
{
    UIView* emptyView = [[UIView alloc] initWithFrame:bounds];
    UILabel* emptyMessageLabel = [[UILabel alloc] initWithFrame:bounds];
    
    emptyMessageLabel.text = errorMessage;
    emptyMessageLabel.textColor = [UIColor blackColor];
    emptyMessageLabel.numberOfLines = 0;
    emptyMessageLabel.textAlignment = NSTextAlignmentCenter;
    emptyMessageLabel.font = [emptyMessageLabel.font fontWithSize:14.0f];
    [emptyView addSubview:emptyMessageLabel];
    
    [emptyMessageLabel autoCenterInSuperview];
    [emptyMessageLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:11.0f];
    [emptyMessageLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:11.0f];
    
    return emptyView;
}

@end

