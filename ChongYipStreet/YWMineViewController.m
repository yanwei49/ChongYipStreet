//
//  YWMineViewController.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMineViewController.h"
#import "YWUserModel.h"
#import "YWLoginHeadView.h"
#import "YWCateView.h"
#import "YWMyFirstTableViewCell.h"
#import "YWMySecondTableViewCell.h"
#import "YWMyDetailViewController.h"

@interface YWMineViewController ()<UITableViewDelegate, UITableViewDataSource, YWMySecondTableViewCellDelegate, YWMyFirstTableViewCellDelegate, YWCateViewDelegate, YWLoginHeadViewDelegate>

@end

@implementation YWMineViewController
{
    YWUserModel      *_user;
    YWLoginHeadView  *_headView;
    YWCateView       *_cateView;
    UITableView      *_tableView;
    NSMutableArray   *_textContents;
    NSMutableArray   *_imageContents;
    NSMutableArray   *_textContents1;
    NSMutableArray   *_imageContents1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    _textContents = [[NSMutableArray alloc] initWithArray:@[@"我的消息", @"我的收藏", @"我的积分", @"我的朋友", @"我的粉丝", @"我的投资", @"关注", @"更多"]];
    _imageContents = [[NSMutableArray alloc] initWithArray:@[@"xx.png", @"sc.png", @"jf.png", @"py.png", @"fs.png", @"fz.png", @"gz.png", @"gd.png"]];
    _textContents1 = [[NSMutableArray alloc] initWithArray:@[@"我的规划", @"项目推广", @"我的创意", @"我的项目"]];
    _imageContents1 = [[NSMutableArray alloc] initWithArray:@[@"human1.png", @"human2.png", @"human3.png", @"human4.png"]];

    [self obtainUser];
    [self initSubViews];
}

- (void)obtainUser {
    _user = [[YWUserModel alloc] init];
    _user.userId = @"1";
    _user.userName = @"随便写的";
    _user.userScore = @"1231";
    _user.userAvatorUrl = @"";
}

- (void)initSubViews {
    _headView = [[YWLoginHeadView alloc] initWithFrame:CGRectMake(0, 20, DeviceWidth, 100)];
    _headView.user = _user;
    _headView.delegate = self;
    [self.view addSubview:_headView];
    
    _cateView = [[YWCateView alloc] init];
    _cateView.delegate = self;
    [self.view addSubview:_cateView];
    [_cateView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headView.mas_bottom);
        make.height.offset(80);
        make.left.right.offset(0);
    }];

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = SeparatorColor;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(_cateView.mas_bottom);
        make.bottom.offset(-49);
    }];
}


#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        YWMyFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
        if (!cell) {
            cell = [[YWMyFirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell" titles:_textContents images:_imageContents];
        }
        cell.delegate = self;
        
        return cell;
    }else {
        YWMySecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
        if (!cell) {
            cell = [[YWMySecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell2" titles:_textContents1 images:_imageContents1];
        }
        cell.delegate = self;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return DeviceWidth/2;
    }else {
        return 160;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001;
    }else {
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 10)];
        view.backgroundColor = SeparatorColor;
        
        return view;
    }else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - YWMyFirstTableViewCellDelegate
- (void)myFirstTableViewCell:(YWMyFirstTableViewCell *)cell didSlelectItemIndex:(NSInteger)index {
    NSLog(@"选中了：%@", _textContents[index]);
}

#pragma mark - YWMySecondTableViewCellDelegate
- (void)mySecondTableViewCell:(YWMySecondTableViewCell *)cell didSlelectItemIndex:(NSInteger)index {
    NSLog(@"选中了：%@", _textContents1[index]);
}

#pragma mark - YWCateViewDelegate
- (void)cateView:(YWCateView *)cell didSlelectItemIndex:(NSInteger)index {
    NSLog(@"选中了：第%ld个", index);
}

#pragma mark - YWLoginHeadViewDelegate
- (void)loginHeadViewOnClick:(YWLoginHeadView *)cell {
    NSLog(@"点击了头像");
    YWMyDetailViewController *vc = [[YWMyDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
