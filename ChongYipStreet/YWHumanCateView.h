//
//  YWHumanCateView.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWHumanCateView;
@protocol YWHumanCateViewDelegate <NSObject>

- (void)humanCateView:(YWHumanCateView *)cell didSlelectItemIndex:(NSInteger)index;

@end

@interface YWHumanCateView : UIView

@property (nonatomic, strong) id<YWHumanCateViewDelegate>delegate;

@end
