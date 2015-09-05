//
//  WTSMeViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSMeViewController.h"

@interface WTSMeViewController ()

@end

@implementation WTSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    
    // 右导航栏的item
    UIButton *moonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moonBtn setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    // 选中可以常态，高亮状态在Down才有效，up时候状态无效
    [moonBtn setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    // 自动适应大小
    [moonBtn sizeToFit];
    [moonBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    // 选中可以常态，高亮状态在Down才有效，up时候状态无效
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    // 自动适应大小
    [settingBtn sizeToFit];
    [settingBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:settingBtn], [[UIBarButtonItem alloc] initWithCustomView:moonBtn]];

}

- (void)btnClick
{
    WTSLogFunc;
}


@end
