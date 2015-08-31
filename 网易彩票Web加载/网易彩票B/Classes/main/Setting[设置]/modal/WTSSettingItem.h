//
//  WTSSettingItem.h
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#warning 一个cell的模型
@interface WTSSettingItem : NSObject
/**< 标题 */
@property (nonatomic, copy) NSString *title; /**< 标题 */
// 图片
@property (nonatomic, copy) NSString *icon;
/**小标题 */
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *key; /**< 保存关键字 */




@property (nonatomic, assign) Class destinationVcClass; /**< 目标控制器 */

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitel:(NSString *)subTitle;
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
