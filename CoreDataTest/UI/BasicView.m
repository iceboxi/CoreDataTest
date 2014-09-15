//
//  BasicView.m
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/4.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView
@synthesize tableView, searchBar;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
        tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 416)];
        
        [self addSubview:searchBar];
        [self addSubview:tableView];
        
//        [searchBar setShowsCancelButton:YES];
    }
    return self;
}

@end
