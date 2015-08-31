//
//  WTSHelpViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSHelpViewController.h"
#import "WTSHelpItem.h"
#import "WTSWebViewController.h"

@interface WTSHelpViewController ()
// 数据源
@property (nonatomic, strong) NSMutableArray *helps;

@end

@implementation WTSHelpViewController

- (NSMutableArray *)helps
{
    if (!_helps) {
        _helps = [NSMutableArray array];
        // 1.加载json数据
        //  1.1 转化为二进制数据
        NSURL *urlFilePath = [[NSBundle mainBundle] URLForResource:@"help.json" withExtension:nil] ;
        NSData *data = [NSData dataWithContentsOfURL:urlFilePath];
        //  1.2 转化为数组
        id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        // 数组转模型, 为了安全起见, 做个判断
        if ([obj isKindOfClass:[NSArray class]]) {
            for (NSDictionary *helpDict in obj) {
                WTSHelpItem *help = [WTSHelpItem helpWithDict:helpDict];
                [_helps addObject:help];

            }
        }
    }
    return _helps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帮助";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.helps.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"helpCell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        // 显示箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    // 取出数据模型
    WTSHelpItem *help = self.helps[indexPath.row];
    cell.textLabel.text = help.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTSWebViewController *webVc = [[WTSWebViewController alloc] init];
    // 设置数据
    webVc.helpl = self.helps[indexPath.row];
    
    [self.navigationController pushViewController:webVc animated:YES];
}

@end
