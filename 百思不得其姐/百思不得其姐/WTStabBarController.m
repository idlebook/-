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
    // 设置子控制器
    [self setupChildVCs];
    // 设置item
    [self setupItem];
    

    
}

/**
 *  设置子控制器
 */
- (void)setupChildVCs
{
     [self setupVC:[[WTSEssenceViewController alloc] init] normalImage:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"精华"];
     [self setupVC:[[WTSEssenceViewController alloc] init] normalImage:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" title:@"新帖"];
     [self setupVC:[[WTSEssenceViewController alloc] init] normalImage:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
     [self setupVC:[[WTSEssenceViewController alloc] init] normalImage:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" title:@"我"];
    
   
}

/**
 *  设置子控制器的具体方法
 *
 *  @return void
 */

- (void)setupVC:(UIViewController *)VC normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    // 包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    nav.view.backgroundColor = [UIColor greenColor];
    nav.tabBarItem.image = [UIImage imageNamed:normalImage];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];

}

/**
 *  设置TabBarItem属性
 */
- (void)setupItem
{
    // 设置文字不要渲染
    // 正常状态下的文字效果
    NSMutableDictionary *normalArrs = [NSMutableDictionary dictionary];
    normalArrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    normalArrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    // 选中状态下的文字效果
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    normalArrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 获取整个tabarItem
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalArrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}



@end
