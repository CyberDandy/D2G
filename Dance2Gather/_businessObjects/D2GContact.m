//
//  D2GContact.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GContact.h"


@implementation D2GContact

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"email" : @"email",
             @"phone" : @"phone"
             };
}

+ (NSValueTransformer*)phoneJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GPhone.class];
}

@end
