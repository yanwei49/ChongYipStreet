//
//  YWMySecondCollectionViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMySecondCollectionViewCell.h"

@implementation YWMySecondCollectionViewCell
{
    UIImageView   *_imageView;
    UILabel       *_label;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 30;
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.offset(60);
            make.top.offset(10);
            make.left.offset(20);
        }];
        
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.height.offset(20);
//            make.right.equalTo(self.mas_right);
            make.left.equalTo(_imageView.mas_right).offset(10);
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
