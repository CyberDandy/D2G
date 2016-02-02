//
//  D2GEventDetailsSubEventCell.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 19/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "D2GEventDetailsSubEventCell.h"
#import "D2GDance.h"

@implementation D2GEventDetailsSubEventCell

+ (CGFloat)height {
    static D2GEventDetailsSubEventCell* measuringCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        measuringCell = self.cell;
    });
    
    return measuringCell.bounds.size.height;
}

- (void)updateWithSubEvent:(D2GSubEvent*)subEvent {
    static NSDateFormatter* timeFormat;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timeFormat = [[NSDateFormatter alloc] init];
        [timeFormat setDateFormat:@"HH:mm:ss"];
    });
    
    // Dances' string building
    NSMutableString* dancesString = [NSMutableString string];
    for (D2GDance* dance in subEvent.dances) {
        [dancesString appendFormat:@"%@%@", (dancesString.length > 0 ? @", " : @""), dance.name];
    }
    
    // Dates' strings building
    NSString* startDateString = [timeFormat stringFromDate:subEvent.startsAt];
    NSString* endDateString = [timeFormat stringFromDate:subEvent.endsAt];
    
    NSString* title = [NSString stringWithFormat:@"%@ de %@, de %@ à %@", subEvent.type, dancesString, startDateString, endDateString];
    
    [_titleLabel setText:title];
}

@end
