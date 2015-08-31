//
//  WTSSettingViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSSettingViewController.h"
#import "WTSSettingItem.h"
#import "WTSPushViewController.h"
#import "WTSProductViewController.h"
#import "WTSAboutViewController.h"
#import "WTSHelpViewController.h"

@interface WTSSettingViewController()

@end


@implementation WTSSettingViewController
- (void)viewDidLoad
{
    self.title = @"设置";
    [self setUpSetDataSouce];
   
    [super viewDidLoad];
}

- (void)setUpSetDataSouce
{
    // 第一组数据
    [self setUPDataSouceGroup1];
    // 第二组数据
    [self setUPDataSouceGroup2];
    // 第三组数据
    [self setUPDataSouceGroup3];
    
    NSLog(@"count:%ld",self.groups.count);
}

- (void)setUPDataSouceGroup1
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    WTSSettingArrowItem *item1 =[[WTSSettingArrowItem alloc] init];
    item1.icon = @"handShake";
    item1.title = @"使用兑奖码";
    group.items = @[item1];
    // 添加key
    [self addItemKey:group.items];
    [self.groups addObject:group];
}

- (void)setUPDataSouceGroup2
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    WTSSettingArrowItem *item1 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"推送和提醒"];
    // 设置目标控制器
    item1.destinationVcClass = [WTSPushViewController class];
    WTSSettingSwitchItem *item2 = [WTSSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];

    WTSSettingSwitchItem *item3= [WTSSettingSwitchItem itemWithIcon:@"handShake" title:@"声音效果"];

    WTSSettingSwitchItem *item4 = [WTSSettingSwitchItem itemWithIcon:@"handShake" title:@"圈子仅Wifi加载图片"];
    group.items = @[item1, item2, item3, item4];
    // 添加key
    [self addItemKey:group.items];
    [self.groups addObject:group];

    
    
}

- (void)setUPDataSouceGroup3
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    WTSSettingArrowItem *item1 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"推荐给朋友"];
    
   
    WTSSettingArrowItem *item2 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"产品推荐"];
     item2.destinationVcClass = [WTSProductViewController class];
    
    WTSSettingArrowItem *item3= [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"关于"];
    item3.destinationVcClass = [WTSAboutViewController class];
    
    WTSSettingArrowItem *item4 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"帮助"];
    item4.destinationVcClass = [WTSHelpViewController class];
    group.items = @[item1, item2, item3, item4];
    // 添加key
    [self addItemKey:group.items];
    [self.groups addObject:group];
}

@end


