//
//  WTSDiscoverViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSDiscoverViewController.h"

@implementation WTSDiscoverViewController

- (void)viewDidLoad
{
    // 调整第一组和导航栏的间距
    self.tableView.contentInset = UIEdgeInsetsMake(- 35, 0, 0, 0);
    
    /*
     2015-08-12 10:39:55.375 网易彩票B[2095:24432] contentInset = {-35, 0, 0, 0}
     2015-08-12 10:39:55.375 网易彩票B[2095:24432] header 10.000000 footer 10.000000

     */
     NSLog(@"contentInset = %@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
     NSLog(@"header %lf footer %lf",self.tableView.sectionHeaderHeight,self.tableView.sectionFooterHeight);

    
    // 设置组与组之间的间距 怎么让组与组之间的距离为0?
    self.tableView.sectionHeaderHeight = 0;
//    self.tableView.sectionFooterHeight = -10;
    
    NSLog(@"header %lf footer %lf",self.tableView.sectionHeaderHeight,self.tableView.sectionFooterHeight);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"网易新闻客户端" style:UIBarButtonItemStylePlain target:self action:@selector(openNet)];
    
}
- (void)openNet
{
    //打开网易新闻
    // 1.获取网易新闻的在设备的URL 把secheme + identifier进行拼接
    NSString *secheme = @"netease";
    NSString *identifier = @"news";
//    NSString *secheme = @"http";
//    NSString *identifier = @"hao123.com";
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",secheme,identifier];
    // 把字符串的url转化为NSURL对象
    NSURL *url = [NSURL URLWithString:urlStr];
    // 用应用区打开
    [[UIApplication sharedApplication] openURL:url];
    

}

#pragma mark - <临时测试网易新闻客户端>

@end
