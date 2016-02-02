//
//  D2GOrganizer.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GOrganizer.h"


@implementation D2GOrganizer

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"organizerId" : @"uid",
             @"name" : @"name",
             @"contact" : @"contact"
             };
}

+ (NSValueTransformer*)contactJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GContact.class];
}


@end
