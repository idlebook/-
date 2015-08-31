//
//  WTSSettingItem.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSSettingItem.h"


@implementation WTSSettingItem

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
        self.subTitle = subTitle;
        
    
    }
    return self;
}


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    return [self itemWithIcon:icon title:title subTitel:nil];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitel:(NSString *)subTitle
{
    return [[self alloc] initWithIcon:icon title:title subTitle:subTitle];

}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle{
    return [[self alloc] initWithIcon:nil title:title subTitle:subTitle];

}



@end
