//
//  WTSSettingCell.h
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTSSettingItem.h"
#import "WTSSettingSwitchItem.h"
#import "WTSSettingArrowItem.h"
#import "WTSSettingCheckItem.h"
#import "WTSSettingTimeItem.h"

#define MyCheckSelectionNotification @"MyCheckSelectionNotification"

@class WTSSettingItem;
@interface WTSSettingCell : UITableViewCell

/**< 数据模型 */
@property (nonatomic, strong) WTSSettingItem *item;
/**< 提供一个类方法, 创建cell, 返回值为自己,从缓存池区,要有tableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**< 用于check的选中按钮,提供背景图片 */
@property (nonatomic, weak) UIButton *myCheck;
/** Switch按钮 */
@end
