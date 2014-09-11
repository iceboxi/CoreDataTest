//
//  Car.h
//  CoreDataTest
//
//  Created by iceboxi Drizzt on 2014/9/10.
//  Copyright (c) 2014年 iceboxi Drizzt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserData;

@interface Car : NSManagedObject

@property (nonatomic, retain) NSString * plate;
@property (nonatomic, retain) UserData *belongto;

@end
