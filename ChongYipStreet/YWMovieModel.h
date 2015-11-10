//
//  YWMovieModel.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWMovieModel : NSObject

@property (nonatomic, strong) NSString * iconUrl;
@property (nonatomic, strong) NSString * textContent;
@property (nonatomic, strong) NSString * consultId;
@property (nonatomic, strong) NSString * consultType;
@property (nonatomic, strong) NSString * consultTitle;

@property (nonatomic, strong) NSString * supportNums;
@property (nonatomic, strong) NSString * collectNums;
@property (nonatomic, assign) BOOL       isSupport;
@property (nonatomic, assign) BOOL       isCollect;
@end
