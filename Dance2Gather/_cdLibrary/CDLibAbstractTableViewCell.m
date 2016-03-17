//
//  CDLibAbstractTableViewCell.m
//  CDLibrary
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 CyberDandy. All rights reserved.
//

#import "CDLibAbstractTableViewCell.h"

// Define a macro for the functions that are abstract
#define _ABSTRACT_METHOD {\
[self doesNotRecognizeSelector:_cmd]; \
__builtin_unreachable(); \
}

@implementation CDLibAbstractTableViewCell

+ (instancetype)cell
{
    return [[[self bundle] loadNibNamed:[self reuseIdentifier] owner:self options:nil] firstObject];
}

+ (NSBundle*)bundle
{
    return [NSBundle mainBundle];
}

+ (NSString*)reuseIdentifier
{
    return NSStringFromClass(self.class);
}

+ (void)registerCellInCollectionView:(UICollectionView*)collectionView
{
    [collectionView registerNib:self.cellNib forCellWithReuseIdentifier:self.reuseIdentifier];
}

+ (void)registerCellInTableView:(UITableView *)tableView
{
    [tableView registerNib:self.cellNib forCellReuseIdentifier:self.reuseIdentifier];
}

+ (UINib*)cellNib
{
    return [UINib nibWithNibName:self.reuseIdentifier bundle:[self bundle]];
}

- (void(^)(void))highlightFinalValue
{
    // override to change the cell's appearance when highlighted
    return nil;
}

- (void(^)(void))unhighlightFinalValue
{
    // override to change the cell's appearance when unhighlighted
    return nil;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    [self highlight:highlighted animate:YES];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self highlight:highlighted animate:YES];
}

// This function should never be overriden
- (void)highlight:(BOOL)highlight animate:(BOOL)animate
{
    void (^finalValue)(void) = highlight ? self.highlightFinalValue : self.unhighlightFinalValue;
    
    if (finalValue != nil)
        [UIView animateWithDuration:(animate ? (highlight ? 0.3f : 0.2f) : 0.0f)
                                  delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState|(highlight ? UIViewAnimationCurveEaseIn : UIViewAnimationCurveEaseOut)
                             animations:finalValue
                             completion:nil];
}

@end
