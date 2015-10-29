//
//  YWTribuneViewController.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWTribuneViewController.h"
#import "YWCustomSegView.h"
#import "YWConsultModel.h"
#import "YWConsultTableViewCell.h"
#import "YWUserModel.h"
#import "YWSubjectDetailViewController.h"

@interface YWTribuneViewController ()<UITableViewDelegate, UITableViewDataSource, YWCustomSegViewDelegate>

@end

@implementation YWTribuneViewController
{
    YWCustomSegView    *_segView;
    UITableView        *_tribuneTableView;
    NSMutableArray     *_dataSource;
    NSMutableArray     *_exchangeDataSource;
    NSMutableArray     *_cooperateDataSource;
    NSMutableArray     *_consultDataSource;
    NSMutableArray     *_financingDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"论坛";
    _dataSource = [[NSMutableArray alloc] init];
    _exchangeDataSource = [[NSMutableArray alloc] init];
    _cooperateDataSource = [[NSMutableArray alloc] init];
    _consultDataSource = [[NSMutableArray alloc] init];
    _financingDataSource = [[NSMutableArray alloc] init];
    
    [self initSubViews];
    [self obtainDataSource];
}

- (void)obtainDataSource {
    for (NSInteger i=0; i<10; i++) {
        YWConsultModel *model = [[YWConsultModel alloc] init];
        YWUserModel *user = [[YWUserModel alloc] init];
        user.userId = @"1";
        user.userAvatorUrl = @"http://www.51qnz.cn/photo/image/merchant/201510296120828674.png";
        model.user = user;
        model.consultTitle = @"我在测试东南角分别随碟附送分";
        model.consultContent = @"别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神";
        model.consultSupportNums = @"203";
        model.consultId = [NSString stringWithFormat:@"%ld", i];
        model.consultType = @"商业";
        [_exchangeDataSource addObject:model];
    }
    for (NSInteger i=0; i<1; i++) {
        YWConsultModel *model = [[YWConsultModel alloc] init];
        YWUserModel *user = [[YWUserModel alloc] init];
        user.userId = @"1";
        user.userAvatorUrl = @"http://www.51qnz.cn/photo/image/merchant/201510296120828674.png";
        model.user = user;
        model.consultTitle = @"我在测试东南角分别随碟附送分";
        model.consultContent = @"别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神";
        model.consultSupportNums = @"203";
        model.consultId = [NSString stringWithFormat:@"%ld", i];
        model.consultType = @"商业";
        [_cooperateDataSource addObject:model];
    }
    for (NSInteger i=0; i<5; i++) {
        YWConsultModel *model = [[YWConsultModel alloc] init];
        YWUserModel *user = [[YWUserModel alloc] init];
        user.userId = @"1";
        user.userAvatorUrl = @"http://www.51qnz.cn/photo/image/merchant/201510296120828674.png";
        model.user = user;
        model.consultTitle = @"我在测试东南角分别随碟附送分";
        model.consultContent = @"别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神";
        model.consultSupportNums = @"203";
        model.consultId = [NSString stringWithFormat:@"%ld", i];
        model.consultType = @"商业";
        [_consultDataSource addObject:model];
    }
    for (NSInteger i=0; i<3; i++) {
        YWConsultModel *model = [[YWConsultModel alloc] init];
        YWUserModel *user = [[YWUserModel alloc] init];
        user.userId = @"1";
        user.userAvatorUrl = @"http://www.51qnz.cn/photo/image/merchant/201510296120828674.png";
        model.user = user;
        model.consultTitle = @"我在测试东南角分别随碟附送分";
        model.consultContent = @"别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神";
        model.consultSupportNums = @"203";
        model.consultId = [NSString stringWithFormat:@"%ld", i];
        model.consultType = @"商业";
        [_financingDataSource addObject:model];
    }
    _dataSource = _exchangeDataSource;
    [_tribuneTableView reloadData];
}

- (void)initSubViews {
    NSArray *titles = @[@"交流", @"合作", @"咨询", @"融资"];
    _segView = [[YWCustomSegView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40)];
    _segView.titles = titles;
    _segView.delegate = self;
    [self.view addSubview:_segView];
        
    _tribuneTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tribuneTableView.backgroundColor = [UIColor whiteColor];
    _tribuneTableView.tableFooterView = [[UIView alloc] init];
    _tribuneTableView.dataSource = self;
    _tribuneTableView.delegate = self;
    [self.view addSubview:_tribuneTableView];
    [_tribuneTableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(_segView.mas_bottom);
        make.bottom.offset(-49);
    }];
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YWConsultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"consultCell"];
    if (!cell) {
        cell = [[YWConsultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"consultCell"];
    }
    cell.model = _dataSource[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [YWConsultTableViewCell cellHeightForModel:_dataSource[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YWSubjectDetailViewController *detailVC = [[YWSubjectDetailViewController alloc] init];
    detailVC.model = _dataSource[indexPath.row];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - YWCustomSegViewDelegate
- (void)customSegView:(YWCustomSegView *)view didSelectIndex:(NSInteger)index {
    switch (index) {
        case 0:
            _dataSource = _exchangeDataSource;
            break;
        case 1:
            _dataSource = _cooperateDataSource;
            break;
        case 2:
            _dataSource = _consultDataSource;
            break;
        case 3:
            _dataSource = _financingDataSource;
            break;
        default:
            break;
    }
    [_tribuneTableView reloadData];
}



@end
