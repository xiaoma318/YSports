//
//  CalendarTableViewCell.h
//  testing swiping
//
//  Created by Cheng Ma on 11/13/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface CalendarTableViewCell : UITableViewCell
+ (NSString *)identifier;
- (void)configureCellWithEvent:(Event *)event;
@end
