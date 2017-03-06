//
//  UIColor+GKHex.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GKHex)
+ (UIColor *)colorWithHex:(NSInteger)rgbHexValue;

+(UIColor *)colorWithHex:(NSInteger)rgbHexValue alpha:(CGFloat)alpha;

+(UIColor *)systemColor;

+(UIColor *)systemDarkColor;

@end
