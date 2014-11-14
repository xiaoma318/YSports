//
//  Utils.m
//  YSports
//
//  Created by Peiqi Zheng on 11/12/14.
//  Copyright (c) 2014 Peiqi Zheng. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (NSString *)playGroundNameForId:(int) pgID {
    switch (pgID) {
        case 0:
            return @"Basketball Court";
            break;
        case 1:
            return @"Volleyball Court Outer";
            break;
        case 2:
            return @"Volleyball Court Inner";
            break;
        default:
            return @"Basketball Court";
            break;
    }
}

+ (NSString *)eventTypeForId:(int) typeID {
    switch (typeID) {
        case 0:
            return @"Basketball";
            break;
        case 1:
            return @"Soccer";
            break;
        case 2:
            return @"Volleyball";
            break;
        case 3:
            return @"Cricket";
            break;
        case 4:
            return @"Boot Camp";
            break;
        default:
            return @"Basketball";
            break;
    }
}
@end
