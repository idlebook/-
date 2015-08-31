//
//  WTSProductCellTableViewCell.h
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTSProduct.h"
@interface WTSProductCellTableViewCell : UITableViewCell
+ (instancetype) cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) WTSProduct *product; /**< 数据模型 */

@end
