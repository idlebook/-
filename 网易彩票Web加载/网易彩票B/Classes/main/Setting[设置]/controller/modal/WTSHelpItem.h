//
//  WTSHelpItem.h
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTSHelpItem : NSObject
@property (nonatomic, copy) NSString *title; /**< 标题 */
@property (nonatomic, copy) NSString *html; /**< 网页名 */
@property (nonatomic, copy) NSString *ID; /**< 网页表示符 */

+ (instancetype)helpWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
