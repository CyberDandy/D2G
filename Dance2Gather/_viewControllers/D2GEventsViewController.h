//
//  ViewController.h
//  Dance2Gather
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 Dance2Gather. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D2GEventsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView*        _eventsTableView;
    __weak IBOutlet UIBarButtonItem*    _filterBarButtonItem;
    __weak IBOutlet UIView*             _loadingView;
    
    NSArray*                            _events;
    NSUInteger                          _eventsTotalCount;
    BOOL                                _loadingMoreEvents;
    UIRefreshControl*                   _refreshControl;
}

- (IBAction)clickedOnFilterButton:(UIBarButtonItem*)sender;

@end

