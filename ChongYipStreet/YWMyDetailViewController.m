//
//  YWMyDetailViewController.m
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMyDetailViewController.h"
#import "YWLoginHeadDetailView.h"
#import "YWMyDetailTableViewCell.h"

@interface YWMyDetailViewController ()<UITableViewDataSource, UITableViewDelegate, YWLoginHeadDetailViewDelegate, YWMyDetailTableViewCellDelegate>

@end

@implementation YWMyDetailViewController
{
    YWLoginHeadDetailView   *_headView;
    UITableView             *_tableView;
    NSArray                 *_images;
    NSArray                 *_titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.contents = [UIImage imageNamed:@"5.png"];
    _images = @[@"", @"", @"", @"", @"", @""];
    _titles = @[@"我的资料", @"我的等级", @"我的手机", @"qq", @"微信", @"微博"];
    
    [self createSubViews];
}

- (void)createSubViews {
    _headView = [[YWLoginHeadDetailView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 180)];
    _headView.delegate = self;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = SeparatorColor;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.tableHeaderView = _headView;
    _tableView.showsVerticalScrollIndicator = NO;
    //    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
}

#pragma mark - YWMyDetailTableViewCellDelegate
- (void)myDetailTableViewCell:(YWMyDetailTableViewCell *)view didSelectItemWithIndex:(NSInteger)index {
    NSLog(@"点击了第%ld", index);
}

#pragma mark - YWLoginHeadDetailViewDelegate
- (void)loginHeadDetailViewDidSelectBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loginHeadDetailViewDidSelectAccount {
    NSLog(@"点击了账号信息");
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section?1:6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
        cell.textLabel.text = _titles[indexPath.row];
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        iv.image = [UIImage imageNamed:@"right_arrows.png"];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.accessoryView = iv;
        
        return cell;
    }else {
        YWMyDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
        if (!cell) {
            cell = [[YWMyDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell2"];
        }
        cell.delegate = self;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return !section?0.00001:10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return !indexPath.section?60:100;
}

-(void)viewDidLayoutSubviews
{
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
