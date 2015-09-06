//
//  WTSLoginRegisterViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/5.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "WTSLoginRegisterViewController.h"

@interface WTSLoginRegisterViewController ()
/**< 设置圆角 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCons;

@end

@implementation WTSLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
    self.loginBtn.layer.cornerRadius = 5;
    // 按钮所有的都遵从圆角样式
    self.loginBtn.layer.masksToBounds = YES;
    // 或者是
    self.loginBtn.clipsToBounds = YES;
     */
    
//    // 或者使用KVC
//    [self.loginBtn setValue:@5 forKeyPath:@"layer.cornerRadius"];
//    [self.loginBtn setValue:@YES forKeyPath:@"layer.masksToBounds"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  修改状态栏的样式
 *
 *  @return 什么样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (IBAction)closeClick:(id)sender {
    //谁dismissed谁,谁就dismissed回去
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)loginBtnClick:(UIButton *)btn {
    
    if (self.leftCons.constant == 0) {
        self.leftCons.constant = -self.view.width;
        btn.selected = YES;
        
    }
    else{
        self.leftCons.constant = 0;
        btn.selected = NO;
    }
    // 做动画
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
       
}
@end
