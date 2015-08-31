//
//  网易彩票-ReadMe.m
//  网易彩票B
//
//  Created by admin on 15/8/11.
//  Copyright © 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
1> 静态cell
 1.1 组和cell的样式
 1.2 数据源方法实现,静态cell失效
 1.3 层级结构, TabBarView --> naVView -- > tableView --> wrapeVieW --> cell, cell距离wrapeVieW有35的距离,tableView 距离naVView有64 + 20的距离, 正好一个导航栏 + 状态栏的距离.
 1.4 每组的头部和尾部的距离默认为10

2> 自定义button
 2.1 在title 和 image 方法, contenRect 代表控件尺寸
 2.2 在layou布局子控件的位置
 2.3 在导航控制器的第二个控制器,添加导航栏的按钮必须要有 > .否则会添加到View中
 2.4 子控件的frame未必和父控件的frame有交集
 2.5 旋转的方法区别,make是相对原来的位置
 2.6 图片的模式.

3> 动态cell
 3.1 组的模型
 3.2 cell的模型
 3.3 cell中的数据模型

4> 设置accessView
 4.1 搞两个不同的控件
 4.2 在cell中做判断
 4.3 设置目标控制器
 4.4 copy代码

//--------------------------------------华丽的分割线-----------------------------
1> 在View中拿到控制器设置selectedIndex
 1. 在View中拿到控制器属性
 2. 在控制器设置控制器为本类,这是为了获得实例对象.
//----------------------
1.启动界面
启动界面实现有两种方式
1>"使用LaunchScreen.xib"做启动界面
2>"使用图片"做启动界面

补充：如果在网上下载比较旧的项目，运行时，如果出现顶部和尾部有多余黑色区域，原因是因为没有"启动图片"

在ios8系统上，如果有LaunchScreen.xib或者4.7、5.5的图片，应用以屏幕真实尺寸布局
在ios8系统上，如果没有LaunchScreen.xib或者4.7、5.5的图片，应用以320 * 568尺寸来布局

补充: 在ios8系统上,从"使用图片"tabBar的尺寸hight变为64,就不会压缩.

//--------------------------------------华丽的分割线-----------------------------

1.设置导航栏背景

》通过自定义导航控制器来获取导航栏
》调用导航栏的setBackground方法



[UIColor colorWithRed:244/255.0 green:240/255.0 blue:232/255.0 alpha:1]

2.设置状态栏样式(白色) 两种方法
>在控制器里实现 -preferredStatusBarStyle 方法
>使用UIApplication实现
•[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
•在要info.plist文件添加一个配置View controller-based status bar appearance = NO;
>如果有导航控制器，状态栏的样式由"导航控制器" 决定，而不是由导航控制器的"子控制器"
//--------------------------------------华丽的分割线-----------------------------
1> 导航栏的标题设置
 1.

//----------------------------华丽的分割线-------------------------------------
// 设置组与组之间的间距 怎么让组与组之间的距离为0?

