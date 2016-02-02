//
//  D2GContact.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GPhone.h"


@interface D2GContact : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     email;
@property (readonly, nonatomic, copy) D2GPhone*     phone;

@end