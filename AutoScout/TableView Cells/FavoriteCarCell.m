//
//  CustomCell.m
//  Auto1
//
//  Created by tegdev05 on 11/30/16.
//  Copyright © 2016 TEG. All rights reserved.
//

#import "FavoriteCarCell.h"

@interface FavoriteCarCell ()

@end

@implementation FavoriteCarCell

@synthesize car = _car;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"FavoriteCarCell" owner:self options:nil];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:cellView];
        
    }
    return self;
}


-(IBAction)favoriteButtonMethod:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(favoriteButtonPressed:)]) {
        
        [self.delegate favoriteButtonPressed:self];
    }
}

-(void)setCar:(Car *)car
{
    [priceLabel setText:[NSString stringWithFormat:@"%d",car.price]];
    [makeLabel setText:car.make];
    [milageLabel setText:[NSString stringWithFormat:@"%d",car.milage]];
    [fuelTypeLabel setText:car.fuelType];
    [carImageView setImageURL:[NSURL URLWithString:[car.images objectAtIndex:0]]];
    _car = car;
}

@end
