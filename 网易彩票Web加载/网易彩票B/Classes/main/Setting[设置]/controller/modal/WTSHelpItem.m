
//
//  WTSHelpItem.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSHelpItem.h"

@implementation WTSHelpItem
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}

+ (instancetype)helpWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
