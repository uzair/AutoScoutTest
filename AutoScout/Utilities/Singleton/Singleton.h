//
//  Singleton.h
//  AutoScout
//
//  Created by tegdev05 on 2/25/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic,retain)NSMutableArray *favoritesArray;

+ (id)sharedManager;

@end
