//
//  WTStabBarController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTStabBarController.h"
#import "AppDelegate.h"
#import "WTSEssenceViewController.h"
#import "WTSFriendTrendsViewController.h"
#import "WTSMeViewController.h"
#import "WTSNewViewController.h"
@interface WTStabBarController ()


@end

@implementation WTStabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildVCs];
    [self setupItem];
    

    
}

/**
 *  设置子控制器
 */
- (void)setupChildVCs
{
        // 设置文字不要渲染
    // 正常状态下的文字效果
    NSMutableDictionary *normalArrs = [NSMutableDictionary dictionary];
    normalArrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    normalArrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    // 选中状态下的文字效果
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    normalArrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [vc1.tabBarItem setTitleTextAttributes:normalArrs forState:UIControlStateNormal];
    [vc1.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    [self addChildViewController:vc1];
    
    WTSNewViewController *vc2 = [[WTSNewViewController alloc] init];
    vc2.view.backgroundColor = [UIColor redColor];
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    vc2.tabBarItem.title = @"新帖";
    [vc2.tabBarItem setTitleTextAttributes:normalArrs forState:UIControlStateNormal];
    [vc2.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:vc2];
    
    WTSFriendTrendsViewController *vc3 = [[WTSFriendTrendsViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    vc3.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    vc3.tabBarItem.title = @"关注";
    [vc3.tabBarItem setTitleTextAttributes:normalArrs forState:UIControlStateNormal];
    [vc3.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:vc3];
    
    WTSMeViewController *vc4 = [[WTSMeViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    vc4.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    vc4.tabBarItem.title = @"我";
    [vc4.tabBarItem setTitleTextAttributes:normalArrs forState:UIControlStateNormal];
    [vc4.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:vc4];

    
}
/**
 *  设置子控制器的具体方法
 *
 *  @return void
 */

- (void)setupVC:(UIViewController *)VC normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    // 包装一个导航控制器
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:VC];
    vc.view.backgroundColor = [UIColor greenColor];
    vc.tabBarItem.image = [UIImage imageNamed:normalImage];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.tabBarItem.title = title;

}

/**
 *  设置TabBarItem属性
 */
- (void)setupItem
{
    
}



@end
