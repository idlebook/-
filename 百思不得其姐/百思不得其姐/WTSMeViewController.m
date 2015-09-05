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
    
    
    
    UIBarButtonItem *btn = [UIBarButtonItem itemWithNormalImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(btnClick)];
    UIBarButtonItem *btn2 = [UIBarButtonItem itemWithNormalImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(btnClick)];
    self.navigationItem.rightBarButtonItems = @[btn, btn2];

   

  }

- (void)btnClick
{
    WTSLogFunc;
}


@end
