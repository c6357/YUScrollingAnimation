//
//  AnimationTableViewCell.m
//  YUScrollingAnimation
//
//  Created by HME on 16/4/6.
//  Copyright © 2016年 BruceYu. All rights reserved.
//

#import "AnimationTableViewCell.h"

@implementation AnimationTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor randomColor];
    
    int i = arc4random()%5;
    
    [self.imgView setImage:[UIImage imageNamed:ComboString(@"%@.jpg", @(i))]];
    
    self.imgView.contentMode =  UIViewContentModeScaleAspectFill;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
