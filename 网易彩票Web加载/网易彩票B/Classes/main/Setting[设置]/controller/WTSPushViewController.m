//
//  WTSPushViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSPushViewController.h"
#import "WTSSettingGroup.h"
#import "WTSOpenPricePusnViewController.h"
#import "WTSNoticePrizePushViewController.h"
#import "WTSPrizeAnimationViewController.h"
#import "WTSScoreLiveViewController.h"
#import "WTSProductViewController.h"


@interface WTSPushViewController()

@end

@implementation WTSPushViewController


- (void)viewDidLoad
{
    [self setUpPushDataSouce];
}
- (void)setUpPushDataSouce
{

    // 第一组数据
    [self setUPDataSouceGroup3];
    
    NSLog(@"count:%ld",self.groups.count);
}

- (void)setUPDataSouceGroup3
{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    WTSSettingArrowItem *item1 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"推送提醒"];
    item1.destinationVcClass = [WTSNoticePrizePushViewController class];
    WTSSettingArrowItem *item2 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"中奖推送Push"];
    item2.destinationVcClass = [WTSOpenPricePusnViewController class];
    
    WTSSettingArrowItem *item3= [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"比分直播"];
    item3.destinationVcClass = [WTSScoreLiveViewController class];
    
    WTSSettingArrowItem *item4 = [WTSSettingArrowItem itemWithIcon:@"handShake" title:@"中奖动画"];
    item4.destinationVcClass = [WTSPrizeAnimationViewController class];
    group.items = @[item1, item2, item3, item4];
    [self.groups addObject:group];
}



@end
