//
//  Singleton.m
//  AutoScout
//
//  Created by tegdev05 on 2/25/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (id)sharedManager {
    static Singleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
      
    });
    return sharedMyManager;
}


@end
