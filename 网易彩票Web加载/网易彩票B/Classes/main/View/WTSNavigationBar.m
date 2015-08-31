//
//  WTSNavigationBar.m
//  网易彩票B
//
//  Created by admin on 15/8/11.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSNavigationBar.h"
#import "WTSNavigationRightButton.h"
#import "WTSNavigationLeftButton.h"
#import "WTSTitleButton.h"

@implementation WTSNavigationBar

// 布局子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置左右两个button的位置的margin为8
    CGFloat margin = 8;
    for (UIButton * subView in self.subviews) {
        if ([subView isKindOfClass:[WTSNavigationLeftButton class]]) {
            //获取左边控件的frame
            CGRect leftFrame = subView.frame;
            leftFrame.origin.x = margin;
            subView.frame = leftFrame;
        }
        else if ([subView isKindOfClass:[WTSNavigationRightButton class]]){
            // 获取右边的控件
            CGRect rightFrame = subView.frame;
            rightFrame.origin.x = self.frame.size.width - margin - subView.frame.size.width;
            subView.frame = rightFrame;
    }
        // 发现中的全部彩种按钮的位置
        /*
        else if ([subView isKindOfClass:[WTSTitleButton class]]){
            CGRect rightFrame = subView.frame;
            rightFrame.origin.x = self.frame.size.width - margin - subView.frame.size.width;
            subView.frame = rightFrame;
        }
         */
    }
}
@end
