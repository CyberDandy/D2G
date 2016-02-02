//
//  D2GEventDetailsInformationCell.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 19/01/2016.
//  Copyright © 2016 Dance2Gather. All rights reserved.
//

#import <CDLibrary/CDLibrary.h>
#import "D2GEvent.h"

@interface D2GEventDetailsInformationCell : CDLibAbstractTableViewCell
{
    __weak IBOutlet UILabel *_titleLabel;
    
}

+ (CGFloat)height;
- (void)updateWithEvent:(D2GEvent*)event;

@end
