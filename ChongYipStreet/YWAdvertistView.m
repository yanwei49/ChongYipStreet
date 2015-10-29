//
//  YWAdvertistView.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "YWAdvertistView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "YWAdvertistModel.h"

@interface YWAdvertistView() <UIScrollViewDelegate>

@end

@implementation YWAdvertistView
{
    UIScrollView     *_scrollView;
    UIPageControl    *_pageControl;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        [_scrollView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(0);
        }];
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [self addSubview:_pageControl];
        [_pageControl makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.right.offset(-10);
            make.height.offset(20);
        }];
    }
    
    return self;
}


- (void)setAdvertistArray:(NSArray *)advertistArray {
    _advertistArray = advertistArray;
    _scrollView.contentSize = CGSizeMake(DeviceWidth*advertistArray.count, _scrollView.contentSize.height);
    _pageControl.numberOfPages = advertistArray.count;
    for (NSInteger i=0; i<advertistArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor greenColor];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[advertistArray[i] advertistUrl]] placeholderImage:[UIImage imageNamed:@""]];
        [_scrollView addSubview:imageView];
        [imageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.width.offset(DeviceWidth);
            make.left.offset(DeviceWidth*i);
            make.height.equalTo(_scrollView.mas_height);
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _pageControl.currentPage = scrollView.contentOffset.x/DeviceWidth;
}


@end


