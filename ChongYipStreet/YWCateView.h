//
//  YWCateView.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWCateView;
@protocol YWCateViewDelegate <NSObject>

- (void)cateView:(YWCateView *)cell didSlelectItemIndex:(NSInteger)index;

@end

@interface YWCateView : UIView

@property (nonatomic, strong) id<YWCateViewDelegate>delegate;

@end
