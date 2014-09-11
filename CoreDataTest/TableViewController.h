//
//  TableViewController.h
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/5.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, strong) NSArray *users;

@end
