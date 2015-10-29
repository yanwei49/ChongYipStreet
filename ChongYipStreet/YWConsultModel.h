//
//  YWConsultModel.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YWUserModel;
@interface YWConsultModel : NSObject

@property (nonatomic, strong) NSString    *consultId;
@property (nonatomic, strong) NSString    *consultType;
@property (nonatomic, strong) NSString    *consultTitle;
@property (nonatomic, strong) NSString    *consultContent;
@property (nonatomic, strong) NSString    *consultSupportNums;
@property (nonatomic, assign) BOOL         isSupport;
@property (nonatomic, assign) BOOL         isCollect;
@property (nonatomic, strong) YWUserModel *user;


@end
