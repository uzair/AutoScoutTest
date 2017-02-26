//
//  CarsViewController.h
//  AutoScout
//
//  Created by tegdev05 on 2/17/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CarCell.h"

@interface CarsViewController : BaseViewController<CarCellDelegate>

@property(nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet UIView *topView;

@end
