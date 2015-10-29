//
//  YWSubjectSecondTableViewCell.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWSubjectSecondTableViewCell;
@protocol YWSubjectSecondTableViewCellDelegate <NSObject>

- (void)subjectSecondTableViewCell:(YWSubjectSecondTableViewCell *)cell didSlelectItemIndex:(NSInteger)index;

@end

@interface YWSubjectSecondTableViewCell : UITableViewCell

@property (nonatomic, strong) id<YWSubjectSecondTableViewCellDelegate>delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titles:(NSArray *)titles images:(NSArray *)images;


@end
