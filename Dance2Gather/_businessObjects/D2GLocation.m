//
//  D2GLocation.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GLocation.h"


@implementation D2GLocation

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"locationId" : @"uid",
             @"name" : @"name",
             @"address" : @"address",
             @"contact" : @"contact",
             @"type" : @"location_type",
             @"locationDescription" : @"description",
             @"access" : @"access"
             };
}

+ (NSValueTransformer*)addressJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GAddress.class];
}

+ (NSValueTransformer*)contactJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GContact.class];
}

@end
