//
//  D2GLoadingTableViewCell.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 17/11/2015.
//  Copyright © 2015 Dance2Gather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CDLibrary/CDLibrary.h>

@interface D2GLoadingTableViewCell : CDLibAbstractTableViewCell
{
    __weak IBOutlet UILabel*    _loadingViewLabel;
}

+ (CGFloat)height;

@end
