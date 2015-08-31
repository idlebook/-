//
//  WTSAboutHeadView.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSAboutHeadView.h"

@implementation WTSAboutHeadView
+ (instancetype)headView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WTSAboutHeadView" owner:nil options:nil] lastObject];
}

@end
