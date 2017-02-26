//
//  BaseViewController.h
//  AutoScout
//
//  Created by tegdev05 on 2/17/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "WebServices.h"
#import "Car.h"
#import "Singleton.h"
#import "CarbonSwipeRefresh.h"

@interface BaseViewController : UIViewController
{
    NSUserDefaults *userDef;
}

@property (nonatomic,strong) CarbonSwipeRefresh *refresh;

@property (nonatomic) BOOL isPullToRefresh;


-(void)showLoadingIndicator;
-(void)hideLoadingIndicator;
-(void)showError;

-(NSArray *)getFavoriteCars;
-(void)saveCarToFavoritesList:(Car *)car;
-(void)removeCarFromFavoriteList:(Car *)car;

- (void)addPullToRefresh:(UITableView *)tableView;
- (void)addPullToRefresh:(UITableView *)tableView withParentContainer:(UIView *)parentView;
@end
