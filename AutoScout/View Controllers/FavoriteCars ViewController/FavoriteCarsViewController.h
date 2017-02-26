//
//  FavoriteCarsViewController.h
//  AutoScout
//
//  Created by tegdev05 on 2/17/17.
//  Copyright © 2017 TEG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FavoriteCarCell.h"

@interface FavoriteCarsViewController : BaseViewController<FavoriteCarCellDelegate>

@property(nonatomic,weak) IBOutlet UITableView *tableView;

@end
