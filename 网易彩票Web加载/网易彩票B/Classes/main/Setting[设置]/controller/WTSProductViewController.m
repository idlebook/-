//
//  WTSProductViewController.m
//  网易彩票B
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSProductViewController.h"
#import "WTSProductCellTableViewCell.h"
#import "WTSProduct.h"
#import "WTSAboutViewController.h"

@interface WTSProductViewController ()
@property (nonatomic, copy) NSMutableArray *products;
@end

@implementation WTSProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"产品推荐";
    self.tableView.rowHeight = 55;
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *)products
{
    if (!_products) {
        _products = [NSMutableArray array];
            // 把jeso数据转化为二进制数据-->转化为数组
        NSURL *jsonFilePath = [[NSBundle mainBundle] URLForResource:@"more_project.json" withExtension:nil];
        NSData *data = [NSData dataWithContentsOfURL:jsonFilePath];
        id obj = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
        WTSLogE(@"%@", obj);
        // 为了安全,做个判断
        if ([obj isKindOfClass:[NSArray class]]) {
            // 字典转模型
            for (NSDictionary *productDict in obj) {
                WTSProduct *product = [WTSProduct productWithDict:productDict];
                [_products addObject:product];
            }
        }
        return _products;
    }
    return  _products;
}

#pragma mark - Table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取cell
    WTSProductCellTableViewCell *cell = [WTSProductCellTableViewCell cellWithTableView:tableView];
    // 获取数据模型
    WTSProduct *product = self.products[indexPath.row];
    // 显示数据
    cell.product = product;
    return cell;
}
@end
