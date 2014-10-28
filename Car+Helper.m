//
//  Car+Helper.m
//  CoreDataTest
//
//  Created by iceboxi on 2014/10/28.
//  Copyright (c) 2014年 iceboxi. All rights reserved.
//

#import "Car+Helper.h"

@implementation Car (Helper)

+ (Car *)newCarWithContext:(NSManagedObjectContext *)context
{
    Car *car;
    
    car = [NSEntityDescription
            insertNewObjectForEntityForName:@"Car"
            inManagedObjectContext:context];
    
    return car;
}

@end
