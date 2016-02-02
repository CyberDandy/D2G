//
//  D2GEventTableViewCell.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 Dance2Gather. All rights reserved.
//

#import "D2GEventTableViewCell.h"

#import "D2GPrice.h"


@implementation D2GEventTableViewCell

+ (CGFloat)height
{
    static D2GEventTableViewCell* measuringCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        measuringCell = self.cell;
    });
    
    return measuringCell.bounds.size.height;
}

- (void)updateWithEvent:(D2GEvent*)event
{
    _nameLabel.text = event.title;
    D2GPrice* minPrice;
    for (D2GPrice* price in event.prices) {
        if (!minPrice || price.value < minPrice.value) {
            minPrice = price;
        }
    }
    _priceLabel.text = [NSString stringWithFormat:@"À partir de %@€", minPrice.value];
    _locationNameLabel.text = event.location.name;
}

@end
