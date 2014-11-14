//
//  CalendarTableViewCell.m
//  testing swiping
//
//  Created by Cheng Ma on 11/13/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "CalendarTableViewCell.h"
#import "Utils.h"

@interface CalendarTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation CalendarTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (NSString *)identifier {
    return @"CalendarCell";
}

- (void)configureCellWithEvent:(Event *)event {
    self.nameLabel.text = event.eventName;
    self.locationLabel.text = [Utils playGroundNameForId:event.pgId];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy HH:mm";
    self.startTimeLabel.text = [dateFormatter stringFromDate:event.startTime];
    self.endTimeLabel.text = [dateFormatter stringFromDate:event.endTime];
}

@end
