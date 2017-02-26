//
//  WebServices.h
//  BeaconReceiver
//
//  Created by Mahmoud Nasr on 5/24/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol WebServicesDelegation <NSObject>

@optional

- (void) webservicesSucess :(NSArray*)result;
-(void)webservicesFail : (NSString *) error;

@end

@interface WebServices : NSObject
{

    id <WebServicesDelegation> _delegate;
    
}
@property (nonatomic,strong) id delegate;

-(void)getCars;


@end
