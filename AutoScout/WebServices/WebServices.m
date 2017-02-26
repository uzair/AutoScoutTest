//
//  WebServices.m
//  BeaconReceiver
//
//  Created by Mahmoud Nasr on 5/24/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "WebServices.h"
#import "AXInternetConnection.h"
#import "AXDataParser.h"
#import "Car.h"
#import "RMMapper.h"


#define SERVICEURL  "http://sumamo.de/iOS-TechChallange/api/index/make=all.json"

@implementation WebServices


-(void)getCars {
    
    if (![AXInternetConnection getStatus]) {
        [self.delegate webservicesFail:@"connectionError"];
        return;
    }

    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@SERVICEURL]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               if ([data length] > 0){
                                   
                                   NSDictionary* parsedData = [AXDataParser parseData:(NSMutableData *)data];
                                   
                                   NSArray *array = [RMMapper arrayOfClass:[Car class] fromArrayOfDictionary:[parsedData objectForKey:@"vehicles"]];
                                
                                   
                                   [self.delegate webservicesSucess :array];
                               }
                               else {
                                   
                                   [self.delegate webservicesFail:@"connectionError"];
                                   
                               }
                               
                           }];
    
}




@end
