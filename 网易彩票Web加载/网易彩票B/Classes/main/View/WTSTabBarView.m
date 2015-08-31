//
//  WTSTabBarView.m
//  网易彩票B
//
//  Created by admin on 15/8/10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSTabBarView.h"
@implementation WTSTabBarButton
// 干掉高亮状态
- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end


@interface WTSTabBarView()
// 保存选中的按钮
@property (weak, nonatomic) UIButton *selBtn;

@end

@implementation WTSTabBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setNormalImgs:(NSArray *)normalImgs
{
    _normalImgs = normalImgs;
    for (NSString *normalImag in normalImgs) {
        WTSTabBarButton *btn = [WTSTabBarButton buttonWithType:UIButtonTypeCustom];
       // 设置正常状态下的图片
        NSString *totalNormalIm = [NSString stringWithFormat:@"%@%@", self.prefix,normalImag];
        // 是背景图片吗?????
        //[btn setImage:[UIImage imageNamed:totalNormalIm] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:totalNormalIm] forState:UIControlStateNormal];
        
        // 设置选中状态下的图片
        NSString *totaSelIm = [totalNormalIm stringByAppendingString:self.selectedSubfix];
        //[btn setImage:[UIImage imageNamed:totaSelIm] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:totaSelIm] forState:UIControlStateSelected];
        //btn.selected = YES;
        btn.tag = self.subviews.count;
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];

        [self addSubview:btn];
        
      }
}

// 实现监听的方法
- (void)btnClick:(UIButton *)btn
{
    
    // 取消上次的状态
    self.selBtn.selected = NO;
    
    // 设置当前为选中
    btn.selected = YES;
    
    // 对以前的属性赋值
    self.selBtn = btn;
    
    // 切换子控制器
    self.tabBarController.selectedIndex = btn.tag;
    NSLog(@"%ld", btn.tag);
    
    // 实现代理中的方法
//    if ([self.delegate respondsToSelector:@selector(wtsTaBar:selectdIndex:)]) {
//        [self.delegate wtsTaBar:self selectdIndex:btn.tag];
    
//    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.normalImgs.count;
    CGFloat y = 0;
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;
    for (int i = 0; i < count; i ++) {
        UIButton * btn = self.subviews[i];
        btn.frame = CGRectMake(i * btnW, y, btnW, btnH);
    }
    
}

@end
