//
//  YWSunjectSecondCollectionViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWSubjectSecondCollectionViewCell.h"

@implementation YWSubjectSecondCollectionViewCell
{
    UIImageView   *_imageView;
    UILabel       *_label;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 40;
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.offset(80);
            make.left.offset(20);
            make.top.equalTo(10);
        }];
        
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 2;
        [self.contentView addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).offset(30);
            make.height.offset(40);
            make.bottom.equalTo(_imageView.mas_bottom);
        }];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _label.text = title;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    _imageView.image = [UIImage imageNamed:imageName];
}


@end
