//
//  YWFunctionViewController.h
//  ChongYipStreet
//
//  Created by David Yu on 3/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWFunctionViewController;

@protocol YWFunctionViewControllerDelegate <NSObject>

- (void)functionViewControllerDidSelectBack;

@end
@interface YWFunctionViewController : UIViewController

@property (nonatomic, assign) id<YWFunctionViewControllerDelegate> delegate;

@end
