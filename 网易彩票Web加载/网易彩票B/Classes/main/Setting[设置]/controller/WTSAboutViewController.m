//
//  WTSAboutViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSAboutViewController.h"
#import "WTSAboutHeadView.h"

@interface WTSAboutViewController ()

@end

@implementation WTSAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        
        // 添加头部视图
    WTSAboutHeadView *headView = [WTSAboutHeadView headView];
    //[self.tableView addSubview:headView];
    self.tableView.tableHeaderView = headView;
    // 添加数据源
    [self setUpdataSource];
}

- (void)setUpdataSource
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    WTSSettingArrowItem *item = [WTSSettingArrowItem itemWithIcon:nil title:@"评分支持"];
    WTSSettingTimeItem *item1 = [WTSSettingTimeItem itemWithIcon:nil title:@"客服电话"];
    item1.timeStr = @"10086";
    group.items = @[item, item1];
    [self.groups addObject:group];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 打开评分
        NSString *openURL = @"http://itunes.apple.com/app/id411654863?mt=8";
        // 用应用打开
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openURL]];
        
    }else{// 打电话
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
     }
}


@end
