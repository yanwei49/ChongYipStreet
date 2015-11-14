//
//  YWMyFirsrtCollectionViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMyFirsrtCollectionViewCell.h"

@implementation YWMyFirsrtCollectionViewCell
{
    UIImageView   *_imageView;
    UILabel       *_label;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {        
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
//        _imageView.layer.masksToBounds = YES;
//        _imageView.layer.cornerRadius = 15;
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.width.height.offset(40);
            if (DeviceHeight >= 667) {
                make.top.offset(15);
            }else {
                make.top.offset(10);
            }
        }];
        
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.height.offset(20);
            make.width.equalTo(self.mas_width);
            make.bottom.offset(-10);
        }];
    }
    
    return self;
}

- (void)setTextColor:(UIColor *)textColor {
    _label.textColor = textColor;
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
