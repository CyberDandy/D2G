//
//  D2GSubEvent.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 05/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GSubEventType.h"


@interface D2GSubEvent : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*         subEventId;
@property (readonly, nonatomic, copy) NSString*         title;
@property (readonly, nonatomic, copy) NSString*         type; // should be of D2GSubEventType type
@property (readonly, nonatomic, copy) NSString*         subEventDescription;
@property (readonly, nonatomic, copy) NSDate*           startsAt;
@property (readonly, nonatomic, copy) NSDate*           endsAt;
@property (readonly, nonatomic, copy) NSDate*           createdAt;
@property (readonly, nonatomic, copy) NSDate*           updatedAt;
@property (readonly, nonatomic, copy) NSNumber*         nbLikes;
@property (readonly, nonatomic, copy) NSNumber*         nbSeen;
@property (readonly, nonatomic, copy) NSArray*          dances;
@property (readonly, nonatomic, copy) NSArray*          teachers;
@property (readonly, nonatomic, copy) NSArray*          levels;
@end
