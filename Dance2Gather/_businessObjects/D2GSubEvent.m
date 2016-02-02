//
//  D2GSubEvent.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 05/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "D2GSubEvent.h"

#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"
#import <Mantle/MTLValueTransformer.h>

#import "D2GDateHelper.h"
#import "D2GDance.h"


@implementation D2GSubEvent

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"subEventId" : @"uid",
             @"title" : @"title",
             @"type" : @"type",
             @"subEventDescription" : @"description",
             @"startsAt" : @"start_date",
             @"endsAt" : @"end_date",
             @"createdAt" : @"creation_date",
             @"updatedAt" : @"update_date",
             @"nbLikes" : @"nb_like",
             @"nbSeen" : @"nb_seen",
             @"dances" : @"dances",
             @"teachers" : @"teachers",
             @"levels" : @"levels"
             };
}

//+ (NSValueTransformer*)typeJSONTransformer
//{
//return [MTLJSONAdapter dictionaryTransformerWithModelClass:D2GSubEventType.class];
//}

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

+ (NSValueTransformer*)dancesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:D2GDance.class];
}


@end
