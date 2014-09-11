//
//  UserData+Helper.h
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/10.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import "UserData.h"

@interface UserData (Helper)

+ (UserData *)newUserWithContext:(NSManagedObjectContext *)context;
+ (NSArray *)getAllUserDataWithContext:(NSManagedObjectContext *)context;
+ (NSArray *)getUserDataWithName:(NSString *)name WithContext:(NSManagedObjectContext *)context;
+ (NSArray *)getUserDataWithName:(NSString *)name WithContext:(NSManagedObjectContext *)context AndModel:(NSManagedObjectModel *)model;

@end
