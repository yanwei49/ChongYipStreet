//
//  YWSecondTableViewCell.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWMySecondTableViewCell;
@protocol YWMySecondTableViewCellDelegate <NSObject>

- (void)mySecondTableViewCell:(YWMySecondTableViewCell *)cell didSlelectItemIndex:(NSInteger)index;

@end

@interface YWMySecondTableViewCell : UITableViewCell

@property (nonatomic, strong) id<YWMySecondTableViewCellDelegate>delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titles:(NSArray *)titles images:(NSArray *)images;


@end

