//
//  WTSOpenPricePusnViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSOpenPricePusnViewController.h"


@implementation WTSOpenPricePusnViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // 导航栏的标题
    self.title = @"中奖推送";
    // Do any additional setup after loading the view.
    
    // 初始化数据源
    [self setupDataSource];
}

- (void)setupDataSource {
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    
   WTSSettingSwitchItem *item1 = [WTSSettingSwitchItem itemWithTitle:@"双色球" subTitle:@"xxxxxx"];
    WTSSettingSwitchItem *item2 = [WTSSettingSwitchItem itemWithTitle:@"大乐透" subTitle:@"xxxxxx"];
    WTSSettingSwitchItem *item3 = [WTSSettingSwitchItem itemWithTitle:@"3D" subTitle:@"xxxxxx"];
    WTSSettingSwitchItem *item4 = [WTSSettingSwitchItem itemWithTitle:@"双色球" subTitle:@"xxxxxx"];
    WTSSettingSwitchItem *item5 = [WTSSettingSwitchItem itemWithTitle:@"双色球" subTitle:@"xxxxxx"];
    WTSSettingSwitchItem *item6 = [WTSSettingSwitchItem itemWithTitle:@"双色球" subTitle:@"xxxxxx"];
    WTSSettingSwitchItem *item7 = [WTSSettingSwitchItem itemWithTitle:@"双色球" subTitle:@"xxxxxx"];
    // key相同,会导致覆盖取值.因为是根据key来取值
    group.items = @[item1,item2,item3];
    // 添加key
    [self addItemKey:group.items];

    // 添加数据源
    [self.groups addObject:group];
}

@end
