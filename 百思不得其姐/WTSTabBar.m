//
//  WTSTabBar.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSTabBar.h"
#define WTSTabBarW self.frame.size.width
#define WTSTabBarH  self.frame.size.height
@interface WTSTabBar()
@property (nonatomic, weak)UIButton *publishBtn;
@end

@implementation WTSTabBar
/**
 *  调用init方法会调用ini他Withframe方法
 */
- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建一个button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置正常时状态下的图片
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        // 设置选中时的图片
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        // 自动调节大小
        [btn sizeToFit];
        // 添加到父控件中
        [self addSubview:btn];
        self.publishBtn = btn;
        
    }
    return self;
}

/**
 *  布局子控件的位置
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //NSLog(@"begin");
    NSLog(@"%@", self.subviews);
    // 设置btn的位置
#warning tabBar的center相对于父控件的center.不可以直接赋值
    self.publishBtn.center = self.center;
    NSLog(@"%@", NSStringFromCGPoint(self.center));
    self.publishBtn.center = CGPointMake(WTSTabBarW * 0.5, WTSTabBarH * 0.5);
    NSLog(@"%@", NSStringFromCGPoint(self.publishBtn.center));
    //
    //设置索引
    NSInteger index = 0;
    CGFloat barButtonW = WTSTabBarW / 5;
    CGFloat barButtonH = WTSTabBarH;
    CGFloat barButtonY = 0;

    /*
   // NSLog(@"end");
    for (UIView *subView in self.subviews) {
        // 通过给一个字符串生成一个类,因为UITabBarButton不公开
        // 也可以通过把类转化为一个字符串
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            // 设置按钮的尺寸
            CGFloat barButtonW = self.frame.size.width / 5;
            CGFloat barButtonH = self.frame.size.height;
            CGFloat barButtonX = index * barButtonW;
            CGFloat barButtonY = 0;
            if (index >= 2) {
                barButtonX += barButtonW;
                            }
            subView.frame = CGRectMake(barButtonX, barButtonY, barButtonW, barButtonH);
            index ++;
        }
    }
     */
    for (UIView *subView in self.subviews) {
        if (! [NSStringFromClass(subView.class) isEqualToString:@"UITabBarButton"]) {
            // 如果不是UITabBarButton,结束本次循环
            continue;
        }
      
        CGFloat barButtonX = index * barButtonW;
               if (index >= 2) {
            barButtonX += barButtonW;
        }
        subView.frame = CGRectMake(barButtonX, barButtonY, barButtonW, barButtonH);
        index ++;

        
    }
}

@end
