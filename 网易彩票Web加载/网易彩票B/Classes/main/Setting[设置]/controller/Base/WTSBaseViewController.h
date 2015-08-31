//
//  WTSBaseViewController.h
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTSSettingGroup.h"
#define MyCheckSelectionNotification @"MyCheckSelectionNotification"
@interface WTSBaseViewController : UITableViewController
@property (nonatomic ,strong) NSMutableArray *groups; /**< 数据源 */

-(void)addItemKey:(NSArray *)items; /**< 获得key */


@end
