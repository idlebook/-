//
//  WTSBuytogetherController.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSBuytogetherController.h"
#import "WTSTitleButton.h"

@implementation WTSBuytogetherController
- (IBAction)titleButtonClick:(WTSTitleButton *)btn {
    // 设置选择状态
//    btn.selected = !btn.selected;
    // 选择180度
    [UIView animateWithDuration:1 animations:^{
        // 设置选择状态
        btn.selected = !btn.selected;
        btn.arrowImgView.transform = CGAffineTransformRotate(btn.arrowImgView.transform, M_PI);
        NSLog(@"%s",__func__);
    }];
    }
    


@end
