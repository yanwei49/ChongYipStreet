//
//  YWMyFirstTableViewCell.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWMyFirstTableViewCell;
@protocol YWMyFirstTableViewCellDelegate <NSObject>

- (void)myFirstTableViewCell:(YWMyFirstTableViewCell *)cell didSlelectItemIndex:(NSInteger)index;

@end

@interface YWMyFirstTableViewCell : UITableViewCell

@property (nonatomic, strong) id<YWMyFirstTableViewCellDelegate>delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titles:(NSArray *)titles images:(NSArray *)images;


@end
