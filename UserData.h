//
//  UserData.h
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/10.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Car;

@interface UserData : NSManagedObject

@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSSet *own;
@end

@interface UserData (CoreDataGeneratedAccessors)

- (void)addOwnObject:(Car *)value;
- (void)removeOwnObject:(Car *)value;
- (void)addOwn:(NSSet *)values;
- (void)removeOwn:(NSSet *)values;

@end
