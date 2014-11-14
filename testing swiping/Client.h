//
//  Client.h
//  YSports
//
//  Created by Peiqi Zheng on 11/12/14.
//  Copyright (c) 2014 Peiqi Zheng. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface Client : AFHTTPRequestOperationManager
+ (Client *)instance;

- (AFHTTPRequestOperation *)getEventListWithParamters:(NSDictionary *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)createEventtWithParamters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)getUserEventListWithParamters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)joinWithParameters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)leaveWithParameters:(NSString *)params withVersion:(int)version success:(void (^) (AFHTTPRequestOperation *operation, id response))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;
@end
