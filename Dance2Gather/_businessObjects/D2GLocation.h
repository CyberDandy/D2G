//
//  D2GLocation.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GAddress.h"
#import "D2GContact.h"


@interface D2GLocation : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     locationId;
@property (readonly, nonatomic, copy) NSString*     name;
@property (readonly, nonatomic, copy) D2GAddress*   address;
@property (readonly, nonatomic, copy) D2GContact*   contact;
@property (readonly, nonatomic, copy) NSString*     access;
@property (readonly, nonatomic, copy) NSString*     type;
@property (readonly, nonatomic, copy) NSString*     locationDescription;

@end