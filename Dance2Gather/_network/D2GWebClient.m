//
//  D2GWebClient.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 25/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "D2GWebClient.h"

//API BASE URL
static NSString *const API_BASE_URL = @"http://ec2-52-48-125-122.eu-west-1.compute.amazonaws.com:8080/api/";

//API URL PATHS
static NSString *const API_URL_EVENTS = @"events";
static NSString *const API_URL_EVENT = @"events/%@";

//API PARAMS NAME
static NSString *const API_PARAMS_OFFSET = @"offset";
static NSString *const API_PARAMS_LIMIT = @"limit";
static NSString *const API_PARAMS_DATE = @"from_date";

// API CONSTANTS
static NSUInteger const API_CONSTANT_LIMIT = 20;


@implementation D2GWebClient

+ (instancetype)sharedClient {
    static D2GWebClient* client;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[D2GWebClient alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
    });
    
    return client;
}

+ (NSDictionary *)modelClassesByResourcePath {
    return @{
             API_URL_EVENTS : [D2GEventsStructure class],
             [NSString stringWithFormat:API_URL_EVENT, @"*"] : [D2GEvent class]
             };
}

- (NSURLSessionDataTask*)getEventsWithOffset:(NSInteger)offset completion:(void (^)(D2GEventsStructure* newEventsStructure, OVCResponse* response, NSError* error))completion {
#warning TODO : change this to make the date flexible !
    NSDictionary* params = @{
                             API_PARAMS_OFFSET : @(offset),
                             API_PARAMS_LIMIT : @(API_CONSTANT_LIMIT),
                             API_PARAMS_DATE : @"2015"
                             };
    
    return [self GET:API_URL_EVENTS
          parameters:params
          completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
              if (completion) {
                  completion([self isResultOfClass:response.resultClass forResponse:response] ? response.result : nil, response, error);
              }
          }];
}

- (NSURLSessionDataTask*)getEventWithId:(NSString*)identifier completion:(void (^)(D2GEvent* newEvent, OVCResponse* response, NSError* error))completion {
    return [self GET:[NSString stringWithFormat:API_URL_EVENT, identifier]
          parameters:nil
          completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
              if (completion) {
                  completion([self isResultOfClass:response.resultClass forResponse:response] ? response.result : nil, response, error);
              }
          }];
}

- (BOOL)isResultOfClass:(Class)class forResponse:(OVCResponse*)response {
    return [response.result isKindOfClass:class];
}


@end
