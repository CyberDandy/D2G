//
//  D2GPhone.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface D2GPhone : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     phone;

@end