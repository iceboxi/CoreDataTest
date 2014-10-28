//
//  Car+Helper.h
//  CoreDataTest
//
//  Created by iceboxi on 2014/10/28.
//  Copyright (c) 2014年 iceboxi. All rights reserved.
//

#import "Car.h"

@interface Car (Helper)

+ (Car *)newCarWithContext:(NSManagedObjectContext *)context;

@end
