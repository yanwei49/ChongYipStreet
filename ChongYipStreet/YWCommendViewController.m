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
@interface YWCommendViewController ()<UITableViewDelegate, UITableViewDataSource, YWCustomSegViewDelegate>

@end

@implementation YWCommendViewController
{
    YWCustomSegView    *_segView;
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

- (void)initSubViews {
    NSArray *titles = @[@"视频", @"互联网", @"名人", @"经验"];
    
    
    _segView = [[YWCustomSegView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40)];
    _segView.titles = titles;
    _segView.delegate = self;
    [self.view addSubview:_segView];
    
    _advertistView = [[YWAdvertistView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 200)];
    _advertistView.advertistArray = @[];
    
    _movieTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _movieTableView.backgroundColor = [UIColor whiteColor];
    _movieTableView.tableFooterView = [[UIView alloc] init];
    _movieTableView.tableHeaderView = _advertistView;
    _movieTableView.dataSource = self;
    _movieTableView.delegate = self;
    [self.view addSubview:_movieTableView];
    [_movieTableView makeConstraints:^(MASConstraintMaker *make) {
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
        _movieTableView.tableHeaderView = _advertistView;
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
#pragma mark - Action
- (void) searchAction:(UIBarButtonItem *) searchButton{
    SearchViewController * searchVC = [[SearchViewController alloc] init];
    [searchVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:searchVC animated:YES];
}

@end
