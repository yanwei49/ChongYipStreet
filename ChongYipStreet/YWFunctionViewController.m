//
//  YWFunctionViewController.m
//  ChongYipStreet
//
//  Created by David Yu on 3/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWFunctionViewController.h"
#import "YWHumanCateView.h"

@interface YWFunctionViewController ()<UITableViewDelegate, UITableViewDataSource, YWHumanCateViewDelegate>

@end

@implementation YWFunctionViewController
{
    UIView           *_backView;
    UITableView      *_tableView;
    YWHumanCateView  *_cateView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    [self createSubViews];

}

- (void)createSubViews {
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

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        return cell;
    }else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        return cell;
    }
}





@end
