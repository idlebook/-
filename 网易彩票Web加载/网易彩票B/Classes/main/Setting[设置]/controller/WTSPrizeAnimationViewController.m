//
//  WTSPrizeAnimationViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/14.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSPrizeAnimationViewController.h"

@interface WTSPrizeAnimationViewController ()
@property (nonatomic, strong) WTSSettingGroup *group2;

@end

@implementation WTSPrizeAnimationViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"中奖动画";
    [self setupDataSource];
    
}
- (void)setupDataSource
{
   
    // 先执行第二行代码
    [self setupGroup2];
    [self setupGroup1];
    
}
-(void)setupGroup1{
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    
    WTSSettingSwitchItem *item = [WTSSettingSwitchItem itemWithIcon:nil title:@"中奖推送"];
#warning 添加一个弱引用
    __weak typeof(self) weakVc = self;
    // 预选开关到block  这是监听用户的行为之后改变的值,如果是读取状态后,并不会调用Block,这段只是声明
    item.switchChangeBlock = ^(BOOL isOn){
        if (isOn) {
            [weakVc.groups addObject:weakVc.group2];
        }else{
            [weakVc.groups removeObject:weakVc.group2];
        }
        [weakVc.tableView reloadData];
        
    };
    // 设置尾部标题
    group.footerTitle = @"xxxxxxxxxxxxxxxx";
    group.items = @[item];
    // 添加key
    [self addItemKey:group.items];
    
    [self.groups addObject:group];
    // 如果用户偏好设置的 "中奖动画" 的开关为YES,需要把第二组数据添加到数据源
    if ([[NSUserDefaults standardUserDefaults] boolForKey:item.key]) {
        [self.groups addObject:self.group2];
    }

    
}
- (void)dealloc
{
    //NSLog(@"%s", __func__);
}
-(void)setupGroup2{
    
    WTSSettingGroup *group = [[WTSSettingGroup alloc] init];
    
    // 头部标题
    group.headerTitle = @"干";
    
    WTSSettingCheckItem *item1 = [WTSSettingCheckItem itemWithIcon:nil title:@"全部彩种"];
    WTSSettingCheckItem *item2 = [WTSSettingCheckItem itemWithIcon:nil title:@"高频彩以外的彩种"];
    group.items = @[item1,item2];
    
    // 添加key
    [self addItemKey:group.items];

    self.group2 = group;
    
    //[self.groups addObject:group];
    
}


@end
