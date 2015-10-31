//
//  GlobalDefine.h
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/25.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

#define DeviceWidth [UIScreen mainScreen].bounds.size.width
#define DeviceHeight [UIScreen mainScreen].bounds.size.height

#define GRAYCOLOR(rgb) RGBA(rgb,rgb,rgb,1.0f)
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define SeparatorColor [UIColor colorWithRed:234/256.0 green:234/256.0 blue:234/256.0 alpha:1]

#endif /* GlobalDefine_h */
