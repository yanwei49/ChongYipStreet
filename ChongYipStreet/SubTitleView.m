//
//  SubTitleView.m
//  ChongYipStreet
//
//  Created by youyou5920 on 15/11/18.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "SubTitleView.h"
@interface SubTitleView(){
    NSArray * _titles;
    NSArray * _images;
}
@end
@implementation SubTitleView

- (instancetype) initWithFrame:(CGRect)frame titles:(NSArray *) titles images:(NSArray *) images{
    if(self = [super initWithFrame:frame]){
        _titles = [NSArray arrayWithArray:titles];
        _images = [NSArray arrayWithArray:images];
        [self initSubView];
    }
    return self;
}

- (void) initSubView{
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width / _titles.count;
    
    [_titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleBtn setTag:idx + 1000];
        [titleBtn setFrame:CGRectMake(idx * width, 0, width, height)];
        [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(5.0f, 5, 25.0f, 5)];
        [titleBtn setImage:[UIImage imageNamed:_images[idx]] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(selectTitleIndex:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel * textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 25, width, 22.5)];
        [textLabel setText:obj];
        [textLabel setTextColor:[UIColor grayColor]];
        [textLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [textLabel setTextAlignment:NSTextAlignmentCenter];
        [titleBtn addSubview:textLabel];
        
        [self addSubview:titleBtn];
    }];
}

- (void) selectTitleIndex:(UIButton *) button{
    self.selectTitleBolck(button.tag - 1000);
}
@end
