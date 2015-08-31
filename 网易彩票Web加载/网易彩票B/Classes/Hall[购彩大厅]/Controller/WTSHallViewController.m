//
//  WTSHallViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/11.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSHallViewController.h"


@implementation WTSHallViewController
//
- (void)viewDidLoad
{
#warning 一定要调用父类的方法
    [super viewDidLoad];
  // 设置背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:244/255.0 green:240/255.0 blue:232/255.0 alpha:1];
 // 设置一个白色的View用于状态栏的样式
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    // 尺寸和状态栏一样大 , 应用可以拿到状态栏
    whiteView.frame = [UIApplication sharedApplication].statusBarFrame;
#warning 不添加tabview上,添加到导航控制器的view
    [self.navigationController.view addSubview:whiteView];
//    [self.tableView  addSubview:whiteView];
   // NSLog(@"%@", NSStringFromCGRect(self.tableView.frame));
    //NSLog(@"%@", NSStringFromCGRect(self.navigationController.view.frame) );

       

}
#pragma mark - Table view data source
// 有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
// 每组的cell长什么样
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"HallCell";
    // 从缓存池取,没有自动创建
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = @"WTS";
    return cell;
}
@end
