//
//  D2GAddress.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GAddress.h"


@implementation D2GAddress

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"street" : @"street",
             @"postCode" : @"postal_code",
             @"city" : @"town",
             @"country" : @"country",
             @"coordinates" : @"coordinates"
             };
}

//+ (NSValueTransformer*)countryJSONTransformer
//{
//return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GCountry.class];
//}

+ (NSValueTransformer*)coordinatesJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GCoordinates.class];
}

@end
