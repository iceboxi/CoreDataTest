//
//  UserData+Helper.m
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/10.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import "UserData+Helper.h"

@implementation UserData (Helper)

+ (UserData *)newUserWithContext:(NSManagedObjectContext *)context
{
    UserData *user;
    
    user = [NSEntityDescription
            insertNewObjectForEntityForName:@"UserData"
            inManagedObjectContext:context];
    
    return user;
}

+ (NSArray *)getAllUserDataWithContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"UserData"
                                   inManagedObjectContext:context];
    [fetch setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"userID" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortArray];
    
    NSArray *allUsers = [context executeFetchRequest:fetch error:nil];
    
    return allUsers;
}

+ (NSArray *)getUserDataWithName:(NSString *)name WithContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:[NSEntityDescription entityForName:@"UserData" inManagedObjectContext:context]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userName contains %@", name];
    [fetch setPredicate:predicate];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"userID" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortArray];
    
    NSArray *allUsersWithName = [context executeFetchRequest:fetch error:nil];
    
    return allUsersWithName;
}

+ (NSArray *)getUserDataWithName:(NSString *)name WithContext:(NSManagedObjectContext *)context AndModel:(NSManagedObjectModel *)model
{
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:@"fetchByName" substitutionVariables:[NSDictionary dictionaryWithObject:name forKey:@"name"]];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"userID" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortArray];
    
    NSArray *allUsersWithName = [context executeFetchRequest:fetch error:nil];
    
    return allUsersWithName;
}

@end
