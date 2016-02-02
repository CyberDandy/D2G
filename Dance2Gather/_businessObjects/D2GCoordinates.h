//
//  D2GCoordinates.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import <CoreLocation/CoreLocation.h>


@interface D2GCoordinates : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSNumber*         latitude;
@property (readonly, nonatomic, copy) NSNumber*         longitude;

@end