//
//  YWMovieTableViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWMovieTableViewCell.h"
#import "YWMovieModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation YWMovieTableViewCell
{
    UIImageView   *_imageView;
    UILabel       *_contentLabel;
    UIButton      *_supportButton;
    UIButton      *_collectButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.height.width.offset(80);
        }];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor whiteColor];
        _contentLabel.numberOfLines = 3;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_top);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.right.equalTo(-10);
        }];
        
        _collectButton = [[UIButton alloc] init];
        _collectButton.backgroundColor = [UIColor whiteColor];
        [_collectButton setTitle:@"0" forState:UIControlStateNormal];
        [_collectButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_collectButton addTarget:self action:@selector(actionCollect:) forControlEvents:UIControlEventTouchUpInside];
        _collectButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self.contentView addSubview:_collectButton];
        [_collectButton makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.offset(-10);
            make.height.offset(25);
        }];
        
        _supportButton = [[UIButton alloc] init];
        _supportButton.backgroundColor = [UIColor whiteColor];
        [_supportButton setTitle:@"0" forState:UIControlStateNormal];
        [_supportButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_supportButton addTarget:self action:@selector(actionSupport:) forControlEvents:UIControlEventTouchUpInside];
        _supportButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _supportButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self.contentView addSubview:_supportButton];
        [_supportButton makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-10);
            make.right.equalTo(_collectButton.mas_left).offset(-10);
            make.height.offset(25);
        }];
        
    }
    
    return self;
}

- (void)actionCollect:(UIButton *)button {
    
}

- (void)actionSupport:(UIButton *)button {
    
}

- (void)setModel:(YWMovieModel *)model {
    _model = model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@""]];
    _contentLabel.text = model.textContent;
    [_collectButton setTitle:model.collectNums forState:UIControlStateNormal];
    [_supportButton setTitle:model.supportNums forState:UIControlStateNormal];
}



@end
