//
//  YWSubjectSecondTableViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWSubjectSecondTableViewCell.h"
#import "YWSubjectSecondCollectionViewCell.h"

@interface YWSubjectSecondTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation YWSubjectSecondTableViewCell
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
        flawLayout.itemSize = CGSizeMake(DeviceWidth/2, 100);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flawLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[YWSubjectSecondCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
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
            make.height.offset(0.5);
            make.left.offset(0);
        }];
        
        UIView *view1 = [[UIView alloc] init];
        view1.backgroundColor = SeparatorColor;
        [self.contentView addSubview:view1];
        [view1 makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(DeviceWidth/2);
            make.top.offset(0);
            make.width.offset(0.5);
            make.bottom.offset(0);
        }];
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YWSubjectSecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.title = _titles[indexPath.item];
    cell.imageName = _images[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(subjectSecondTableViewCell:didSlelectItemIndex:)]) {
        [_delegate subjectSecondTableViewCell:self didSlelectItemIndex:indexPath.row];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


@end
