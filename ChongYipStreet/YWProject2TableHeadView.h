//
//  YWProject2TableHeadView.h
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWProject2TableHeadView;
@protocol YWProject2TableHeadViewDelegate <NSObject>

- (void)project2TableHeadView:(YWProject2TableHeadView *)view didSelectItemWithIndex:(NSInteger)index;
- (void)project2TableHeadViewDidSelectBack;

@end

@interface YWProject2TableHeadView : UIView

@property (nonatomic, assign) id<YWProject2TableHeadViewDelegate>delegate;

@end
