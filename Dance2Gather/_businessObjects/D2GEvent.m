//
//  D2GEvent.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 26/09/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//


#import "D2GEvent.h"

#import "D2GDateHelper.h"
#import "D2GPrice.h"
#import "D2GDance.h"
#import "D2GSubEventType.h"
#import "D2GOrganizer.h"
#import "D2GSubEvent.h"


@implementation D2GEvent

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"eventId" : @"uid",
             @"title" : @"title",
             @"eventDescription" : @"description",
             @"startsAt" : @"start_date",
             @"endsAt" : @"end_date",
             @"createdAt" : @"creation_date",
             @"updatedAt" : @"update_date",
             @"nbLikes" : @"nb_like",
             @"nbSeen" : @"nb_seen",
             @"prices" : @"prices",
             @"dances" : @"dances",
             @"types" : @"types",
             @"organizers" : @"organizers",
             @"subEvents" : @"sub_events",
             @"location" : @"location"
             };
}

+ (NSValueTransformer*)startsAtJSONTransformer
{
    return [D2GDateHelper jsonDateTransformer];
}

+ (NSValueTransformer*)endsAtJSONTransformer
{
    return [D2GDateHelper jsonDateTransformer];
}

+ (NSValueTransformer*)createdAtJSONTransformer
{
    return [D2GDateHelper jsonDateTransformer];
}

+ (NSValueTransformer*)updatedAtJSONTransformer
{
    return [D2GDateHelper jsonDateTransformer];
}

+ (NSValueTransformer*)pricesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GPrice.class];
}

+ (NSValueTransformer*)dancesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GDance.class];
}

+ (NSValueTransformer*)typesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GSubEventType.class];
}

+ (NSValueTransformer*)organizersJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GOrganizer.class];
}

+ (NSValueTransformer*)subEventsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GSubEvent.class];
}

+ (NSValueTransformer*)locationJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GLocation.class];
}

@end
