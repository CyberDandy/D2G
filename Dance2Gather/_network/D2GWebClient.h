//
//  D2GWebClient.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 25/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import <Overcoat/Overcoat.h>

#import "D2GEventsStructure.h"
#import "D2GEvent.h"

@interface D2GWebClient : OVCHTTPSessionManager

+ (instancetype)sharedClient;

- (NSURLSessionDataTask*)getEventsWithOffset:(NSInteger)offset completion:(void (^)(D2GEventsStructure* newEventsStructure, OVCResponse* response, NSError* error))completion;
- (NSURLSessionDataTask*)getEventWithId:(NSString*)identifier completion:(void (^)(D2GEvent* newEvent, OVCResponse* response, NSError* error))completion;

@end
