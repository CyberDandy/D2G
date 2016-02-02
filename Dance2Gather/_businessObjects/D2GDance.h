//
//  D2GDance.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface D2GDance : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     danceId;
@property (readonly, nonatomic, copy) NSString*     name;

@end