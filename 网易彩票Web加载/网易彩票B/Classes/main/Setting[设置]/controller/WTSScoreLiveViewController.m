//
//  WTSScoreLiveViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSScoreLiveViewController.h"

@interface WTSScoreLiveViewController ()

@end

@implementation WTSScoreLiveViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"比分直播推送";
    
    //初始化数据源
    [self setupDataSource];
}
- (void)setupDataSource {
    [self setupGroup1];
    
    [self setupGroup2];
    
}

- (void)setupGroup1
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    WTSSettingSwitchItem *item = [WTSSettingSwitchItem itemWithIcon:nil title:@"自定义时间段"];
    // 文字必须为多选状态
    WTSSettingTimeItem *item1= [WTSSettingTimeItem itemWithIcon:nil title:@"从\n至"];
    group.headerTitle = @"xxxxx";
    item1.timeStr = @"08:00\n22:00";
    group.items = @[item, item1];
    // 添加key
    [self addItemKey:group.items];

    [self.groups addObject:group];
    
                                  
}

- (void)setupGroup2
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    group.footerTitle = @"干";
    WTSSettingSwitchItem *item = [WTSSettingSwitchItem itemWithTitle:@"24小时推送" subTitle:@"00:00-23:59"];
   
    group.items = @[item];
    // 添加key
    [self addItemKey:group.items];
    [self.groups addObject:group];
    
}

@end
