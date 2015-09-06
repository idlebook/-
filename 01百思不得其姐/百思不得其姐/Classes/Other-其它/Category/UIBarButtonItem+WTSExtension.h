//
//  UIBarButtonItem+WTSExtension.h
//  百思不得其姐
//
//  Created by admin on 15/9/4.
//  Copyright © 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WTSExtension)
+ (instancetype)itemWithNormalImage:(NSString *)normalImage highImage:(NSString *)highImage target:(id)tatget action:(SEL)action;

@end
