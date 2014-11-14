//
//  Event.m
//  YSports
//
//  Created by Peiqi Zheng on 11/12/14.
//  Copyright (c) 2014 Peiqi Zheng. All rights reserved.
//

#import "Event.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"
#import "MTLValueTransformer.h"

@implementation Event

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"eventName": @"event_name",
             @"eventType": @"evnet_type",
             @"eventId": @"event_id",
             @"participants": @"participants",
             @"pgId": @"pg_id",
             @"startTime": @"start_time",
             @"endTime": @"end_time"
             };
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        NSDate *utcDate = [self.dateFormatter dateFromString:str];
        self.dateFormatter.timeZone = [NSTimeZone systemTimeZone];
        NSString *localDateStr = [self.dateFormatter stringFromDate:utcDate];
        return [self.dateFormatter dateFromString:localDateStr];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        NSDate *utcDate = [self.dateFormatter dateFromString:str];
        self.dateFormatter.timeZone = [NSTimeZone systemTimeZone];
        NSString *localDateStr = [self.dateFormatter stringFromDate:utcDate];
        return [self.dateFormatter dateFromString:localDateStr];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}
+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"eee MMM dd HH:mm:ss ZZZZ yyyy";
    return dateFormatter;
}

- (Event *)initFromJsonDictionary:(NSDictionary *)dict {
    Event *event = [MTLJSONAdapter modelOfClass:[Event class] fromJSONDictionary:dict error:nil];
    return event;
}

+ (NSMutableArray *)eventsWithArray:(NSArray *)array {
    NSMutableArray *events = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array) {
        Event *event = [[Event alloc] initFromJsonDictionary:dict];
        [events addObject:event];
    }
    return events;
}

@end
