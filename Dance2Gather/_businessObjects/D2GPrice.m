//
//  D2GPrice.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GPrice.h"


@implementation D2GPrice

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"title" : @"title",
             @"priceDescription" : @"description",
             @"value" : @"value",
             @"currency" : @"currency"
             };
}

@end
