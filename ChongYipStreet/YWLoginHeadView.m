//
//  YWLoginHeadView.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWLoginHeadView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "YWUserModel.h"

@implementation YWLoginHeadView
{
    UIImageView    *_avatorImage;
    UILabel        *_nameLabel;
    UILabel        *_scoreLabel;
    UIImageView    *_detailImage;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOnClick)]];
        
        _avatorImage = [[UIImageView alloc] init];
//        _avatorImage.backgroundColor = [UIColor whiteColor];
        _avatorImage.layer.masksToBounds = YES;
        _avatorImage.layer.cornerRadius = 30;
        [self addSubview:_avatorImage];
        [_avatorImage makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(20);
            make.height.offset(60);
            make.width.offset(62);
        }];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"暂未登陆";
        _nameLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_nameLabel];
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatorImage.mas_right).offset(20);
            make.height.offset(25);
            make.centerY.equalTo(_avatorImage.mas_centerY);
        }];
        
        _detailImage = [[UIImageView alloc] init];
        _detailImage.image = [UIImage imageNamed:@"right_w.png"];
        [self addSubview:_detailImage];
        [_detailImage makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-20);
            make.height.width.offset(20);
            make.centerY.equalTo(_avatorImage.mas_centerY);
        }];

        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.textColor = [UIColor whiteColor];
        _scoreLabel.textAlignment = NSTextAlignmentRight;
        _scoreLabel.text = @"积分：0";
        [self addSubview:_scoreLabel];
        [_scoreLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_detailImage.mas_left).offset(-20);
            make.height.offset(25);
            make.centerY.equalTo(_avatorImage.mas_centerY);
        }];
    }
    
    return self;
}

- (void)actionOnClick {
    if ([_delegate respondsToSelector:@selector(loginHeadViewOnClick:)]) {
        [_delegate loginHeadViewOnClick:self];
    }
}

- (void)setUser:(YWUserModel *)user {
    _user = user;
    [_avatorImage sd_setImageWithURL:[NSURL URLWithString:user.userAvatorUrl] placeholderImage:[UIImage imageNamed:@"avator.png"]];
    _nameLabel.text = user.userName;
    _scoreLabel.text = [NSString stringWithFormat:@"积分：%@", user.userScore];
}


@end
