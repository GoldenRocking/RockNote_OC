//
//  UIColor+GKHex.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "UIColor+GKHex.h"

@implementation UIColor (GKHex)

+(UIColor *)colorWithHex:(NSInteger)rgbHexValue
{
    return [UIColor colorWithHex:rgbHexValue alpha:1.0];
}

+(UIColor *)colorWithHex:(NSInteger)rgbHexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((rgbHexValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbHexValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbHexValue & 0xFF))/255.0
                           alpha:alpha];
}

+(UIColor *)systemColor
{
    return [self colorWithR:1 G:152 B:117 A:1.0];
}

+(UIColor *)systemDarkColor
{
    return [self colorWithR:32 G:87 B:14 A:1.0];
}


+(UIColor *)colorWithR:(CGFloat) red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
