//
//  WTSFriendTrendsViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSFriendTrendsViewController.h"

@interface WTSFriendTrendsViewController ()

@end

@implementation WTSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";
    
    // 左边导航栏的item
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    // 选中可以常态，高亮状态在Down才有效，up时候状态无效
    [btn setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    // 自动适应大小
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

}

- (void)btnClick
{
    WTSLogFunc;
}




@end
