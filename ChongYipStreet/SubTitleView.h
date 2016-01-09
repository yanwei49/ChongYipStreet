//
//  SubTitleView.h
//  ChongYipStreet
//
//  Created by youyou5920 on 15/11/18.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTitleView : UIView
- (instancetype) initWithFrame:(CGRect)frame titles:(NSArray *) titles images:(NSArray *) images;
@property (nonatomic,copy) void (^selectTitleBolck)(NSInteger);
@end
