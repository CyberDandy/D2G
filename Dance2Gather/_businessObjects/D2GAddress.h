//
//  D2GAddress.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GCountry.h"
#import "D2GCoordinates.h"


@interface D2GAddress : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*         street;
@property (readonly, nonatomic, copy) NSString*         city;
@property (readonly, nonatomic, copy) NSString*         postCode;
@property (readonly, nonatomic, copy) NSString*         country; // change to D2GCountry later
@property (readonly, nonatomic, copy) D2GCoordinates*   coordinates;

@end