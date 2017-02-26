//
//  Car.m
//  AutoScout
//
//  Created by tegdev05 on 2/21/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import "Car.h"

@implementation Car

- (NSDictionary *)rm_dataKeysForClassProperties
{
    return @{
             @"carId" : @"ID",
             @"registrationDate" : @"FirstRegistration",
             @"accidentFree": @"AccidentFree",
             @"images" : @"Images",
             @"power" : @"PowerKW",
             @"address" : @"Address",
             @"price" : @"Price",
             @"milage" : @"Mileage",
             @"make" : @"Make",
             @"fuelType" : @"FuelType",
            
             };
}

-(Class)rm_itemClassForArrayProperty:(NSString *)property {
    if ([property isEqualToString:@"Images"]) {
        return [NSString class];
    }
    
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeInt:self.carId forKey:@"carId"];
    [coder encodeObject:self.registrationDate forKey:@"registrationDate"];
    [coder encodeBool:self.accidentFree forKey:@"accidentFree"];
    [coder encodeObject:self.images forKey:@"images"];
    [coder encodeObject:self.power forKey:@"power"];
    [coder encodeObject:self.address forKey:@"address"];
    [coder encodeInt:self.price forKey:@"price"];
    [coder encodeInt:self.milage forKey:@"milage"];
    [coder encodeObject:self.make forKey:@"make"];
    [coder encodeObject:self.fuelType forKey:@"fuelType"];
   
    
}
// Decode an object from an archive
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    
    self.carId=[coder decodeIntForKey:@"carId"];
    self.registrationDate=[coder decodeObjectForKey:@"registrationDate"];
    self.accidentFree = [coder decodeBoolForKey:@"accidentFree"];
    self.images = [coder decodeObjectForKey:@"images"];
    self.power = [coder decodeObjectForKey:@"power"];
    self.address = [coder decodeObjectForKey:@"address"];
    self.price = [coder decodeIntForKey:@"price"];
    self.milage = [coder decodeIntForKey:@"milage"];
    self.make = [coder decodeObjectForKey:@"make"];
    self.fuelType = [coder decodeObjectForKey:@"fuelType"];
    
    return self;
}

@end
