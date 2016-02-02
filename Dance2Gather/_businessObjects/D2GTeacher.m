//
//  D2GTeacher.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GTeacher.h"

#import "D2GDance.h"


@implementation D2GTeacher

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"teacherId" : @"uid",
             @"fistName" : @"first_name",
             @"lastName" : @"last_name",
             @"contact" : @"contact",
             @"dances" : @"dances"
             };
}

+ (NSValueTransformer*)contactJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GContact.class];
}

+ (NSValueTransformer*)dancesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GDance.class];
}

@end
