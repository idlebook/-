//
//  WTSTagViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/4.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSTagViewController.h"

@interface WTSTagViewController ()

@end

@implementation WTSTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的标签";
    // 重写后退按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    // 改变文字和图片的间距
    
    [backBtn sizeToFit];
#warning sizeToFit 自动调节位置,所以下面的句子都要它的后面
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backBtn addTarget:self action:@selector(BackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];

}
- (void)BackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
