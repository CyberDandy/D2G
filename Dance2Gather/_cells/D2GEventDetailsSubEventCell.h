//
//  D2GEventDetailsSubEventCell.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 19/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import "CDLibrary.h"
#import "D2GSubEvent.h"

@interface D2GEventDetailsSubEventCell : CDLibAbstractTableViewCell
{
    __weak IBOutlet UILabel *_titleLabel;
    
}

+ (CGFloat)height;
- (void)updateWithSubEvent:(D2GSubEvent*)subEvent;

@end
