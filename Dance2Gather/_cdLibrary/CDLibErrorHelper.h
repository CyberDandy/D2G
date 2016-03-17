//
//  CDLibErrorHelper.h
//  CDLibrary
//
//  Created by Mehdi Mlala on 29/10/2015.
//  Copyright © 2015 CyberDandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Overcoat/Overcoat.h>

@interface CDLibErrorHelper : NSObject

+ (void)handleError:(NSError*)error withConnectionErrorRetryBlock:(void(^)(void))connectionErrorRetryBlock;
+ (void)handleError:(NSError*)error withBadServerResponseBlock:(void(^)(void))badServerResponseBlock andConnectionErrorRetryBlock:(void(^)(void))connectionErrorRetryBlock;
+ (void)handleError:(NSError*)error showUserMessageIfPresentInOperation:(OVCResponse *)response andConnectionErrorRetryBlock:(void (^)(void))connectionErrorRetryBlock;
+ (void)handleError:(NSError*)error showUserMessageIfPresentInOperation:(OVCResponse *)response andConnectionErrorRetryBlock:(void (^)(void))connectionErrorRetryBlock andCancelBlock:(void (^)(void))cancelBlock;
+ (void)handleError:(NSError*)error showUserMessageIfPresentInOperation:(OVCResponse *)response orDoBadServerResponseBlock:(void (^)(void))badServerResponseBlock withConnectionErrorRetryBlock:(void (^)(void))connectionErrorRetryBlock andCancelBlock:(void (^)(void))cancelBlock;

+ (UIView*)simpleErrorViewWithErrorMessage:(NSString*)errorMessage bounds:(CGRect)bounds;

@end