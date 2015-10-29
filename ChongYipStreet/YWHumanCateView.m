//
//  YWHumanCateView.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWHumanCateView.h"

@implementation YWHumanCateView
{
    NSMutableArray   *_btns;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _btns = [[NSMutableArray alloc] init];
        
        NSArray *titles = @[@"大学生", @"社会青年", @"资历深厚"];
        NSArray *images = @[@"dxs.png", @"shqn.png", @"zlsh.png"];
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
            imageView.layer.masksToBounds = YES;
            imageView.layer.cornerRadius = 40;
            [button addSubview:imageView];
            [imageView makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button.mas_centerX);
                make.width.height.equalTo(80);
                make.top.offset(10);
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = titles[i];
            [button addSubview:label];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button.mas_centerX);
                make.height.offset(20);
                make.width.equalTo(button.mas_width);
                make.top.equalTo(imageView.mas_bottom).offset(5);
            }];
        }
    }
    
    return self;
}

- (void)actionOnClick:(UIButton *)button {
    NSInteger index = [_btns indexOfObject:button];
    if ([_delegate respondsToSelector:@selector(humanCateView:didSlelectItemIndex:)]) {
        [_delegate humanCateView:self didSlelectItemIndex:index];
    }
}
@end
