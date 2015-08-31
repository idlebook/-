//
//  WTSBaseViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSBaseViewController.h"
#import "WTSSettingCell.h"

@implementation WTSBaseViewController

- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        return self;
    }
    return self;
}

- (void)viewDidLoad
{
    // 1.初始化数据源
  
    
   
    // 设置与导航栏的距离
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    self.tableView.sectionHeaderHeight = 5;
    //    self.tableView.sectionFooterHeight = 0;
}

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

#pragma mark - Table view data source
#pragma mark 组的个数
/**< 返回多少组 */
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return self.groups.count;
//}

/**< 组的个数 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

/**< 每返回多少行 */
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取出组的模型
    WTSSettingGroup *group = self.groups[section];
    return group.items.count;
}
/**< 每行Cell长什么类型 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTSSettingCell * cell = [WTSSettingCell cellWithTableView:tableView];
    WTSSettingGroup *group = self.groups[indexPath.section];
    WTSSettingItem *item = group.items[indexPath.row];
    NSLog(@"%@",item.title);
    //NSLog(@"%@---",item.title);
    cell.item = item;
    return cell;
}

// 选中的这一行判断
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取组
    WTSSettingGroup *group = self.groups[indexPath.section];
    // 获取cell模型
    WTSSettingItem *item= group.items[indexPath.row];
    if (item.destinationVcClass) {
        // 获得实例对象
        id desVc = [[item.destinationVcClass alloc] init];
        // 用导航控制器puch过去
        [self.navigationController pushViewController:desVc animated:YES];
    }
    if ([item isKindOfClass:[WTSSettingCheckItem class]]) {
        // 获取这行的cell
        WTSSettingCell *cell = (WTSSettingCell *)[tableView cellForRowAtIndexPath:indexPath];
        cell.myCheck.selected = !cell.myCheck.selected;
        // 把cell传过去
        NSDictionary *userInfor = @{@"checkCell" : cell};
        // 发通知
        [[NSNotificationCenter defaultCenter] postNotificationName:MyCheckSelectionNotification object:nil userInfo:userInfor];
        
    }
    
}
#pragma mark - <头部标题>
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    WTSSettingGroup *group = self.groups[section];
    return group.headerTitle;
}
#pragma makr - <尾部标题>
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    WTSSettingGroup *group = self.groups[section];
    return group.footerTitle;
}

#pragma mark - <获得key>
- (void)addItemKey:(NSArray *)items
{
    for (WTSSettingItem *item in items) {
        item.key = [NSString stringWithFormat:@"%@--%@", self.title, item.title];
        WTSLogE(@"%@", item.key);
    }

}
@end
