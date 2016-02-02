//
//  D2GCoordinates.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GCoordinates.h"


@implementation D2GCoordinates

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"latitude" : @"latitude",
             @"longitude" : @"longitude"
             };
}

@end
