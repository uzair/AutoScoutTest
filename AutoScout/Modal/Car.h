//
//  Car.h
//  AutoScout
//
//  Created by tegdev05 on 2/21/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAModelBase.h"
#import "RMMapper.h"

@interface Car : NSObject <RMMapping,NSCoding>
{

    
}

@property(nonatomic,readwrite) int carId;
@property(nonatomic,retain) NSString *registrationDate;
@property(nonatomic,readwrite) BOOL accidentFree;
@property(nonatomic,retain) NSArray *images;
@property(nonatomic,retain) NSString *power;
@property(nonatomic,retain) NSString *address;
@property(nonatomic,readwrite) int price;
@property(nonatomic,readwrite) int milage;
@property(nonatomic,retain) NSString *make;
@property(nonatomic,retain) NSString *fuelType;



@end
