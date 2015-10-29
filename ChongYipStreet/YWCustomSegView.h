//
//  YWCustomSegView.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWCustomSegView;
@protocol YWCustomSegViewDelegate <NSObject>

- (void)customSegView:(YWCustomSegView *)view didSelectIndex:(NSInteger)index;

@end

@interface YWCustomSegView : UIView

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger selectIndex;;
@property (nonatomic, assign) id<YWCustomSegViewDelegate>delegate;

@end
