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
    UILabel      *_typeLabel;
    UIButton     *_supportButton;
    UIButton     *_collectButton;
    UILabel      *_contentLabel;
    UIImageView  *_imageView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"来自";
        label.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.height.offset(25);
            make.left.offset(10);
        }];
        
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.backgroundColor = [UIColor whiteColor];
        _typeLabel.text = @"商业";
        _typeLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_typeLabel];
        [_typeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_top);
            make.height.equalTo(label.mas_height);
            make.left.equalTo(label.mas_right).offset(10);
        }];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label.mas_left);
            make.top.equalTo(_typeLabel.mas_bottom);
            make.width.height.offset(80);
        }];
        
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor whiteColor];
        _contentLabel.numberOfLines = 4;
        _contentLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_contentLabel];
        [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_top);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.right.equalTo(-10);
        }];
        
        
        _collectButton = [[UIButton alloc] init];
        _collectButton.backgroundColor = [UIColor whiteColor];
        [_collectButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_collectButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectButton setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [_collectButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        _collectButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_collectButton addTarget:self action:@selector(actionCollect:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_collectButton];
        [_collectButton makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.offset(-2);
            make.height.offset(25);
            make.width.offset(60);
        }];
        
        _supportButton = [[UIButton alloc] init];
        _supportButton.backgroundColor = [UIColor whiteColor];
        [_supportButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_supportButton setTitle:@"100" forState:UIControlStateNormal];
        [_supportButton setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
        [_supportButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        _supportButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_supportButton addTarget:self action:@selector(actionSupport:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_supportButton];
        [_supportButton makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-2);
            make.right.equalTo(_collectButton.mas_left).offset(-10);
            make.height.offset(25);
            make.width.offset(60);
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
    
    _typeLabel.text = model.consultType;
    _contentLabel.text = model.textContent;
    
    [_collectButton setTitle:model.collectNums forState:UIControlStateNormal];
    [_supportButton setTitle:model.supportNums forState:UIControlStateNormal];
    
    
    [_collectButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat width = [model.collectNums boundingRectWithSize:CGSizeMake(150, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width + 45;
        make.width.offset(width);
    }];
    [_supportButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat width = [model.supportNums boundingRectWithSize:CGSizeMake(150, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width + 45;
        make.width.offset(width);
    }];
}

+ (CGFloat)cellHeightForModel:(YWMovieModel *)model {
    CGFloat totalHeight = 95;
    CGSize size = [model.textContent boundingRectWithSize:CGSizeMake(DeviceWidth-70, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil].size;
    if (size.height > 40) {
        if (size.height > 80) {
            totalHeight += 40;
        }else {
            totalHeight += size.height - 40;
        }
    }
    return totalHeight;
}





@end
