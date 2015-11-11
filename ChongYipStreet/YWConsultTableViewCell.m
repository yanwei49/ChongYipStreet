//
//  YWConsultTableViewCell.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWConsultTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "YWConsultModel.h"
#import "YWUserModel.h"

@implementation YWConsultTableViewCell
{
    UILabel      *_typeLabel;
    UIButton     *_supportButton;
    UIButton     *_collecButton;
    UILabel      *_titleLabel;
    UILabel      *_contentLabel;
    UIImageView  *_userAvator;
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
        _typeLabel.text = @"";
        _typeLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_typeLabel];
        [_typeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_top);
            make.height.equalTo(label.mas_height);
            make.left.equalTo(label.mas_right).offset(10);
        }];
        
        _collecButton = [[UIButton alloc] init];
        _collecButton.backgroundColor = [UIColor whiteColor];
        [_collecButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_collecButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_collecButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collecButton setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [_collecButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        _collecButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_collecButton addTarget:self action:@selector(actionCollect:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_collecButton];
        [_collecButton makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_typeLabel.mas_centerY);
            make.right.equalTo(-10);
            make.height.offset(20);
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
            make.centerY.equalTo(_typeLabel.mas_centerY);
            make.right.equalTo(_collecButton.mas_left).offset(-10);
            make.height.offset(25);
            make.width.offset(60);
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.text = @"";
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_typeLabel.mas_bottom);
            make.height.offset(25);
            make.right.offset(-20);
            make.left.equalTo(label.mas_left);
        }];
        
        _userAvator = [[UIImageView alloc] init];
        _userAvator.backgroundColor = [UIColor greenColor];
        _userAvator.layer.masksToBounds = YES;
        _userAvator.layer.cornerRadius = 20;
        [self.contentView addSubview:_userAvator];
        [_userAvator makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel.mas_left);
            make.top.equalTo(_titleLabel.mas_bottom);
            make.width.height.offset(40);
        }];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor whiteColor];
        _contentLabel.numberOfLines = 4;
        _contentLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_contentLabel];
        [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_userAvator.mas_top);
            make.left.equalTo(_userAvator.mas_right).offset(10);
            make.right.equalTo(-10);
        }];
    }
    
    return self;
}

- (void)actionCollect:(UIButton *)button {
    
}

- (void)actionSupport:(UIButton *)button {
    
}

- (void)setModel:(YWConsultModel *)model {
    _model = model;
    [_userAvator sd_setImageWithURL:[NSURL URLWithString:model.user.userAvatorUrl] placeholderImage:[UIImage imageNamed:@""]];
    _typeLabel.text = model.consultType;
    _titleLabel.text = model.consultTitle;
    _contentLabel.text = model.consultContent;
    [_supportButton setTitle:model.consultSupportNums forState:UIControlStateNormal];
    _supportButton.selected = model.isSupport;
    _collecButton.selected = model.isCollect;
    
    [_contentLabel updateConstraints:^(MASConstraintMaker *make) {
        CGFloat width = [model.consultTitle boundingRectWithSize:CGSizeMake(150, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width + 45;
        make.width.offset(width);
    }];
    [_supportButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat width = [model.consultSupportNums boundingRectWithSize:CGSizeMake(150, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width + 45;
        make.width.offset(width);
    }];
}

+ (CGFloat)cellHeightForModel:(YWConsultModel *)model {
    CGFloat totalHeight = 95;
    CGSize size = [model.consultContent boundingRectWithSize:CGSizeMake(DeviceWidth-70, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil].size;
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
