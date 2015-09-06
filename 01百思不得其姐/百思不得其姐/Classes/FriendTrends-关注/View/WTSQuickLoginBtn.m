//
//  WTSQuickLoginBtn.m
//  百思不得其姐
//
//  Created by admin on 15/9/5.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSQuickLoginBtn.h"

@implementation WTSQuickLoginBtn

-(void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    /*
    // 确定图片的位置
    self.imageView.centerX = self.width * 0.5;
    self.imageView.y = 0;
    
    // 确定文字的位置
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
     */
    // 调整图片的位置和尺寸
    self.imageView.y = 30;
    self.imageView.centerX = self.width * 0.5;
    
    // 调整文字的位置和尺寸
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
