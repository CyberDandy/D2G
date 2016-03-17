//
//  D2GEventDetailsViewController.m
//  Dance2Gather
//
//  Created by Mehdi Mlala on 30/08/2015.
//  Copyright (c) 2015 Dance2Gather. All rights reserved.
//

#import "CDLibrary.h"

#import "D2GEventDetailsViewController.h"
#import "D2GEventDetailsInformationCell.h"
#import "D2GEventDetailsSubEventCell.h"
#import "D2GWebClient.h"


typedef enum {
    SECTION_EVENT_INFORMATION,
    SECTION_SUB_EVENTS,
    SECTION_COUNT
} EventDetailsTableViewSection;


@implementation D2GEventDetailsViewController

- (instancetype)initWithEvent:(D2GEvent*)event {
    if (self = [super init]) {
        _event = event;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [D2GEventDetailsInformationCell registerCellInTableView:_eventDetailsTableView];
    [D2GEventDetailsSubEventCell registerCellInTableView:_eventDetailsTableView];
    
    [self _refresh];
}

- (void)_refresh {
    [self _refreshWithCompletion:nil];
}

- (void)_refreshWithCompletion:(void(^)(D2GEvent* event)) block {
    if (_isRefreshing || !(_event.eventId.length > 0))
        return;
    
    // show loading
    //    [self.view displaySpinnerActivity:YES alpha:0.8f];
    
    _isRefreshing = YES;
    
    [[D2GWebClient sharedClient] getEventWithId:_event.eventId completion:^(D2GEvent *newEvent, OVCResponse *response, NSError *error) {
        _isRefreshing = NO;
        // hide loading
        //        [self.view displaySpinnerActivity:NO];
        
        if (!error) {
            _event = newEvent;
            [_eventDetailsTableView reloadData]; // might use a more elegant way to reload the tableView later
            
            if (block) {
                block(newEvent);
            }
        }
        else if (response.HTTPResponse.statusCode == 404) { // status 404 usually means that no offer had the ID corresponding to the offer
            // Do something here
        }
        else {
            [CDLibErrorHelper handleError:error withConnectionErrorRetryBlock:^{
                [self _refreshWithCompletion:block];
            }];
        }
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case SECTION_EVENT_INFORMATION:
            return D2GEventDetailsInformationCell.height;
        case SECTION_SUB_EVENTS:
            return D2GEventDetailsSubEventCell.height;
    }
    
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SECTION_COUNT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case SECTION_EVENT_INFORMATION:
            return 1;
        case SECTION_SUB_EVENTS:
            return _event.subEvents.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDLibAbstractTableViewCell* cell;
    
    switch (indexPath.section) {
        case SECTION_EVENT_INFORMATION:
            cell = [_eventDetailsTableView dequeueReusableCellWithIdentifier:D2GEventDetailsInformationCell.reuseIdentifier forIndexPath:indexPath];
            
            if (!cell) {
                cell = D2GEventDetailsInformationCell.cell;
            }
            
            [(D2GEventDetailsInformationCell*)cell updateWithEvent:_event];
            break;
            
        case SECTION_SUB_EVENTS:
            cell = [_eventDetailsTableView dequeueReusableCellWithIdentifier:D2GEventDetailsSubEventCell.reuseIdentifier forIndexPath:indexPath];
            
            if (!cell) {
                cell = D2GEventDetailsSubEventCell.cell;
            }
            
            [(D2GEventDetailsSubEventCell*)cell updateWithSubEvent:[_event.subEvents objectAtIndex:indexPath.row]];
            
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == SECTION_SUB_EVENTS) {
#warning TODO : open new viewcontroller to show subEvent details.
    }
}


@end
