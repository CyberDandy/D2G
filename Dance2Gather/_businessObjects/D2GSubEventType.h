//
//  D2GSubEventType.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 26/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface D2GSubEventType : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     name;

@end
