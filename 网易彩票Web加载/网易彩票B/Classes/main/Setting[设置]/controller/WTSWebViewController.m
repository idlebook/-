//
//  WTSWebViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSWebViewController.h"

@interface WTSWebViewController ()<UIWebViewDelegate>

@end

@implementation WTSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加UIWebView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    // 1>让UIWebView读取网页的内容
    //  1.1 获取文件名的路径
    NSURL *urlFielePath = [[NSBundle mainBundle] URLForResource:self.helpl.html withExtension:nil];
    //  1.2 包装成请求
    NSURLRequest *request = [NSURLRequest requestWithURL:urlFielePath];
    //  1.3 让UIWebView执行请求
    [webView loadRequest:request];
    //  1.4 定位
    webView.delegate = self;
    
    
}

#pragma mark - <网页加载完>
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 有ID,才需要执行相对应的代码
    if (self.helpl.ID) {
        NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@'",self.helpl.ID];
        //让webView执行js代码
        WTSLogE(@"%@", js);
        [webView stringByEvaluatingJavaScriptFromString:js];
    }
}


@end
