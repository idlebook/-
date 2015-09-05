//
//  UIBarButtonItem+WTSExtension.m
//  百思不得其姐
//
//  Created by admin on 15/9/4.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "UIBarButtonItem+WTSExtension.h"

@implementation UIBarButtonItem (WTSExtension)
+ (instancetype)itemWithNormalImage:(NSString *)normalImage highImage:(NSString *)highImage target:(id)tatget action:(SEL)action
{
    // 左边导航栏的item
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    // 选中可以常态，高亮状态在Down才有效，up时候状态无效
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 自动适应大小
    [btn sizeToFit];
    [btn addTarget:tatget action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
    
}

@end
