//
//  Event.h
//  YSports
//
//  Created by Peiqi Zheng on 11/12/14.
//  Copyright (c) 2014 Peiqi Zheng. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface Event : MTLModel <MTLJSONSerializing>
@property (strong, nonatomic) NSString *eventName;
@property int eventType;
@property (strong, nonatomic) NSString *eventId;
@property (strong, nonatomic) NSMutableArray *participants;
@property int pgId;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;
- (Event *)initFromJsonDictionary:(NSDictionary *)dict;
+ (NSMutableArray *)eventsWithArray:(NSArray *)array;
@end
