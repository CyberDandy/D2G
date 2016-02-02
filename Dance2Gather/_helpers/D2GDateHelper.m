//
//  D2GDateHelper.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 13/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "D2GDateHelper.h"

#import <Mantle/MTLValueTransformer.h>


@implementation D2GDateHelper

+ (NSDateFormatter*)fullDateFormatter {
    static NSDateFormatter* dateFormatter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        [dateFormatter setLocale:enUSPOSIXLocale];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    });
    
    return dateFormatter;
}

+ (NSString*)jsonStringFromDate:(NSDate*)date {
    return [[self fullDateFormatter] stringFromDate:date];
}

+ (NSDate*)dateFromJsonString:(NSString*)jsonString {
    return [[self fullDateFormatter] dateFromString:jsonString];
}

+ (NSValueTransformer*)jsonDateTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [D2GDateHelper dateFromJsonString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [D2GDateHelper jsonStringFromDate:date];
    }];
}

@end
