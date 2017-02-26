//
//  CarsViewController.m
//  AutoScout
//
//  Created by tegdev05 on 2/17/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import "CarsViewController.h"
#import "Car.h"
#import "AppDelegate.h"
#import "Singleton.h"

@interface CarsViewController ()
{
    NSArray *dataArray;
    WebServices *webService;
    Singleton *sharedManager;
    UITabBarItem *favoriteTabBarItem;
}

@end

@implementation CarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0);


    [self addPullToRefresh:self.tableView withParentContainer:self.topView];
      [self showLoadingIndicator];
    webService = [[WebServices alloc] init];
    webService.delegate = self;
    [webService getCars];
    


    
}


-(void)stop:(id)sender
{
    [self hideLoadingIndicator];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.topItem.title = @"Cars";
    
    sharedManager = [Singleton sharedManager];
    sharedManager.favoritesArray = (NSMutableArray *)[self getFavoriteCars];
    favoriteTabBarItem = [self.tabBarController.tabBar.items objectAtIndex:1];
    favoriteTabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[sharedManager.favoritesArray count]];
    [self.tableView reloadData];

    
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  [dataArray count];    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"customCellIdentifier";
    
    CarCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[CarCell alloc] initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:cellIdentifier];
    }
    
    Car *car = [dataArray objectAtIndex:indexPath.row];
    cell.car = car;
    cell.delegate = self;

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"carId == %d",car.carId];
    NSArray *filteredArray = [sharedManager.favoritesArray filteredArrayUsingPredicate:predicate];
    if  ([filteredArray count]>0) {
        cell.favouriteSwitch.on = YES;
    }
    
    else {
    cell.favouriteSwitch.on = NO;
    }
    
    if (!car.accidentFree) {
        
        [cell.cellView setBackgroundColor:[UIColor lightGrayColor]];
        cell.favouriteSwitch.userInteractionEnabled = NO;
    }
    
    else {
        [cell.cellView setBackgroundColor:[UIColor whiteColor]];
        cell.favouriteSwitch.userInteractionEnabled = YES;
    }


    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}



#pragma mark - WebService Delegate

- (void) webservicesSucess :(NSArray*)result
{

 
    dispatch_async(dispatch_get_main_queue(), ^{
           [self.refresh endRefreshing];
        dataArray = result;
        [self hideLoadingIndicator];
        [self.tableView reloadData];
        
    });
    
    

    
}
-(void)webservicesFail : (NSString *) error
{
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [self.refresh endRefreshing];
        [self hideLoadingIndicator];
        [self showError];

    });
}

#pragma mark - CarCell Delegate

-(void)switchStateModified:(id)sender
{
    CarCell *carCell = (CarCell *)sender;
    NSLog(@"%d",carCell.car.price);
    
    if (carCell.favouriteSwitch.isOn) {
        
        if (carCell.car.accidentFree) {
            
        [self saveCarToFavoritesList:carCell.car];
            
        favoriteTabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[sharedManager.favoritesArray count]];
        }

    }
    
    else {
        NSLog(@"remove");
        [self removeCarFromFavoriteList:carCell.car];
        
        favoriteTabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[sharedManager.favoritesArray count]];
    }
}

#pragma mark - Pull to Reresh

-(void)fetchFromPullToRefresh
{
    NSLog(@"fetchFromPullToRefresh");
    [self showLoadingIndicator];
    [webService getCars];
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
