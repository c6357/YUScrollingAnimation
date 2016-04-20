//
//  AnimationTableViewCell.m
//  https://github.com/c6357/YUScrollingAnimation
//
//  Created by BruceYu on 16/4/6.
//  Copyright © 2016年 BruceYu. All rights reserved.
//

#import "AnimationTableViewCell.h"
#import <UIImage+YU.h>

@interface AnimationTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation AnimationTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    self.contentView.backgroundColor = [UIColor randomColor];
//    self.imgView.contentMode =  UIViewContentModeScaleAspectFit;
}

-(void)updateData:(id)data indexPath:(NSIndexPath*)indexPath{
    UIImage *img = [[UIImage imageNamed:ComboString(@"%@.jpg", @(indexPath.row%5))] croppedCenterImage:self.imgView.frame.size];
    [self.imgView setImage:img];
    [(UILabel*)[self viewWithTag:3] setText:ComboString(@"%@", @(indexPath.row+1))];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
