//
//  D2GDateHelper.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 13/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface D2GDateHelper : NSObject

+ (NSDateFormatter*)fullDateFormatter;

+ (NSString*)jsonStringFromDate:(NSDate*)date;
+ (NSDate*)dateFromJsonString:(NSString*)jsonString;

+ (NSValueTransformer*)jsonDateTransformer;

@end
