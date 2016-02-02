//
//  D2GOrganizer.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GContact.h"


@interface D2GOrganizer : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     organizerId;
@property (readonly, nonatomic, copy) NSString*     name;
@property (readonly, nonatomic, copy) D2GContact*   contact;


@end