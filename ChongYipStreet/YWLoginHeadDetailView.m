//
//  YWLoginHeadDetailView.m
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWLoginHeadDetailView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation YWLoginHeadDetailView
{
    UIImageView    *_avator;
    UILabel        *_nameLabel;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *iv = [[UIImageView alloc] init];
        iv.image = [UIImage imageNamed:@"background.png"];
        [self addSubview:iv];
        [iv makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.offset(0);
        }];
        
        UIButton *backBtn = [[UIButton alloc] init];
        [backBtn setImage:[UIImage imageNamed:@"cang.png"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(actionBack) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        [backBtn makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.offset(40);
            make.left.offset(20);
            make.top.offset(20);
        }];
        
        _avator = [[UIImageView alloc] init];
        _avator.image = [UIImage imageNamed:@"avator.png"];
        [self addSubview:_avator];
        [_avator makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.offset(80);
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(self.mas_centerY).offset(20);
        }];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:_nameLabel];
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.height.offset(20);
            make.top.equalTo(_avator.mas_bottom).offset(20);
        }];
        
        UIButton *accountBtn = [[UIButton alloc] init];
        [accountBtn setTitle:@"账号信息" forState:UIControlStateNormal];
        accountBtn.layer.masksToBounds = YES;
        accountBtn.layer.cornerRadius = 10;
        accountBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        accountBtn.layer.borderWidth = 1;
        [accountBtn addTarget:self action:@selector(actionAccount) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:accountBtn];
        [accountBtn makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(40);
            make.width.offset(100);
            make.right.offset(-10);
            make.bottom.offset(-20);
        }];
    }
    
    return self;
}

- (void)actionBack {
    if ([_delegate respondsToSelector:@selector(loginHeadDetailViewDidSelectBack)]) {
        [_delegate loginHeadDetailViewDidSelectBack];
    }
}

- (void)actionAccount {
    if ([_delegate respondsToSelector:@selector(loginHeadDetailViewDidSelectBack)]) {
        [_delegate loginHeadDetailViewDidSelectAccount];
    }
}

- (void)setName:(NSString *)name {
    _name = name;
    _nameLabel.text = name;
}

- (void)setImage:(NSString *)image {
    _image = image;
    [_avator sd_setImageWithURL:[NSURL URLWithString:_image] placeholderImage:[UIImage imageNamed:@"avator.png"]];
}

@end
