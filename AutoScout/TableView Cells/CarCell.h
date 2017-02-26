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

@protocol CarCellDelegate <NSObject>
@optional

-(void)switchStateModified:(id)sender;

@end

@interface CarCell : UITableViewCell
{
    
   
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *makeLabel;
    IBOutlet UILabel *milageLabel;
    IBOutlet UILabel *fuelTypeLabel;
    IBOutlet AsyncImageView *carImageView;
    
}

@property (nonatomic,weak)IBOutlet UIView *cellView;
@property (nonatomic,weak)IBOutlet UISwitch *favouriteSwitch;
@property (nonatomic,assign)id <CarCellDelegate> delegate;
@property (nonatomic,weak) Car *car;


-(IBAction)switchStateChanged:(id)sender;


@end
