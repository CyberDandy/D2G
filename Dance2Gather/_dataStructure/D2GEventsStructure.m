//
//  D2GEventsStructure.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 20/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "D2GEventsStructure.h"

#import "D2GEvent.h"
#import "D2GSubEventType.h"
#import "D2GDance.h"


@implementation D2GEventsStructure

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"totalEvents" : @"total_event",
             @"offset" : @"offset",
             @"limit" : @"limit",
             @"events" : @"events",
             @"types" : @"types",
             @"dances" : @"dances"
             };
}

+ (NSValueTransformer*)eventsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GEvent.class];
}

+ (NSValueTransformer*)typesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GSubEventType.class];
}

+ (NSValueTransformer*)dancesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GDance.class];
}

@end