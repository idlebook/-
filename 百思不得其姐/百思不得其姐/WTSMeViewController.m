//
//  WTSMeViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSMeViewController.h"
#import "WTSSettingViewController.h"

@interface WTSMeViewController ()

@end

@implementation WTSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    
    
    // 设置右边的按钮
    UIBarButtonItem *btn = [UIBarButtonItem itemWithNormalImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    UIBarButtonItem *btn2 = [UIBarButtonItem itemWithNormalImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[btn2, btn];

  }
- (void)moonClick
{
    
}

- (void)settingClick
{
    WTSSettingViewController *settingVc = [[WTSSettingViewController alloc] init];
    // 这个是push到导航控制器的时候隐藏tabar
    //settingVc.navigationController.hidesBottomBarWhenPushed = YES;
    // 隐藏tabBar
    settingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVc animated:YES];
}




@end
