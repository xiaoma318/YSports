//
//  Client.m
//  YSports
//
//  Created by Peiqi Zheng on 11/12/14.
//  Copyright (c) 2014 Peiqi Zheng. All rights reserved.
//

#import "Client.h"

NSString const *clientApiBaseURL = @"http://thirteenmean.corp.gq1.yahoo.com:4040";

@implementation Client

+ (Client *)instance {
    static Client *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[Client alloc] initWithBaseURL:[NSURL URLWithString:(NSString*)clientApiBaseURL]];
        //AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //securityPolicy.allowInvalidCertificates = YES;
        //instance.securityPolicy = securityPolicy;
    });
    return instance;
}

- (AFHTTPRequestOperation *)getEventListWithParamters:(NSDictionary *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    return [self GET:@"/v1/events" parameters:params success:success failure:failure];
}

- (AFHTTPRequestOperation *)createEventtWithParamters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    //self.requestSerializer = [AFJSONRequestSerializer serializer];
    //[self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    return [self POST:[@"/v1/events" stringByAppendingString:params] parameters:nil success:success failure:failure];
}

- (AFHTTPRequestOperation *)getUserEventListWithParamters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    //self.requestSerializer = [AFJSONRequestSerializer serializer];
    //[self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //self.responseSerializer = [AFJSONResponseSerializer serializer];
    return [self GET:[@"/v1/events" stringByAppendingString:params] parameters:nil success:success failure:failure];
}

- (AFHTTPRequestOperation *)joinWithParameters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    return [self GET:[@"/v1/activity" stringByAppendingString:params] parameters:nil success:success failure:failure];
}

- (AFHTTPRequestOperation *)leaveWithParameters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    return [self GET:[@"/v1/activity" stringByAppendingString:params] parameters:nil success:success failure:failure];
}

@end
