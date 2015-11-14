//
//  YWLoginHeadDetailView.h
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWLoginHeadDetailView;
@protocol YWLoginHeadDetailViewDelegate <NSObject>

- (void)loginHeadDetailViewDidSelectBack;
- (void)loginHeadDetailViewDidSelectAccount;

@end

@interface YWLoginHeadDetailView : UIView

@property (nonatomic, assign) id<YWLoginHeadDetailViewDelegate> delegate;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *image;

@end
