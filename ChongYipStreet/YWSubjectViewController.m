//
//  YWSubjectViewController.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWSubjectViewController.h"
#import "YWHumanCateView.h"
#import "YWMyFirstTableViewCell.h"
#import "YWSubjectSecondTableViewCell.h"
#import "YWFunctionViewController.h"

@interface YWSubjectViewController ()<UITableViewDelegate, UITableViewDataSource, YWMyFirstTableViewCellDelegate, YWSubjectSecondTableViewCellDelegate, YWHumanCateViewDelegate>

@end

@implementation YWSubjectViewController
{
    YWHumanCateView            *_cateView;
    UITableView                *_tableView;
    NSMutableArray             *_textContents;
    NSMutableArray             *_imageContents;
    NSMutableArray             *_textContents1;
    NSMutableArray             *_imageContents1;
    YWFunctionViewController   *_funVC;
    BOOL                        _isShowFunView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"项目";
    _textContents = [[NSMutableArray alloc] initWithArray:@[@"网店", @"微店", @"互联网", @"生活", @"服装", @"游戏", @"餐饮", @"更多"]];
    _imageContents = [[NSMutableArray alloc] initWithArray:@[@"tao.png", @"wei.png", @"hu.png", @"sheng.png", @"nv.png", @"you.png", @"cang.png", @"geng.png"]];
    _textContents1 = [[NSMutableArray alloc] initWithArray:@[@"寻找\n合伙人", @"寻找\n投资人", @"最近\n项目", @"寻找\n项目"]];
    _imageContents1 = [[NSMutableArray alloc] initWithArray:@[@"shr.png", @"tzr.png", @"hhr.png", @"xm.png"]];
    _isShowFunView = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"my_project.png"] style:UIBarButtonItemStyleDone target:self action:@selector(actionLeft:)];
    
    [self initSubViews];
    _funVC = [[YWFunctionViewController alloc] init];
    _funVC.view.frame = self.view.bounds;
    [self.view insertSubview:_funVC.view atIndex:0];
}

- (void)initSubViews {
    _cateView = [[YWHumanCateView alloc] initWithFrame:CGRectMake(0, 64, DeviceWidth, 120)];
    _cateView.delegate = self;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = SeparatorColor;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.tableHeaderView = _cateView;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.offset(64);
        make.bottom.offset(-49);
    }];
}

- (void)actionLeft:(UIBarButtonItem *)item {
    _isShowFunView = !_isShowFunView;
    _isShowFunView ? [self.view bringSubviewToFront:_funVC.view] : [self.view sendSubviewToBack:_funVC.view];
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        
        return cell;
    }else {
        YWSubjectSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
        if (!cell) {
            cell = [[YWSubjectSecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell2" titles:_textContents1 images:_imageContents1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return DeviceWidth/2;
    }else {
        return 200;
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

#pragma mark - YWMyFirstTableViewCellDelegate
- (void)myFirstTableViewCell:(YWMyFirstTableViewCell *)cell didSlelectItemIndex:(NSInteger)index{
    NSLog(@"选中了：%@", _textContents[index]);
}

#pragma mark - YWSubjectSecondTableViewCellDelegate
- (void)subjectSecondTableViewCell:(YWSubjectSecondTableViewCell *)cell didSlelectItemIndex:(NSInteger)index {
    NSLog(@"选中了：%@", _textContents1[index]);
}

#pragma mark - YWHumanCateViewDelegate
- (void)humanCateView:(YWHumanCateView *)cell didSlelectItemIndex:(NSInteger)index {
    NSLog(@"选中了：第%ld个", index);
}

@end
