//
//  ViewController.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 Dance2Gather. All rights reserved.
//

#import "CDLibrary.h"
#import "D2GEventsViewController.h"
#import "D2GEventTableViewCell.h"
#import "D2GLoadingTableViewCell.h"
#import "D2GEventDetailsViewController.h"
#import "D2GEventsFilterViewController.h"
#import "D2GWebClient.h"


typedef enum {
    SECTION_EVENTS,
    SECTION_LOAD_MORE,
    SECTION_COUNT
} EventsTableViewSection;

@implementation D2GEventsViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [D2GEventTableViewCell registerCellInTableView:_eventsTableView];
    [D2GLoadingTableViewCell registerCellInTableView:_eventsTableView];
    
    self.title = @"Liste des évènements";
    
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl setBackgroundColor:[UIColor lightGrayColor]];
    [_refreshControl setTintColor:[UIColor whiteColor]];
    [_refreshControl addTarget:self
                        action:@selector(_refresh)
              forControlEvents:UIControlEventValueChanged];
    [_eventsTableView addSubview:_refreshControl];
    
    _loadingView.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _refresh];
}

- (void)_refresh
{
    [self _load:0];
}

- (void)_loadMore
{
    _loadingMoreEvents = YES;
    [self _load:_events.count];
}

-(void)_load:(NSUInteger)offset
{
    [[D2GWebClient sharedClient] getEventsWithOffset:offset completion:^(D2GEventsStructure *newEventsStructure, OVCResponse* response, NSError *error) {
        [_refreshControl endRefreshing];
        _loadingView.hidden = YES;
        
        if (!error)
        {
            NSMutableArray* updatedEvents = offset > 0 && _events != nil ? _events.mutableCopy : NSMutableArray.array;
            [updatedEvents addObjectsFromArray:newEventsStructure.events];
            _events = updatedEvents;
            _eventsTotalCount = newEventsStructure.totalEvents.unsignedIntegerValue;
            
            // Say that we have finished loading more events
            _loadingMoreEvents = NO;
            
            [_eventsTableView reloadData]; // should be improved by adding and removing the events with animations
        }
        else
        {
            [CDLibErrorHelper handleError:error withConnectionErrorRetryBlock:^{
                [self _refresh];
            }];
        }
    }];
}

- (BOOL)_hasMoreEvents
{
    return _eventsTotalCount > _events.count;
}

- (IBAction)clickedOnFilterButton:(UIBarButtonItem *)sender
{
    [self.navigationController presentViewController:[[D2GEventsFilterViewController alloc] init] animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case SECTION_EVENTS:
            return D2GEventTableViewCell.height;
        case SECTION_LOAD_MORE:
            return D2GLoadingTableViewCell.height;
    }
    
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_events.count > 0) {
        [tableView setBackgroundView:nil];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
        return SECTION_COUNT - (self._hasMoreEvents ? 0 : 1);
    }
    
    static UILabel* emptyListLabel;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        emptyListLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height)];
        [emptyListLabel setText:@"Aucun évenement ne correspond à votre recherche"];
        [emptyListLabel setNumberOfLines:0];
        [emptyListLabel setTextAlignment:NSTextAlignmentCenter];
        [emptyListLabel setFont:[UIFont italicSystemFontOfSize:14]];
        [emptyListLabel sizeToFit];
    });
    
    [tableView setBackgroundView:emptyListLabel];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case SECTION_EVENTS:
            return _events.count;
        case SECTION_LOAD_MORE:
            return (self._hasMoreEvents ? 1 : 0);
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDLibAbstractTableViewCell* cell;
    
    switch (indexPath.section) {
        case SECTION_EVENTS:
            cell = [_eventsTableView dequeueReusableCellWithIdentifier:D2GEventTableViewCell.reuseIdentifier forIndexPath:indexPath];
            
            if (!cell) {
                cell = D2GEventTableViewCell.cell;
            }
            
            [(D2GEventTableViewCell*)cell updateWithEvent:[_events objectAtIndex:indexPath.row]];
            break;
            
        case SECTION_LOAD_MORE:
            cell = [_eventsTableView dequeueReusableCellWithIdentifier:D2GLoadingTableViewCell.reuseIdentifier forIndexPath:indexPath];
            
            if (!cell) {
                cell = D2GLoadingTableViewCell.cell;
            }
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == SECTION_EVENTS) {
        [self.navigationController pushViewController:[[D2GEventDetailsViewController alloc] initWithEvent:[_events objectAtIndex:indexPath.row]] animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_events.count > 0) {
        NSIndexPath* lastCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
        CGRect rectOfLastCellInTableView = [_eventsTableView rectForRowAtIndexPath:lastCellIndexPath];
        BOOL scrolledPassTheLastCell = _eventsTableView.contentOffset.y +  _eventsTableView.bounds.size.height > rectOfLastCellInTableView.origin.y + rectOfLastCellInTableView.size.height;
        
        if (scrolledPassTheLastCell && self._hasMoreEvents && !_loadingMoreEvents) {
            [self _loadMore];
        }
    }
}


@end
