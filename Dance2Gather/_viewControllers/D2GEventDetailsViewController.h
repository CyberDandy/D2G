//
//  D2GEventDetailsViewController.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 Dance2Gather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D2GEvent.h"

@interface D2GEventDetailsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *_eventDetailsTableView;
    D2GEvent*   _event;
    
    BOOL _isRefreshing;
}

- (instancetype)initWithEvent:(D2GEvent*)event;

@end
