//
//  WTStestViewController.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTStestViewController.h"
#import "WTSMySwich.h"

@interface WTStestViewController ()
@property (nonatomic, strong) UISwitch *mysw;

@end

@implementation WTStestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any adxditional setup after loading the view from its nib.
#warning s保存着刚创建的switch,大括号一结束就挂了
    WTSMySwich *s = [[WTSMySwich alloc] init];
    s.tag = 10;
#warning 数组保存着s,箭头指向它,不会挂
    [self.view addSubview:s];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.mysw = (UISwitch *)[self.view viewWithTag:10];
#warning 因为self.mysw  强引用着它,所以不会挂,即使移除了父控件.
    [self.mysw removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(UISegmentedControl *)sender {
    NSLog(@"%ld", (long)sender.selectedSegmentIndex);
#warning 因为现有控件,再有appearence,取不到里面的值

    UISwitch *s = [UISwitch appearance];
    switch (sender.selectedSegmentIndex) {
        case 0:
            s.onTintColor = [UIColor redColor];
            break;
        case 1:
            s.onTintColor = [UIColor yellowColor];
            break;
        case 2:
            s.onTintColor = [UIColor blackColor];
            break;
        default:
            break;
    }
    
    // 取出所有的窗口
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *window in windows) {
        // 取出窗口的所有子控件
        for (UIView *subView in window.subviews) {
            [subView  removeFromSuperview];
            [window addSubview:subView];
        }
    }
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
