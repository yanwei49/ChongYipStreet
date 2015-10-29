//
//  YWConsultTableViewCell.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWConsultModel;
@interface YWConsultTableViewCell : UITableViewCell

@property (nonatomic, strong) YWConsultModel *model;

+ (CGFloat)cellHeightForModel:(YWConsultModel *)model;


@end
