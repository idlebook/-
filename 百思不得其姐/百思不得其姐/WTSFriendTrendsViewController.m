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
    
       UIBarButtonItem *btn = [UIBarButtonItem itemWithNormalImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:nil action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = btn;


}

- (void)btnClick
{
    WTSLogFunc;
}




@end
