//
//  YWProject2TableHeadView.m
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWProject2TableHeadView.h"
#import "YWMyFirsrtCollectionViewCell.h"

@interface YWProject2TableHeadView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation YWProject2TableHeadView
{
    UICollectionView *_collectionView;
    NSArray          *_titles;
    NSArray          *_images;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        _titles = @[@"类型", @"团队", @"人数", @"资金"];
        _images = @[@"type.png", @"team.png", @"human_nums.png", @"cash.png"];
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.text = @"创业街";
        label.font = [UIFont systemFontOfSize:30];
        [self addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(40);
            make.centerX.equalTo(self.mas_centerX);
            make.height.offset(30);
        }];

        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"my_project.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(actionBack) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.offset(40);
            make.left.offset(20);
            make.top.offset(40);
        }];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(DeviceWidth/4, 100);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        [_collectionView registerClass:[YWMyFirsrtCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
        [_collectionView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.offset(0);
            make.height.offset(100);
        }];
    }
    
    return self;
}

- (void)actionBack {
    if ([_delegate respondsToSelector:@selector(project2TableHeadViewDidSelectBack)]) {
        [_delegate project2TableHeadViewDidSelectBack];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YWMyFirsrtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.title = _titles[indexPath.item];
    cell.imageName = _images[indexPath.item];
    cell.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(project2TableHeadView:didSelectItemWithIndex:)]) {
        [_delegate project2TableHeadView:self didSelectItemWithIndex:indexPath.row];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


@end
