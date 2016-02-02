//
//  D2GEventsStructure.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 20/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface D2GEventsStructure : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSNumber*     totalEvents;
@property (readonly, nonatomic, copy) NSNumber*     offset;
@property (readonly, nonatomic, copy) NSNumber*     limit;
@property (readonly, nonatomic, copy) NSArray*      events;
@property (readonly, nonatomic, copy) NSArray*      types;
@property (readonly, nonatomic, copy) NSArray*      dances;

@end
