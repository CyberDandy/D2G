//
//  D2GEventTableViewCell.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 Dance2Gather. All rights reserved.
//

#import "CDLibrary.h"
#import "D2GEvent.h"


@interface D2GEventTableViewCell : CDLibAbstractTableViewCell
{
    __weak IBOutlet UILabel* _nameLabel;
    __weak IBOutlet UILabel* _priceLabel;
    __weak IBOutlet UILabel* _locationNameLabel;
    
}

+ (CGFloat)height;
- (void)updateWithEvent:(D2GEvent*)event;

@end