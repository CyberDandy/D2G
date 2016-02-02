//
//  D2GPrice.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface D2GPrice : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     title;
@property (readonly, nonatomic, copy) NSString*     priceDescription;
@property (readonly, nonatomic, copy) NSNumber*     value;
@property (readonly, nonatomic, copy) NSString*     currency;

@end