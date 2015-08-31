//
//  WTSNoticePrizePushViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSNoticePrizePushViewController.h"
#import "WTSSettingCell.h"
@interface WTSNoticePrizePushViewController()
@property (nonatomic, strong) WTSSettingGroup *group2;
@end
@implementation WTSNoticePrizePushViewController
- (void)viewDidLoad
{
    [self setupDataSource];
    self.title = @"推送和提醒";
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.tableView.sectionHeaderHeight = 5;

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
    // 预选开关到block
    __weak typeof(self) weakVc = self;

    item.switchChangeBlock = ^(BOOL isOn){
        if (isOn) {
            [weakVc.groups addObject:weakVc.group2];
        }else{
            [weakVc.groups removeObject:weakVc.group2];
        }
#warning 刷新也要弱引用
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
    NSLog(@"%s", __func__);
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


#pragma mark - <设置数据>
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 调用父类的方法,拿到cell
    WTSSettingCell *cell = (WTSSettingCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    // 监听开关
    if (indexPath.section == 0) {
        [cell.switchView addTarget:self action:@selector(mySwitchChange:) forControlEvents:UIControlEventValueChanged ];
    }
    return cell;
}
*/

- (void)mySwitchChange:(UISwitch *)mySw
{
    if (mySw.isOn) {
        [self.groups addObject:self.group2];
    }else{
        [self.groups removeObject:self.group2];
    }
    [self.tableView reloadData];
    
}

@end
