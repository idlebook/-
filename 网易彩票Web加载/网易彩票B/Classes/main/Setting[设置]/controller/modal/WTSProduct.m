//
//  WTSProduct.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSProduct.h"

@implementation WTSProduct

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        //获取key设置懊悔
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
        NSString *openURL = [NSString stringWithFormat:@"%@://%@", self.customUrl, self.ID];
        self.openURL = openURL;
        
        
    }
    
    return self;
}
+(instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

-(BOOL)isInstall{
    // 应用已经安装
    return  [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:_openURL]];

    
}

@end
