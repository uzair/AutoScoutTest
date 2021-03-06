//
//  AXDataParser.h
//  AxiomBackEnd
//
//  Created by Ashraf Tawfeeq on 9/17/13.
//  Copyright (c) 2013 ASGATech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXDataParser : NSObject 
+(NSDictionary *)parseDatawithString:(NSMutableData*)data;
+ (NSDictionary *)parseData:(NSMutableData*)data;

+ (NSMutableArray *)parseAvatarsData:(NSData *)data;

+ (NSString *)parseDataApps:(NSMutableData*)data;
+ (NSMutableArray *)parseData_Array:(NSMutableData*)data;

@end
