//
//  YWMyDetailTableViewCell.m
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMyDetailTableViewCell.h"
#import "YWMyFirsrtCollectionViewCell.h"

@interface YWMyDetailTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@end

@implementation YWMyDetailTableViewCell
{
    UICollectionView    *_collectionView;
    NSArray          *_titles;
    NSArray          *_images;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titles = @[@"类型", @"团队", @"人数", @"资金"];
        _images = @[@"type.png", @"team.png", @"human_nums.png", @"cash.png"];
        
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


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YWMyFirsrtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.title = _titles[indexPath.item];
    cell.imageName = _images[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(myDetailTableViewCell:didSelectItemWithIndex:)]) {
        [_delegate myDetailTableViewCell:self didSelectItemWithIndex:indexPath.row];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



@end
