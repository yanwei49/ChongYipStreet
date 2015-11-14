//
//  YWMyDetailTableViewCell.h
//  ChongYipStreet
//
//  Created by David Yu on 14/11/15.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWMyDetailTableViewCell;
@protocol YWMyDetailTableViewCellDelegate <NSObject>

- (void)myDetailTableViewCell:(YWMyDetailTableViewCell *)view didSelectItemWithIndex:(NSInteger)index;

@end

@interface YWMyDetailTableViewCell : UITableViewCell

@property (nonatomic, assign) id<YWMyDetailTableViewCellDelegate>delegate;

@end
