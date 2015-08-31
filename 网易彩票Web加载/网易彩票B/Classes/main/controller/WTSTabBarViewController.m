//
//  WTSTabBarViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSTabBarViewController.h"
#import "WTSTabBarView.h"
//自定义TabBar按钮的实现


@interface WTSTabBarViewController ()<WTSTabBarDeledegate>

@end

@implementation WTSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    WTSLog(...);
    WTSLogE(@"这步可以执行");
    WTSLog(...);
   
    // Do any additional setup after loading the view.
    // 自定义tabBar
    WTSTabBarView *tabBar = [[WTSTabBarView alloc] init];
    tabBar.backgroundColor = [UIColor greenColor];
#warning self本身就是TabBar控制器,管理TabBar
    tabBar.frame = self.tabBar.bounds;
    
    // 设置tabBar的控制器为TabBarViewController
    tabBar.tabBarController = self;
    // 用WTSTabBarView来接收
    NSArray *imgs = @[@"LotteryHall",@"Arena",@"Discovery",@"History",@"MyLottery"];
    tabBar.prefix = @"TabBar_";
    tabBar.selectedSubfix = @"_selected";
    tabBar.normalImgs = imgs;

    [self.tabBar addSubview:tabBar];
    //tabBar.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)wtsTaBar:(WTSTabBarView *)taBar selectdIndex:(NSInteger)selctedIndx
//{
//    // 返回导航控制器的下面的每个控制器.
//    self.selectedIndex = selctedIndx;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
