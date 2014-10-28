//
//  AppDelegate.m
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/4.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "UserData+Helper.h"
#import "Car+Helper.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self firstLaunchInit];
    
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:[[FirstViewController alloc] init]];
    [navigationController setNavigationBarHidden:YES];
    
    self.window.rootViewController = navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)firstLaunchInit {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunch"]) {
        UserData *user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A01";
        user.userName = @"王大明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"B01";
        user.userName = @"李大媽";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A02";
        user.userName = @"李大明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A03";
        user.userName = @"李大明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A04";
        user.userName = @"李小明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A05";
        user.userName = @"李聰明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A06";
        user.userName = @"王小明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A07";
        user.userName = @"王明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A08";
        user.userName = @"小明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A09";
        user.userName = @"王一一";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"A10";
        user.userName = @"小小明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"B02";
        user.userName = @"王無明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"B03";
        user.userName = @"王明";
        
        user = [UserData newUserWithContext:self.managedObjectContext];
        user.userID = @"B04";
        user.userName = @"考明";
        
        [self.managedObjectContext save:nil];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunch"];
    }
    
    
    UserData *user = [[UserData getUserDataWithName:@"王明" WithContext:self.managedObjectContext] lastObject];
    Car *car = [Car newCarWithContext:self.managedObjectContext];
    [car setPlate:@"One"];
    [car setBelongto:user];
    [user addOwnObject:car];
    
    car = [Car newCarWithContext:self.managedObjectContext];
    [car setPlate:@"Two"];
    [car setBelongto:user];
    [user addOwnObject:car];
    
    [self.managedObjectContext save:nil];
    
    DLog(@"%d", [[user own] count]);
    
//    [self.managedObjectContext deleteObject:user];
    
//    for (Car *c in [user own]) {
        [self.managedObjectContext deleteObject:[[user own] anyObject]];
//    }
    
//    [user removeOwn:[user own]];
    [self.managedObjectContext save:nil];
    
    DLog(@"%d", [[user own] count]);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataTest" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataTest.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
