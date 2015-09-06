//
//  WTSFriendTrendsViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSFriendTrendsViewController.h"
#import "WTSLoginRegisterViewController.h"

@interface WTSFriendTrendsViewController ()

@end

@implementation WTSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";
    self.view.backgroundColor = WTSCommondColor;
    
       UIBarButtonItem *btn = [UIBarButtonItem itemWithNormalImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = btn;


}

- (void)btnClick
{
    WTSLogFunc;
}
- (IBAction)loginRegisterClick:(id)sender {
    WTSLoginRegisterViewController *loginVc = [[WTSLoginRegisterViewController alloc] init];
    [self.navigationController presentViewController:loginVc animated:YES completion:nil];
}




@end
