//
//  D2GDance.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GDance.h"


@implementation D2GDance

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"danceId" : @"uid",
             @"name" : @"name"
             };
}

@end
