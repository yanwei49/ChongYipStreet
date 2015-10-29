//
//  YWMyFirstTableViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMyFirstTableViewCell.h"
#import "YWMyFirsrtCollectionViewCell.h"

@interface YWMyFirstTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation YWMyFirstTableViewCell
{
    UICollectionView   *_collectionView;
    NSMutableArray     *_titles;
    NSMutableArray     *_images;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titles:(NSArray *)titles images:(NSArray *)images {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _titles = [[NSMutableArray alloc] initWithArray:titles];
        _images = [[NSMutableArray alloc] initWithArray:images];
        
        UICollectionViewFlowLayout *flawLayout = [[UICollectionViewFlowLayout alloc] init];
        flawLayout.minimumLineSpacing = 0;
        flawLayout.minimumLineSpacing = 0;
        flawLayout.itemSize = CGSizeMake(DeviceWidth/4, DeviceWidth/4);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flawLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[YWMyFirsrtCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [self.contentView addSubview:_collectionView];
        [_collectionView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.offset(0);
        }];
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = SeparatorColor;
        [self.contentView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_centerY);
            make.right.offset(0);
            make.height.offset(1);
            make.left.offset(0);
        }];
        
        for (NSInteger i=0; i<3; i++) {
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = SeparatorColor;
            [self.contentView addSubview:view];
            [view makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(DeviceWidth/4*(i+1));
                make.top.offset(0);
                make.width.offset(1);
                make.bottom.offset(0);
            }];
        }
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YWMyFirsrtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.title = _titles[indexPath.item];
    cell.imageName = _images[indexPath.item];
    
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(myFirstTableViewCell:didSlelectItemIndex:)]) {
        [_delegate myFirstTableViewCell:self didSlelectItemIndex:indexPath.row];
    }
}


@end
