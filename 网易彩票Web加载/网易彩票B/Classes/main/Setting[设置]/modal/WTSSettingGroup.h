//
//  WTSSettingGroup.h
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTSSettingSwitchItem.h"
#import "WTSSettingArrowItem.h"
#import "WTSSettingItem.h"
#import "WTSSettingCheckItem.h"
#import "WTSSettingTimeItem.h"


@interface WTSSettingGroup : NSObject

/**< 头部标题 */
@property (nonatomic, copy) NSString *headerTitle;
/**< 尾部标题 */
@property (nonatomic, copy) NSString *footerTitle;

// 一组的模型
@property (nonatomic, strong) NSArray *items; /** 里面存必须是WTSSettingitem类型的对象*/

@end
