//
//  WTSNavViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/5.
//  Copyright (c) 2015年 admin. All rights reserved.
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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 重写后退按钮
    if (self.childViewControllers.count >= 1) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn sizeToFit];
#warning sizeToFit 自动调节位置,所以下面的句子都要它的后面
        // 改变文字和图片的间距
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backBtn addTarget:self action:@selector(BackClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置颜色
        //viewController.view.backgroundColor = WTSCommondColor;
    }
   
    [super pushViewController:viewController animated:animated];
   
    
}

- (void)BackClick
{
    // 返回上一个界面
    [self popToRootViewControllerAnimated:YES];
}
#pragma mark - <手势的协议>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count >=1;
}



@end
