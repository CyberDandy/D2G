//
//  CDLibAlertViewHelper.h
//  CDLibrary
//
//  Created by Mehdi Mlala on 02/02/2016.
//  Copyright © 2016 CyberDandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CDLibAlertViewHelper : NSObject

+ (void)showAlertView:(UIAlertView*)alertView withCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;

@end