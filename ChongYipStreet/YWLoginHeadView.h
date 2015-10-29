//
//  YWLoginHeadView.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWUserModel;
@class YWLoginHeadView;
@protocol YWLoginHeadViewDelegate <NSObject>

- (void)loginHeadViewOnClick:(YWLoginHeadView *)cell;

@end

@interface YWLoginHeadView : UIView

@property (nonatomic, strong) id<YWLoginHeadViewDelegate>delegate;
@property (nonatomic, strong) YWUserModel *user;

@end
