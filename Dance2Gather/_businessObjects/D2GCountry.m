//
//  D2GCountry.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GCountry.h"


@implementation D2GCountry

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"countryId" : @"uid",
             @"name" : @"name"
             };
}

@end
