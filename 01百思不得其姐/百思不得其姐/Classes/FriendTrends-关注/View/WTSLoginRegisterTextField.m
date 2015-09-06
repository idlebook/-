//
//  WTSLoginRegisterTextField.m
//  百思不得其姐
//
//  Created by admin on 15/9/5.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSLoginRegisterTextField.h"

@implementation WTSLoginRegisterTextField
- (void)awakeFromNib
{
    // 设置光标颜色
    self.tintColor = [UIColor whiteColor];
    // 设置文字颜色
    self.textColor = [UIColor whiteColor];
    // 设置占为文字的颜色(不可变)
    NSMutableDictionary *arrts = [NSMutableDictionary dictionary];
    arrts[NSForegroundColorAttributeName] = [UIColor grayColor];
    //self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:arrts];
    //[self nsmutable];
    //[self imageAndText]
    ;
}

/**
 *  当然也可以画过去
 *
 *  @param rect 占位文字的尺寸
 */
- (void)drawPlaceholderInRect:(CGRect)rect
{
    //WTSLog(@"%@", NSStringFromCGRect(rect));
    CGRect placeFrame = rect;
    placeFrame.origin.y = (self.height - self.font.lineHeight) *0.5;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    attrs[NSAttachmentAttributeName] = self.font;
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [self.placeholder drawInRect:placeFrame withAttributes:attrs];
    
}


- (void)nsmutable
{
    // 可变字符串设置占位的富文本
#warning 通过占为文字来来设置一个可变的富文本
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.placeholder attributes:nil];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(1, 1)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(2, 1)]
    ;
    self.attributedPlaceholder = attrString;
     
    
 
}

// 图文混排
- (void)imageAndText
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] init];
    
    // 拼接图片首先要把图片转化为字符串
    NSTextAttachment *string1 = [[NSTextAttachment alloc] init];
    string1.image = [UIImage imageNamed:@"login_close_icon"];
    string1.bounds = CGRectMake(0, 0, 16, 16);
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:string1];
    [attrString appendAttributedString:stringImage];
    
    // 拼接文字
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:@"大傻逼"];
    [attrString appendAttributedString:string2];
    
    self.attributedPlaceholder = attrString;
    
    
    
}
@end
