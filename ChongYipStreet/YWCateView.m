//
//  YWCateView.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWCateView.h"

@implementation YWCateView
{
    NSMutableArray   *_btns;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        _btns = [[NSMutableArray alloc] init];
        
        NSArray *titles = @[@"我的多媒体", @"我的帖子", @"我的项目"];
        NSArray *images = @[@"myIdeal.jpg", @"myIdeal.jpg", @"myIdeal.jpg"];
        for (NSInteger i=0; i<titles.count; i++) {
            UIButton *button = [[UIButton alloc] init];
            [button addTarget:self action:@selector(actionOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [_btns addObject:button];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.offset(0);
                make.left.offset(DeviceWidth/3*i);
                make.width.offset(DeviceWidth/3);
            }];
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = [UIImage imageNamed:images[i]];
            [button addSubview:imageView];
            [imageView makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button.mas_centerX);
                make.width.height.equalTo(40);
                make.top.offset(10);
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.text = titles[i];
            [button addSubview:label];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button.mas_centerX);
                make.height.offset(20);
                make.width.equalTo(button.mas_width);
                make.top.equalTo(imageView.mas_bottom).offset(5);
            }];
            
            if (i) {
                UIView *view = [[UIView alloc] init];
                view.backgroundColor = SeparatorColor;
                [self addSubview:view];
                [view makeConstraints:^(MASConstraintMaker *make) {
                    make.left.offset(DeviceWidth/3*i);
                    make.top.offset(10);
                    make.bottom.offset(-10);
                    if (i == 1) {
                        make.width.offset(1);
                    }else {
                        make.width.offset(1.5);
                    }
                }];
            }
        }
    }
    
    return self;
}

- (void)actionOnClick:(UIButton *)button {
    NSInteger index = [_btns indexOfObject:button];
    if ([_delegate respondsToSelector:@selector(cateView:didSlelectItemIndex:)]) {
        [_delegate cateView:self didSlelectItemIndex:index];
    }
}


@end
