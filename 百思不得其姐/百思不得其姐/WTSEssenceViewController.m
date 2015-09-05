//
//  WTSEssenceViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSEssenceViewController.h"
#import "UIBarButtonItem+WTSExtension.h"
#import "WTSTagViewController.h"

@interface WTSEssenceViewController ()

@end

@implementation WTSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.titleView = [UIImage imageNamed:@"MainTitle"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    /*
    // 左边导航栏的item
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    // 选中可以常态，高亮状态在Down才有效，up时候状态无效
    [btn setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    // 自动适应大小
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
     */
    UIBarButtonItem *btn = [UIBarButtonItem itemWithNormalImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.navigationItem.leftBarButtonItem = btn;
    
    
}
#warning 没有成为导航控制器的根控制器
- (void)tagClick
{
    WTSTagViewController *tagVc = [[WTSTagViewController alloc] init];
   // tagVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tagVc animated:YES];
}
   
@end
