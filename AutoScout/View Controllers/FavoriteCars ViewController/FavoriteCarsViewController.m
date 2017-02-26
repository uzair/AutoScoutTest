//
//  FavoriteCarsViewController.m
//  AutoScout
//
//  Created by tegdev05 on 2/17/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import "FavoriteCarsViewController.h"


@interface FavoriteCarsViewController ()
{
    NSArray *dataArray;
}

@end

@implementation FavoriteCarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.topItem.title = @"Favorites";
    self.tabBarItem.badgeValue = nil;
    
    NSLog(@"favorites");
    dataArray = [self getFavoriteCars];
    NSLog(@"%ld",[dataArray count]);
    
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
    static NSString *cellIdentifier = @"favoriteCellIdentifier";
    
    FavoriteCarCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[FavoriteCarCell alloc] initWithStyle:UITableViewCellStyleDefault
                              reuseIdentifier:cellIdentifier];
    }
    
    Car *car = [dataArray objectAtIndex:indexPath.row];
    cell.car = car;
    cell.delegate = self;

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
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


#pragma mark - FavoriteCell Delegate

-(void)favoriteButtonPressed:(id)sender
{
    NSLog(@"delete");
    FavoriteCarCell *carCell = (FavoriteCarCell *)sender;
    [self removeCarFromFavoriteList:carCell.car];
    dataArray = [self getFavoriteCars];
    [self.tableView reloadData];
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
