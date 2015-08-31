//
//  WTSTitleButton.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSTitleButton.h"
@interface WTSTitleButton()

@end


@implementation WTSTitleButton
#warning 必须返回一个CGRect
// 修改文字和图片的间距
#define XMGImgW 20 //图片宽度
/*
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // contenRect 就是按钮的尺寸
//    NSLog(@"%@", NSStr`ingFromCGRect(contentRect));
    CGFloat titleW = contentRect.size.width - XMGImgW;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGRect titleFrame = CGRectMake(titleX, titleY, titleW, titleH);
    return titleFrame;

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = XMGImgW;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - XMGImgW;
    CGFloat imageY = 0;
    CGRect imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
    return  imageFrame;
}
 */

//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        self.titleLabel.backgroundColor = [UIColor purpleColor];
//        self.imageView.backgroundColor = [UIColor blueColor];
//    }
//    
//    return self;
//}

#pragma mark  从storyboard、xib加载的对象，不会调用initWithFrame方法，只会调用initWithCoder方法
#warning 使用场景:文字随系统的中间对齐, imageView自定义.
#warning layout,这个方法不知道是否能否比它先调用,导致位置错误.
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        //self.titleLabel.backgroundColor = [UIColor purpleColor];
        //self.imageView.backgroundColor = [UIColor blueColor];
        /*
        // 自己添加图片
        UIImageView *arroView = [[UIImageView alloc] init];
        arroView.image = [UIImage imageNamed:@"YellowDownArrow"];
        self.arrowImgView = arroView;
        [self addSubview:arroView];
        NSLog(@"%s",__func__);
         */
        
        
    }
    
    return self;

}
#warning 在已知的图片的尺寸,进行位置的调换
#warning xib加载完成之后
- (void)awakeFromNib
{
    UIImageView *arroView = [[UIImageView alloc] init];
    arroView.image = [UIImage imageNamed:@"YellowDownArrow"];
    self.arrowImgView = arroView;
    //self.backgroundColor = [UIColor orangeColor];
    //self.titleLabel.backgroundColor = [UIColor redColor];
    //self.imageView.backgroundColor = [UIColor blackColor];
#warning 图片的模式让让正常显示>
    self.imageView.contentMode = UIViewContentModeCenter;
#warning 选择没有背景的状态,当然不会显示.
    [self setBackgroundImage:[UIImage imageNamed:@"navTitleSel"] forState:UIControlStateSelected];
    [self addSubview:arroView];
    NSLog(@"%s",__func__);

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    /*
    // lable 的位置
    CGFloat titleW = self.frame.size.width - XMGImgW;
    CGFloat titleH = self.frame.size.height;
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGRect titleFrame = CGRectMake(titleX, titleY, titleW, titleH);
    self.titleLabel.frame = titleFrame;
   
    
    // 图片的位置
    CGFloat imageW = XMGImgW;
    CGFloat imageH = self.frame.size.height;
    CGFloat imageX = self.frame.size.width- XMGImgW;
    CGFloat imageY = 0;
    CGRect imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
    self.imageView.frame = imageFrame;
     */
    
   /*
    // 实现图片和文字的交换
    CGRect imageFrame = self.imageView.frame;
    // 只需要修改文字的X得到值
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.x = imageFrame.origin.x;
    self.titleLabel.frame = titleFrame;
    // 图片的位置
    imageFrame.origin.x = CGRectGetMaxX(self.titleLabel.frame);
    self.imageView.frame = imageFrame;
    NSLog(@"%s",__func__);
   */
   
  
  
//-----------------------------第三种方法------------------
    
    //设置箭头的frm
    CGRect titelFrm = self.titleLabel.frame;
    CGFloat arrowX = CGRectGetMaxX(titelFrm);
    CGFloat arrowY = titelFrm.origin.y;
    CGFloat arrowH = titelFrm.size.height;
    CGFloat arrowW = arrowH;
    self.arrowImgView.frame = CGRectMake(arrowX, arrowY, arrowW, arrowH);


}
@end
