//
//  CDLibAbstractTableViewCell.h
//  CDLibrary
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 CyberDandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDLibAbstractTableViewCell : UITableViewCell

+ (instancetype)cell;
+ (NSBundle*)bundle;
+ (NSString*)reuseIdentifier;
+ (void)registerCellInTableView:(UITableView*)tableView;
- (void)highlight:(BOOL)highlight animate:(BOOL)animate;

@end