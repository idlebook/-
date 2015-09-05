//
//  WTSNavViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/5.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSNavViewController.h"

@interface WTSNavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation WTSNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 遵守手势的协议
    self.interactivePopGestureRecognizer.delegate = self;
}
/**
 *  拦截所有push过来的控制器
 *
 *  @param viewController push到哪个控制器
 *  @param animated       是否有动画
 */
- (void)pushViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated
{
    // 当第二个控制器的时候才需要设置返回
    if (self.childViewControllers.count >= 1) {
        // 重写后退按钮
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn sizeToFit];
#warning sizeToFit 自动调节位置,所以下面的句子都要它的后面
        // 改变整个button的间距
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backBtn addTarget:self action:@selector(BackClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        // 隐藏tabba
        viewController.hidesBottomBarWhenPushed = YES;
    }
   
    // 为什么不是这个
    //    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
#warning 当调用push,就会调用Viewload,一般来说,先整体设置,后个性化设置
    [super pushViewController:viewController animated:animated];

}

- (void)BackClick
{
    [self popToRootViewControllerAnimated:YES];
}

#pragma mark - <手势返回>
/**
 *  当用户触发[返回手势]时调用
 *
 *
 *  @return yes 代表有效,否则无效
 */
- (BOOL)gestureRecognizerShouldBegin:(nonnull UIGestureRecognizer *)gestureRecognizer
{
//    if (self.childViewControllers.count == 1) return NO;
//    return YES;
    // 当子控制器 > 1时,触发手势有效
    return self.childViewControllers.count > 1; return YES;
}

@end
