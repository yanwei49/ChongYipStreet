//
//  YWCustomSegView.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWCustomSegView.h"

@implementation YWCustomSegView
{
    NSMutableArray *_buttonArray;
    NSMutableArray *_viewArray;
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _buttonArray = [[NSMutableArray alloc] init];
        _viewArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    for (NSInteger i=0; i<titles.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn addTarget:self action:@selector(actionOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray addObject:btn];
        [self addSubview:btn];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.offset(0);
            make.width.offset(DeviceWidth/titles.count);
            make.left.offset(DeviceWidth/titles.count*i);
        }];

        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        [btn addSubview:view];
        [_viewArray addObject:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.offset(0);
            make.height.offset(2);
        }];
    }
    [self changeSelectIndex:_selectIndex withTotalCount:_titles.count];
}

- (void)actionOnClick:(UIButton *)button {
    NSInteger index = [_buttonArray indexOfObject:button];
    [self changeSelectIndex:index withTotalCount:_titles.count];
    if ([_delegate respondsToSelector:@selector(customSegView:didSelectIndex:)]) {
        [_delegate customSegView:self didSelectIndex:index];
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    [self changeSelectIndex:selectIndex withTotalCount:_titles.count];
}

- (void)changeSelectIndex:(NSInteger)selectIndex withTotalCount:(NSInteger)totalCount {
    if (totalCount >= selectIndex) {
        for (NSInteger i=0; i<totalCount; i++) {
            UIButton *button = _buttonArray[i];
            UIView *view = _viewArray[i];
            if (i == selectIndex) {
                button.selected = YES;
                view.backgroundColor = [UIColor redColor];
            }else {
                button.selected = NO;
                view.backgroundColor = [UIColor whiteColor];
            }
        }
    }
}


@end
