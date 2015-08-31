//
//  WTSSettingSwitchItem.h
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSSettingItem.h"
typedef void (^SwitchChangeBlock)(BOOL Onis);
@interface WTSSettingSwitchItem : WTSSettingItem
/**< 定义一个SwitchBlock, 传递一个参数isOn */
@property (nonatomic, copy) SwitchChangeBlock switchChangeBlock;
@end

