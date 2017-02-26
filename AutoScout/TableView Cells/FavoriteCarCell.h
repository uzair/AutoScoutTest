//
//  CustomCell.h
//  Auto1
//
//  Created by tegdev05 on 11/30/16.
//  Copyright © 2016 TEG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "AsyncImageView.h"

@protocol FavoriteCarCellDelegate <NSObject>
@optional

-(void)favoriteButtonPressed:(id)sender;

@end

@interface FavoriteCarCell : UITableViewCell
{
    IBOutlet UIView *cellView;
   
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *makeLabel;
    IBOutlet UILabel *milageLabel;
    IBOutlet UILabel *fuelTypeLabel;
    IBOutlet AsyncImageView *carImageView;
    
}

@property (nonatomic,weak)IBOutlet UIButton *favouriteButton;
@property (nonatomic,assign)id <FavoriteCarCellDelegate> delegate;
@property (nonatomic,weak) Car *car;


-(IBAction)favoriteButtonMethod:(id)sender;


@end
