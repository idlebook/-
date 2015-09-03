//
//  WTSEssenceViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSEssenceViewController.h"

@interface WTSEssenceViewController ()

@end

@implementation WTSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.titleView = [UIImage imageNamed:@"MainTitle"];
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
#warning 没有成为导航控制器的根控制器
    self.navigationItem.title = @"hahah";
    NSLog(@"%@", self.navigationItem.title);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
