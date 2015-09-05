//
//  AppDelegate.m
//  百思不得其姐
//
//  Created by admin on 15/9/2.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "WTStabBarController.h"
#import "WTStestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    // 创建根控制器
    WTStabBarController *vc = [[WTStabBarController alloc] init];
   // WTStestViewController *vc = [[WTStestViewController alloc] init];
   // vc.view.backgroundColor = [UIColor grayColor];
    
    self.window.rootViewController = vc;
        // 显示窗口
    [self.window makeKeyAndVisible];
    WTSLogFunc;
   // NSLog(@"%zd", __LINE__);
    

    /*
    UISwitch *s  = [UISwitch appearance];
    s.onTintColor = [UIColor redColor];
#warning 这样会报错,因为s并不是真正的实例对象.
//    [s.window addSubview:s];

    
    UISwitch *s1 = [[UISwitch alloc] init];
    s1.center = CGPointMake(20, 40);
    [self.window addSubview:s1];
    
    UISwitch *s2 = [[UISwitch alloc] init];
    s1.center = CGPointMake(50 , 50);
    [self.window addSubview:s2];
     */
    
    

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
