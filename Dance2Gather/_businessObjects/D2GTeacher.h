//
//  D2GTeacher.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 11/10/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "D2GContact.h"


@interface D2GTeacher : MTLModel <MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString*     teacherId;
@property (readonly, nonatomic, copy) NSString*     firstName;
@property (readonly, nonatomic, copy) NSString*     lastName;
@property (readonly, nonatomic, copy) D2GContact*   contact;
@property (readonly, nonatomic, copy) NSArray*      dances;

@end