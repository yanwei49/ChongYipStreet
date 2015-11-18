//
//  YWCommentViewController.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWCommendViewController.h"
#import "YWCustomSegView.h"
#import "YWAdvertistView.h"
#import "YWMovieTableViewCell.h"
#import "YWMovieModel.h"
#import "YWAdvertistModel.h"
#import "NoteViewController.h"
#import "SearchViewController.h"
#import "SubTitleView.h"

#define TITLES       @[@"视频", @"互联网", @"名人", @"经验"] //标题
#define SUB_TITLES   @[@"寻找", @"找方案", @"找团队", @"交流圈"]
#define SUB_IMAGES   @[@"cang@3x", @"cang@3x", @"cang@3x", @"cang@3x"]
@interface YWCommendViewController ()<UITableViewDelegate, UITableViewDataSource, YWCustomSegViewDelegate>

@end

@implementation YWCommendViewController
{
    YWCustomSegView    *_segView;
    UIView             *_headerView;
    SubTitleView       *_subTitleView;
    YWAdvertistView    *_advertistView;
    UITableView        *_movieTableView;
    NSMutableArray     *_movieDataSource;
    NSMutableArray     *_advertistDataSource;
    NSMutableArray     *_internetDataSource;
    NSMutableArray     *_famousPersonDataSource;
    NSMutableArray     *_experienceDataSource;
    NSMutableArray     *_dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _movieDataSource = [[NSMutableArray alloc] init];
    _advertistDataSource = [[NSMutableArray alloc] init];
    _internetDataSource = [[NSMutableArray alloc] init];
    _famousPersonDataSource = [[NSMutableArray alloc] init];
    _experienceDataSource = [[NSMutableArray alloc] init];
    _dataSource = [[NSMutableArray alloc] init];
    
    [self initSubViews];
    [self obtainDataSource];
    [self layoutNavigationBar];
}

- (void) layoutNavigationBar{
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [title setText:NSLocalizedString(@"推荐", nil)];
    [title setTextColor:[UIColor whiteColor]];
    self.navigationItem.titleView = title;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"5@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(searchAction:)];
}
- (void)initSubViews {
    
    _segView = [[YWCustomSegView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40)];
    _segView.titles = TITLES;
    _segView.delegate = self;
    [self.view addSubview:_segView];
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 305)];
    [_headerView setBackgroundColor:[UIColor colorWithWhite:0.5f alpha:0.7f]];
    _advertistView = [[YWAdvertistView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 200)];
    _advertistView.advertistArray = @[];
    [_headerView addSubview:_advertistView];
    
    
    _subTitleView = [[SubTitleView alloc] initWithFrame:CGRectMake(0, 200, DeviceWidth, 100) titles:SUB_TITLES images:SUB_IMAGES];
    [_subTitleView setBackgroundColor:[UIColor whiteColor]];
    __weak YWCommendViewController * weakSelf = self;
    _subTitleView.selectTitleBolck = ^(NSInteger selectIndex){
        [weakSelf SubTitleSelectIndex:selectIndex];
    };
    [_headerView addSubview:_subTitleView];
    
    _movieTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _movieTableView.backgroundColor = [UIColor whiteColor];
    _movieTableView.tableFooterView = [[UIView alloc] init];
    _movieTableView.tableHeaderView = _headerView;
    _movieTableView.dataSource = self;
    _movieTableView.delegate = self;
    [self.view addSubview:_movieTableView];
    [_movieTableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(_segView.mas_bottom);
        make.bottom.offset(-49);
    }];
}

- (void)obtainDataSource {
    for (NSInteger i=0; i<10; i++) {
        YWMovieModel *model = [[YWMovieModel alloc] init];
        model.iconUrl = @"http://www.51qnz.cn/photo/image/merchant/201510296120828674.png";
        model.consultTitle = @"我在测试东南角分别随碟附送分";
        model.textContent = @"我在测试东南角分别随碟附送分别是DHB栋阿红的阿大坏蛋啊很久啊的爱很大大大好大神";
        model.supportNums = @"31111";
        model.collectNums = @"11";
        model.isCollect = NO;
        model.isSupport = NO;
        model.consultId = [NSString stringWithFormat:@"%ld", i];
        model.consultType = @"商业";
        
        
        [_movieDataSource addObject:model];
        
        
        YWAdvertistModel *item = [[YWAdvertistModel alloc] init];
        item.advertistId = [NSString stringWithFormat:@"%ld", i];
        item.advertistUrl = @"http://www.51qnz.cn/photo/image/merchant/201510296120828674.png";
        if (i < 6) {
            [_advertistDataSource addObject:item];
        }
    }
    
    
    _advertistView.advertistArray = _advertistDataSource;
    _dataSource = _movieDataSource;
    
    [_movieTableView reloadData];
}
#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YWMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    if (!cell) {
        cell = [[YWMovieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"movieCell"];
    }
    cell.model = _dataSource[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoteViewController * noteVC = [[NoteViewController alloc] init];
    [noteVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:noteVC animated:YES];
}



#pragma mark - YWCustomSegViewDelegate
- (void)customSegView:(YWCustomSegView *)view didSelectIndex:(NSInteger)index {
    if (index == 0) {
        _movieTableView.tableHeaderView = _headerView;
        _dataSource = _movieDataSource;
    }else {
        _movieTableView.tableHeaderView = nil;
        switch (index) {
            case 1:
                _dataSource = _internetDataSource;
                break;
            case 2:
                _dataSource = _famousPersonDataSource;
                break;
            case 3:
                _dataSource = _experienceDataSource;
                break;
            default:
                break;
        }
    }
    [_movieTableView reloadData];
}

#pragma mark - SubTitleSelectIndex
- (void) SubTitleSelectIndex:(NSInteger) index{
    NSLog(@"%ld",index);
}
#pragma mark - Action
- (void) searchAction:(UIBarButtonItem *) searchButton{
    SearchViewController * searchVC = [[SearchViewController alloc] init];
    [searchVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:searchVC animated:YES];
}

@end
