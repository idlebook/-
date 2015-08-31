//
//  WTSSettingCell.m
//  网易彩票B
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "WTSSettingCell.h"


@interface WTSSettingCell()
@property (nonatomic, strong) UIImageView  *arrowImageView;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *myTimeLable;
@end

@implementation WTSSettingCell

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowImageView;

    
}

- (UISwitch *)switchView
{
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
        [self.switchView addTarget:self action:@selector(mySwitchChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
- (UILabel *)myTimeLable
{
    if (!_myTimeLable) {
        _myTimeLable = [[UILabel alloc] init];
        self.myTimeLable.backgroundColor = [UIColor lightGrayColor];
        self.myTimeLable.numberOfLines = 0;
    }
    return _myTimeLable;
}
#pragma mark - <开关的触发事件>
- (void)mySwitchChange:(UISwitch *)mSwitch
{
    if([self.item isKindOfClass:[WTSSettingSwitchItem class]])
    {
        WTSSettingSwitchItem *SW = (WTSSettingSwitchItem *)self.item;
#warning 有block的值,才需要调用
        if (SW.switchChangeBlock) {
            SW.switchChangeBlock(mSwitch.isOn);
        }
        
    }
    // 1.每次开关的改变,都需要保存开关的状态
    // 1.1 获取用户的偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:mSwitch.isOn forKey:self.item.key];
    // 1.2 同步
    [defaults synchronize];
    
    
    
}

- (UIButton *)myCheck
{
    if (!_myCheck) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor grayColor];
        [btn setImage:[UIImage imageNamed:@"awardAnimCheckMark"] forState:UIControlStateSelected];
        //[btn setBackgroundImage:[UIImage imageNamed:@"ArenaHall_QuanziLogo"] forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        _myCheck = btn;
    }
    return _myCheck;
}
// 在按钮也可以切换选中状态.
- (void)btnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SettingCell";
    // 从缓存池区
    WTSSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WTSSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        // 设置cell可以换行
        cell.textLabel.numberOfLines = 0;
    }
    return cell;
}

#warning 改了变量名,还要set方法
-(void)setItem:(WTSSettingItem *)item
{
    // 显示数据
    _item = item;
#warning 有图片才需要设置
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;

    if ([item isKindOfClass:[WTSSettingArrowItem class]]) {
        self.accessoryView = self.arrowImageView;
        // 箭头的选中效果
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    if([item isKindOfClass:[WTSSettingSwitchItem class]]){
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 设置开关的读取状态
        self.switchView.on = [[NSUserDefaults standardUserDefaults] boolForKey:self.item.key];
    }
    if ([item isKindOfClass:[WTSSettingCheckItem class]]) {
        self.accessoryView = self.myCheck;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 设置勾选状态
        self.myCheck.selected = [[NSUserDefaults standardUserDefaults] boolForKey:self.item.key];
        // 发布通知
        [self addNotiCation];
        
        
    }
    if ([item isKindOfClass:[WTSSettingTimeItem class]]) {
        self.accessoryView = self.arrowImageView;
        // 设置时间的text
        WTSSettingTimeItem *timeItem = (WTSSettingTimeItem *)item;
        self.myTimeLable.text = timeItem.timeStr;
        // 自动计算尺寸
        [self.myTimeLable sizeToFit];
        [self.contentView addSubview:self.myTimeLable];
        
        
    }
    
    
    
}
// 布局mylable的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 获取箭头的中心位置
    CGPoint center = self.arrowImageView.center;
    // 更改x的值
    center.x -= self.myTimeLable.bounds.size.width * 0.8;
    self.myTimeLable.center = center;
    
    
}
#pragma mark - <通知的相关>
// 接受通知
- (void)addNotiCation
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(check:) name:MyCheckSelectionNotification object:nil];
}

// 对象销毁之前移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)check:(NSNotification *)userInfor
{
    // 接受字典的cell
//    NSLog(@"%@接受到了通知", userInfor.userInfo[@"checkCell"] );
    NSLog(@"%@ 接收到通知",self.item.title);

    
    WTSSettingCell *cell = userInfor.userInfo[@"checkCell"];
    // 判断当前的cell
    if (self != cell) {
        self.myCheck.selected = NO;
    }
    
    // 保存勾选状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.myCheck.selected forKey:self.item.key];
    // 更新
    [defaults synchronize];
}
@end
