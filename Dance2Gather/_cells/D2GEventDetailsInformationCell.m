//
//  D2GEventDetailsInformationCell.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 19/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "D2GEventDetailsInformationCell.h"

@implementation D2GEventDetailsInformationCell


+ (CGFloat)height {
    static D2GEventDetailsInformationCell* measuringCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        measuringCell = self.cell;
    });
    
    return measuringCell.bounds.size.height;
}

- (void)updateWithEvent:(D2GEvent*)event {
    [self setBackgroundColor:[UIColor redColor]];
    [_titleLabel setText:event.title];
}

@end
