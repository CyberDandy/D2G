//
//  D2GEvent.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 26/09/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GLocation.h"


@interface D2GEvent : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     eventId;
@property (readonly, nonatomic, copy) NSString*     title;
@property (readonly, nonatomic, copy) NSString*     eventDescription;
@property (readonly, nonatomic, copy) NSDate*       startsAt;
@property (readonly, nonatomic, copy) NSDate*       endsAt;
@property (readonly, nonatomic, copy) NSDate*       createdAt;
@property (readonly, nonatomic, copy) NSDate*       updatedAt;
@property (readonly, nonatomic, copy) NSNumber*     nbLikes;
@property (readonly, nonatomic, copy) NSNumber*     nbSeen;
@property (readonly, nonatomic, copy) NSArray*      prices;
@property (readonly, nonatomic, copy) NSArray*      dances;
@property (readonly, nonatomic, copy) NSArray*      types;
@property (readonly, nonatomic, copy) NSArray*      organizers;
@property (readonly, nonatomic, copy) NSArray*      subEvents;
@property (readonly, nonatomic, copy) D2GLocation*  location;

@end
