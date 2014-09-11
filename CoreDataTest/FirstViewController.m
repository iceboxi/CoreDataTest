//
//  FirstViewController.m
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/11.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "UserData+Helper.h"
#import "BasicView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize managedObjectContext = __managedObjectContext, managedObjectModel = __managedObjectModel;
@synthesize users = _users, searchUsers = _searchUsers;
@synthesize searchDisplayController;
@synthesize tableView = __tableView, searchBar = __searchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view = [[BasicView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        
        self.tableView = [(BasicView *)(self.view) tableView];
        self.searchBar = [(BasicView *)(self.view) searchBar];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.managedObjectContext = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
        self.managedObjectModel = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectModel;
        
        self.users = [UserData getAllUserDataWithContext:self.managedObjectContext];
        self.searchUsers = nil;
        
        searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
        [searchDisplayController setDelegate:self];
        [searchDisplayController setSearchResultsDataSource:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int row = 0;
    
    if (tableView == searchDisplayController.searchResultsTableView) {
        row = [self.searchUsers count];
    } else {
        row = [self.users count];
    }
    
    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
    }
    
    if (tableView == searchDisplayController.searchResultsTableView) {
        UserData *user = (UserData *)[self.searchUsers objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:user.userName];
        [cell.detailTextLabel setText:user.userID];
    } else {
        UserData *user = (UserData *)[self.users objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:user.userName];
        [cell.detailTextLabel setText:user.userID];
    }
    
    return cell;
}

#pragma mark - search bar delegate

// 有了 searchDisplayControllerDidEndSearch 的內容好像就不需要了？
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark search display delegate

//- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
//{
//    
//}

- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    if (searchDisplayController.searchBar.text == nil || [searchDisplayController.searchBar.text isEqualToString:@""])
    {
        [self.tableView reloadData];
        self.searchUsers = nil;
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    if ([searchString length] > 0) {
//        self.searchUsers = [UserData getUserDataWithName:searchString WithContext:self.managedObjectContext];
        self.searchUsers = [UserData getUserDataWithName:searchString WithContext:self.managedObjectContext AndModel:self.managedObjectModel];
        
        return YES;
    } else {
        return NO;
    }
}

@end
