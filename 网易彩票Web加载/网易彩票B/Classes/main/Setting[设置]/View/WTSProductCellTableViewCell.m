//
//  WTSProductCellTableViewCell.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSProductCellTableViewCell.h"
@interface WTSProductCellTableViewCell()
@property (nonatomic, strong) UIButton *rightBtn;
@end

@implementation WTSProductCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;

}
-(void)btnClick{
    // 1.如果安装的程序，直接跳转
    if (self.product.isInstall) {
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.product.openURL]];
       
        WTSLog(...);
    }else{
        //2.打开appstore进行下载
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.product.url]];
        
    }
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ProductCell";
    
    WTSProductCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WTSProductCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

-(void)setProduct:(WTSProduct *)product{
    _product = product;
    
    // 1.显示图片
#warning 把图片的"@2x.png" 字符串去除
    self.imageView.image = [UIImage imageNamed:[product.icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""]];
    
    // 2.显示标题
    self.textLabel.text = product.title;
    
    // 3.显示子标题
    self.detailTextLabel.text = product.stitle;
    
    // 4.添加右边按钮控件
    self.accessoryView = self.rightBtn;
    // 4.1设置按钮的图片
    
    if(!product.isInstall){//如果手机没有安装此软件，显示下载图片
        [self.rightBtn setImage:[UIImage imageNamed:@"appadcell_downloadbutton"] forState:UIControlStateNormal];
    }else{//如果手机有安装此软件，显示跳转图片
        [self.rightBtn setImage:[UIImage imageNamed:@"appadcell_openbutton"] forState:UIControlStateNormal];
    }
    // 5.自动添加按钮的尺寸
    [self.rightBtn sizeToFit];
}




@end
