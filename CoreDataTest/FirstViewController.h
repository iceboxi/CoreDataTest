//
//  FirstViewController.h
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/11.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>

@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, strong) NSArray *users;
@property(nonatomic, strong) UISearchDisplayController *searchDisplayController;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UISearchBar *searchBar;
@property(nonatomic, strong) NSArray *searchUsers;

@end
