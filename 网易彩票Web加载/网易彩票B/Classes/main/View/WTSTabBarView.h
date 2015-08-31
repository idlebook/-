//
//  WTSTabBarView.h
//  网易彩票B
//
//  Created by admin on 15/8/10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTSTabBarViewController.h"
@interface WTSTabBarButton : UIButton

@end
#warning 自定义下面的tabBar
@class WTSTabBarView;
@protocol WTSTabBarDeledegate <NSObject>
- (void)wtsTaBar:(WTSTabBarView *)taBar selectdIndex:(NSInteger)selctedIndx;

@end
@interface WTSTabBarView : UIView
/**
 * 图片的前缀
 */
@property(copy,nonatomic)NSString *prefix;

/**
 * 图片选中的后缀
 */
@property(copy,nonatomic)NSString *selectedSubfix;
/**
 * 设置各个按钮的正常状态背景图片
 */
@property(strong,nonatomic)NSArray *normalImgs;

@property(weak,nonatomic)id<WTSTabBarDeledegate>  delegate;

// 拿到控制器
@property (nonatomic, weak) WTSTabBarViewController *tabBarController;



@end
