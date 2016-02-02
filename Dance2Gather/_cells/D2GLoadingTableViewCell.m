//
//  D2GLoadingTableViewCell.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 17/11/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import "D2GLoadingTableViewCell.h"

@implementation D2GLoadingTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _loadingViewLabel.textColor = [UIColor blackColor];
}

+ (CGFloat)height
{
    static D2GLoadingTableViewCell* measuringCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        measuringCell = self.cell;
    });
    
    return measuringCell.frame.size.height;
}

@end
