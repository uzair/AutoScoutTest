//
//  BaseViewController.m
//  AutoScout
//
//  Created by tegdev05 on 2/17/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)showLoadingIndicator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    });
    
    [self.view setUserInteractionEnabled:YES];
}

-(void)hideLoadingIndicator{
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });

}


-(NSMutableArray *)getFavoriteCars
{
    userDef = [NSUserDefaults standardUserDefaults];
    Singleton *sharedManager = [Singleton sharedManager];
    NSData *data = [NSData dataWithData:[userDef objectForKey:@"favoritesArray"]];
    if (data) {
         sharedManager.favoritesArray = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return sharedManager.favoritesArray;
    
}

-(void)saveCarToFavoritesList:(Car *)car
{
   
    userDef = [NSUserDefaults standardUserDefaults];
    Singleton *sharedManager = [Singleton sharedManager];
    if (!sharedManager.favoritesArray)
        sharedManager.favoritesArray = [[NSMutableArray alloc] init];
    
    [sharedManager.favoritesArray addObject:car];
    
    //archive Array and serializable objects to NSData
    NSData *serializedData= [NSKeyedArchiver archivedDataWithRootObject:sharedManager.favoritesArray];
    
    [userDef setObject:serializedData forKey:@"favoritesArray"];
    [userDef synchronize];
    
    

}
-(void)removeCarFromFavoriteList:(Car *)car
{

    userDef = [NSUserDefaults standardUserDefaults];
    Singleton *sharedManager = [Singleton sharedManager];
    
    for (Car *aCar in sharedManager.favoritesArray) {
        
        if (aCar.carId == car.carId) {
            
            NSLog(@"got it delete");
            [sharedManager.favoritesArray removeObject:aCar];
            break;
            
        }
        
    }

    
        //archive Array and serializable objects to NSData
        NSData *serializedData= [NSKeyedArchiver archivedDataWithRootObject:sharedManager.favoritesArray];
    
        [userDef setObject:serializedData forKey:@"favoritesArray"];
        [userDef synchronize];
    
}


#pragma mark - Pull to
- (void)fetchFromPullToRefresh{
    
    self.isPullToRefresh = YES;
   
}


- (void)addPullToRefresh:(UITableView *)tableView{
    if (!self.refresh) {
        self.refresh = [[CarbonSwipeRefresh alloc] initWithScrollView:tableView];
        [self.refresh setMarginTop:0];
        [self.refresh setColors:[NSArray arrayWithObjects:[UIColor redColor], nil]];
        [self.view addSubview:self.refresh];
        [self.refresh addTarget:self action:@selector(fetchFromPullToRefresh) forControlEvents:UIControlEventValueChanged];
    }
    
}

- (void)addPullToRefresh:(UITableView *)tableView withParentContainer:(UIView *)parentView{
    if (!self.refresh) {
        self.refresh = [[CarbonSwipeRefresh alloc] initWithScrollView:tableView];
        [self.refresh setMarginTop:0];
        [self.refresh setColors:[NSArray arrayWithObjects:[UIColor redColor], nil]];
        [parentView insertSubview:self.refresh belowSubview:self.navigationController.navigationBar];
        [self.refresh addTarget:self action:@selector(fetchFromPullToRefresh) forControlEvents:UIControlEventValueChanged];
    }

}

-(void)showError
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"No Internet"
                                          message:@"Please make sure you are connected to internet"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   
                               }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
