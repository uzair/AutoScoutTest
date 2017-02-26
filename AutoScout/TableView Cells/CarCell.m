//
//  CustomCell.m
//  Auto1
//
//  Created by tegdev05 on 11/30/16.
//  Copyright © 2016 TEG. All rights reserved.
//

#import "CarCell.h"

@interface CarCell ()

@end

@implementation CarCell

@synthesize car = _car;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"CarCell" owner:self options:nil];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor clearColor];
        
      //  [cellView setFrame:CGRectMake(0.0, 0.0, cellView.frame.size.width, cellView.frame.size.height)];
        
        [self.contentView addSubview:self.cellView];
        
    }
    return self;
}


-(IBAction)switchStateChanged:(id)sender
{
    NSLog(@"%@",[self class]);
    NSLog(@"here");
    
    if ([self.delegate respondsToSelector:@selector(switchStateModified:)]) {
        
        [self.delegate switchStateModified:self];
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
