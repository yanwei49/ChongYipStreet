//
//  YWFunctionViewController.m
//  ChongYipStreet
//
//  Created by David Yu on 3/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWFunctionViewController.h"
#import "YWProject2TableHeadView.h"
#import "YWMySecondTableViewCell.h"

@interface YWFunctionViewController ()<UITableViewDelegate, UITableViewDataSource, YWProject2TableHeadViewDelegate, YWMySecondTableViewCellDelegate>

@end

@implementation YWFunctionViewController
{
    UIView                   *_backView;
    UITableView              *_tableView;
    YWProject2TableHeadView  *_headView;
    NSMutableArray   *_textContents1;
    NSMutableArray   *_imageContents1;
    NSMutableArray   *_textContents2;
    NSMutableArray   *_imageContents2;
    NSMutableArray   *_textContents3;
    NSMutableArray   *_imageContents3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    _textContents1 = [[NSMutableArray alloc] initWithArray:@[@"我的项目", @"我的计划", @"我的创业", @"创业记录"]];
    _imageContents1 = [[NSMutableArray alloc] initWithArray:@[@"my_project_1.png", @"my_method.png", @"my_work.png", @"work_history.png"]];
    _textContents2 = [[NSMutableArray alloc] initWithArray:@[@"相关资料", @"相关帖子", @"相关项目"]];
    _imageContents2 = [[NSMutableArray alloc] initWithArray:@[@"relation_data.png", @"relation_post.png", @"relation_project.png"]];
    _textContents3 = [[NSMutableArray alloc] initWithArray:@[@"学习", @"找团队", @"寻找", @"找投资"]];
    _imageContents3 = [[NSMutableArray alloc] initWithArray:@[@"study.png", @"look_team.png", @"look.png", @"look_cash.png"]];

    [self createSubViews];
}

- (void)createSubViews {
    _headView = [[YWProject2TableHeadView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 180)];
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
        make.bottom.offset(-49);
    }];
}

#pragma mark - YWProject2TableHeadViewDelegate
- (void)project2TableHeadView:(YWProject2TableHeadView *)view didSelectItemWithIndex:(NSInteger)index {
    NSLog(@"选中了：%ld", index);
}

- (void)project2TableHeadViewDidSelectBack {
    if ([_delegate respondsToSelector:@selector(functionViewControllerDidSelectBack)]) {
        [_delegate functionViewControllerDidSelectBack];
    }
}

#pragma mark - YWMySecondTableViewCellDelegate
- (void)mySecondTableViewCell:(YWMySecondTableViewCell *)cell didSlelectItemIndex:(NSInteger)index {
    NSLog(@"选中了：%@", _textContents1[index]);
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        YWMySecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
        if (!cell) {
            cell = [[YWMySecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell2" titles:_textContents1 images:_imageContents1];
        }
        cell.delegate = self;
        
        return cell;
    }else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.imageView.image = [UIImage imageNamed:_imageContents2[indexPath.row]];
        cell.textLabel.text = _textContents2[indexPath.row];
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        iv.image = [UIImage imageNamed:@"right_arrows.png"];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.accessoryView = iv;
        
        return cell;
    }else {
        YWMySecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
        if (!cell) {
            cell = [[YWMySecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell2" titles:_textContents3 images:_imageContents3];
        }
        cell.delegate = self;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section) {
        return 10;
    }else {
        return 0.00001;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 60;
    }else {
        return 160;
    }
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
