//
//  WTSProduct.h
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WTSProduct : NSObject
/*
 "title": "网易电视指南",
 "stitle":"手机也能看电视",
 "id": "com.netease.tvguide",
 "url": "http://itunes.apple.com/app/id480095986",
 "icon": "tvguide@2x.png",
 "customUrl": "tvguide"
 */
@property (nonatomic, copy) NSString *title; /**< 标题 */
@property (nonatomic, copy) NSString *stitle; /**< 子标题 */
@property (nonatomic, copy) NSString *ID; /**< 标示符 */
@property (nonatomic, copy) NSString *url; /**< 路径 */
@property (nonatomic, copy) NSString *icon; /**< 图片 */
@property (nonatomic, copy) NSString *customUrl; /**< 应用的scheme */

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)productWithDict:(NSDictionary *)dict;

@property (nonatomic, copy) NSString *openURL;

@property (nonatomic,assign,getter=isInstall)BOOL install; /**< 当前软件是否安装 */


@end
