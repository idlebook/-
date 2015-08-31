//
//  WTSNavgationController.m
//  网易彩票B
//
//  Created by admin on 15/8/11.
//  Copyright (c) 2015年 admin. All rights reserved.
// 设置导航栏

#import "WTSNavgationController.h"
#import "WTSNavigationBar.h"


@implementation WTSNavgationController

- (void)viewDidLoad{
    // Do any additional setup after loading the view.
    //=========== 第一方法设置导航栏样式 (局部方式)==============
    // 1.获取自己的导航栏
   // NSLog(@"%s",__func__);
    //UINavigationBar *navBar = self.navigationBar;
    
    // 1.1.设置背景颜色
    /**
     * 在ios6以前，包括ios6,导航栏背景图片的高度44（标准)
     * 在ios7以后，导航栏背景图片的高度64（标准）
     */
    // 局部方式
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    //=========== 第一方法设置导航栏样式 (全局方式)==============
    // 2.1获取导航栏
    //   navBar = [UINavigationBar appearance];
    //
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
#warning 要求，设置导航栏背景图片只要调用一次
    /*
     1> 在didFinishLaunchingWithOptions执行
     2> 在导航控制器的initialize (建议在此方法实现导航栏样式设置)
     3> 自定义的导航栏样式类
     */
    // 设置导航栏
    if ([self isFirstVcController]) {
        self.navigationBarHidden = YES;
    }
    
    // 替换掉系统的导航栏
    WTSNavigationBar *NavBar = [[WTSNavigationBar alloc] init];
    // 通过KVC的方式替换
    [self setValue:NavBar forKey:@"navigationBar"];
#warning 因为大家共用一个导航器,所以要单独设置单独判断.
    /*
    if ([self isLastVcController]) {
           // WTSNavigationBar *NavBar = [[WTSNavigationBar alloc] init];
            NSMutableDictionary *titleArr2 = [NSMutableDictionary dictionary];
            titleArr2[NSForegroundColorAttributeName] = [UIColor blackColor];
            UIFont *boldFont2 = [UIFont fontWithName:@"Helvetica Bold" size:50];
            titleArr2[NSFontAttributeName] = boldFont2;
            [NavBar setTitleTextAttributes:titleArr2];
    }
     */
#warning 系统的导航栏为只读
//    self.navigationBar = NavBar;
    

}
#pragma mark 类第一次加载(使用)调用
+ (void)initialize
{
    
     // 1.获取整个的导航栏 (全局的设定)
    UINavigationBar *navBar = [UINavigationBar appearance];
    //  2.设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 3. 设置标题颜色,大小,粗体,都是富文本,用字典保存
    NSMutableDictionary *titleArr = [NSMutableDictionary dictionary];
    titleArr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    UIFont *boldFont = [UIFont fontWithName:@"Helvetica Bold" size:18];
    titleArr[NSFontAttributeName] = boldFont;
    // 4.把富文本添加到Bar
    [navBar setTitleTextAttributes:titleArr];
    // 5.设置导航栏标题item的颜色
    navBar.tintColor = [UIColor whiteColor];
    
    // 我并不需全局的设定
   
    
    


    
    
    
}
#pragma mark - <导航栏的样式应该有导航控制器控制>
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark - <设置导航栏的样式,时间是否为白色, 有没有状态栏>
// 判断是否为第一个子控制器
- (BOOL)isFirstVcController
{
    return  self == self.tabBarController.childViewControllers.firstObject;
}


- (BOOL)isLastVcController
{
    return self == self.tabBarController.childViewControllers.lastObject;
}


// 状态栏的样式
#warning 必须给每个nav绑定一个类
- (UIStatusBarStyle)preferredStatusBarStyle
{
    if ([self isFirstVcController]) {
        return UIStatusBarStyleDefault;
    }
    else{
        return UIStatusBarStyleLightContent;
    }
}

#pragma mark - <退出的时候隐藏导航栏>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // viewController即将退出的控制器
    viewController.hidesBottomBarWhenPushed = YES;
#warning 父类方法写在后面
    [super pushViewController:viewController animated:animated];
    
}

@end
