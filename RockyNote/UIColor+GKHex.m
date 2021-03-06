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




#pragma mark - System Colors
+ (instancetype)infoBlueColor
{
    return [[self class] colorWithR:47 G:112 B:225 A:1.0];
}

+ (instancetype)successColor
{
    return [[self class] colorWithR:83 G:215 B:106 A:1.0];
}

+ (instancetype)warningColor
{
    return [[self class] colorWithR:221 G:170 B:59 A:1.0];
}

+ (instancetype)dangerColor
{
    return [[self class] colorWithR:229 G:0 B:15 A:1.0];
}


#pragma mark - Whites
+ (instancetype)antiqueWhiteColor
{
    return [[self class] colorWithR:250 G:235 B:215 A:1.0];
}

+ (instancetype)oldLaceColor
{
    return [[self class] colorWithR:253 G:245 B:230 A:1.0];
}

+ (instancetype)ivoryColor
{
    return [[self class] colorWithR:255 G:255 B:240 A:1.0];
}

+ (instancetype)seashellColor
{
    return [[self class] colorWithR:255 G:245 B:238 A:1.0];
}

+ (instancetype)ghostWhiteColor
{
    return [[self class] colorWithR:248 G:248 B:255 A:1.0];
}

+ (instancetype)snowColor
{
    return [[self class] colorWithR:255 G:250 B:250 A:1.0];
}

+ (instancetype)linenColor
{
    return [[self class] colorWithR:250 G:240 B:230 A:1.0];
}


#pragma mark - Grays
+ (instancetype)black25PercentColor
{
    return [[self class] colorWithWhite:0.25 alpha:1.0];
}

+ (instancetype)black50PercentColor
{
    return [[self class] colorWithWhite:0.5  alpha:1.0];
}

+ (instancetype)black75PercentColor
{
    return [[self class] colorWithWhite:0.75 alpha:1.0];
}

+ (instancetype)warmGrayColor
{
    return [[self class] colorWithR:133 G:117 B:112 A:1.0];
}

+ (instancetype)coolGrayColor
{
    return [[self class] colorWithR:118 G:122 B:133 A:1.0];
}

+ (instancetype)charcoalColor
{
    return [[self class] colorWithR:34 G:34 B:34 A:1.0];
}


#pragma mark - Blues
+ (instancetype)tealColor
{
    return [[self class] colorWithR:28 G:160 B:170 A:1.0];
}

+ (instancetype)steelBlueColor
{
    return [[self class] colorWithR:103 G:153 B:170 A:1.0];
}

+ (instancetype)robinEggColor
{
    return [[self class] colorWithR:141 G:218 B:247 A:1.0];
}

+ (instancetype)pastelBlueColor
{
    return [[self class] colorWithR:99 G:161 B:247 A:1.0];
}

+ (instancetype)turquoiseColor
{
    return [[self class] colorWithR:112 G:219 B:219 A:1.0];
}

+ (instancetype)skyBlueColor
{
    return [[self class] colorWithR:0 G:178 B:238 A:1.0];
}

+ (instancetype)indigoColor
{
    return [[self class] colorWithR:13 G:79 B:139 A:1.0];
}

+ (instancetype)denimColor
{
    return [[self class] colorWithR:67 G:114 B:170 A:1.0];
}

+ (instancetype)blueberryColor
{
    return [[self class] colorWithR:89 G:113 B:173 A:1.0];
}

+ (instancetype)cornflowerColor
{
    return [[self class] colorWithR:100 G:149 B:237 A:1.0];
}

+ (instancetype)babyBlueColor
{
    return [[self class] colorWithR:190 G:220 B:230 A:1.0];
}

+ (instancetype)midnightBlueColor
{
    return [[self class] colorWithR:13 G:26 B:35 A:1.0];
}

+ (instancetype)fadedBlueColor
{
    return [[self class] colorWithR:23 G:137 B:155 A:1.0];
}

+ (instancetype)icebergColor
{
    return [[self class] colorWithR:200 G:213 B:219 A:1.0];
}

+ (instancetype)waveColor
{
    return [[self class] colorWithR:102 G:169 B:251 A:1.0];
}

+(instancetype)emeraldColor
{
    return [self colorWithR:1 G:152 B:117 A:1.0];
}

+(instancetype)grassColor
{
    return [self colorWithR:99 G:214 B:74 A:1.0];
}

+(instancetype)pastelGreenColor
{
    return [self colorWithR:126 G:242 B:124 A:1.0];
}

+(instancetype)seafoamColor
{
    return [self colorWithR:77 G:226 B:140 A:1.0];
}

+(instancetype)paleGreenColor
{
    return [self colorWithR:176 G:226 B:172 A:1.0];
}

+(instancetype)cactusGreenColor
{
    return [self colorWithR:99 G:111 B:87 A:1.0];
}

+(instancetype)chartreuseColor
{
    return [self colorWithR:69 G:139 B:0 A:1.0];
}

+ (instancetype)hollyGreenColor
{
    return [self colorWithR:32 G:87 B:14 A:1.0];
}

+ (instancetype)oliveColor
{
    return [self colorWithR:91 G:114 B:34 A:1.0];
}

+ (instancetype)oliveDrabColor
{
    return [self colorWithR:107 G:142 B:35 A:1.0];
}

+ (instancetype)moneyGreenColor
{
    return [self colorWithR:134 G:198 B:124 A:1.0];
}

+ (instancetype)honeydewColor
{
    return [self colorWithR:216 G:255 B:231 A:1.0];
}

+ (instancetype)limeColor
{
    return [self colorWithR:56 G:237 B:56 A:1.0];
}

+ (instancetype)cardTableColor
{
    return [self colorWithR:87 G:121 B:107 A:1.0];
}


#pragma mark - Reds
+ (instancetype)salmonColor
{
    return [self colorWithR:233 G:87 B:95 A:1.0];
}

+ (instancetype)brickRedColor
{
    return [self colorWithR:151 G:27 B:16 A:1.0];
}

+ (instancetype)easterPinkColor
{
    return [self colorWithR:241 G:167 B:162 A:1.0];
}

+ (instancetype)grapefruitColor
{
    return [self colorWithR:228 G:31 B:54 A:1.0];
}

+ (instancetype)pinkColor
{
    return [self colorWithR:255 G:95 B:154 A:1.0];
}

+ (instancetype)indianRedColor
{
    return [self colorWithR:205 G:92 B:92 A:1.0];
}

+ (instancetype)strawberryColor
{
    return [self colorWithR:190 G:38 B:37 A:1.0];
}

+ (instancetype)coralColor
{
    return [self colorWithR:240 G:128 B:128 A:1.0];
}

+ (instancetype)maroonColor
{
    return [self colorWithR:80 G:4 B:28 A:1.0];
}

+ (instancetype)watermelonColor
{
    return [self colorWithR:242 G:71 B:63 A:1.0];
}

+ (instancetype)tomatoColor
{
    return [self colorWithR:255 G:99 B:71 A:1.0];
}

+ (instancetype)pinkLipstickColor
{
    return [self colorWithR:255 G:105 B:180 A:1.0];
}

+ (instancetype)paleRoseColor
{
    return [self colorWithR:255 G:228 B:225 A:1.0];
}

+ (instancetype)crimsonColor
{
    return [self colorWithR:187 G:18 B:36 A:1.0];
}


#pragma mark - Purples
+ (instancetype)eggplantColor
{
    return [self colorWithR:105 G:5 B:98 A:1.0];
}

+ (instancetype)pastelPurpleColor
{
    return [self colorWithR:207 G:100 B:235 A:1.0];
}

+ (instancetype)palePurpleColor
{
    return [self colorWithR:229 G:180 B:235 A:1.0];
}

+ (instancetype)coolPurpleColor
{
    return [self colorWithR:140 G:93 B:228 A:1.0];
}

+ (instancetype)violetColor
{
    return [self colorWithR:191 G:95 B:255 A:1.0];
}

+ (instancetype)plumColor
{
    return [self colorWithR:139 G:102 B:139 A:1.0];
}

+ (instancetype)lavenderColor
{
    return [self colorWithR:204 G:153 B:204 A:1.0];
}

+ (instancetype)raspberryColor
{
    return [self colorWithR:135 G:38 B:87 A:1.0];
}

+ (instancetype)fuschiaColor
{
    return [self colorWithR:255 G:20 B:147 A:1.0];
}

+ (instancetype)grapeColor
{
    return [self colorWithR:54 G:11 B:88 A:1.0];
}

+ (instancetype)periwinkleColor
{
    return [self colorWithR:135 G:159 B:237 A:1.0];
}

+ (instancetype)orchidColor
{
    return [self colorWithR:218 G:112 B:214 A:1.0];
}


#pragma mark - Yellows
+ (instancetype)goldenrodColor
{
    return [self colorWithR:215 G:170 B:51 A:1.0];
}

+ (instancetype)yellowGreenColor
{
    return [self colorWithR:192 G:242 B:39 A:1.0];
}

+ (instancetype)bananaColor
{
    return [self colorWithR:229 G:227 B:58 A:1.0];
}

+ (instancetype)mustardColor
{
    return [self colorWithR:205 G:171 B:45 A:1.0];
}

+ (instancetype)buttermilkColor
{
    return [self colorWithR:254 G:241 B:181 A:1.0];
}

+ (instancetype)goldColor
{
    return [self colorWithR:139 G:117 B:18 A:1.0];
}

+ (instancetype)creamColor
{
    return [self colorWithR:240 G:226 B:187 A:1.0];
}

+ (instancetype)lightCreamColor
{
    return [self colorWithR:240 G:238 B:215 A:1.0];
}

+ (instancetype)wheatColor
{
    return [self colorWithR:240 G:238 B:215 A:1.0];
}

+ (instancetype)beigeColor
{
    return [self colorWithR:245 G:245 B:220 A:1.0];
}


#pragma mark - Oranges
+ (instancetype)peachColor
{
    return [self colorWithR:242 G:187 B:97 A:1.0];
}

+ (instancetype)burntOrangeColor
{
    return [self colorWithR:184 G:102 B:37 A:1.0];
}

+ (instancetype)pastelOrangeColor
{
    return [self colorWithR:248 G:197 B:143 A:1.0];
}

+ (instancetype)cantaloupeColor
{
    return [self colorWithR:250 G:154 B:79 A:1.0];
}

+ (instancetype)carrotColor
{
    return [self colorWithR:237 G:145 B:33 A:1.0];
}

+ (instancetype)mandarinColor
{
    return [self colorWithR:247 G:145 B:55 A:1.0];
}


#pragma mark - Browns
+ (instancetype)chiliPowderColor
{
    return [self colorWithR:199 G:63 B:23 A:1.0];
}

+ (instancetype)burntSiennaColor
{
    return [self colorWithR:138 G:54 B:15 A:1.0];
}

+ (instancetype)chocolateColor
{
    return [self colorWithR:94 G:38 B:5 A:1.0];
}

+ (instancetype)coffeeColor
{
    return [self colorWithR:141 G:60 B:15 A:1.0];
}

+ (instancetype)cinnamonColor
{
    return [self colorWithR:123 G:63 B:9 A:1.0];
}

+ (instancetype)almondColor
{
    return [self colorWithR:196 G:142 B:72 A:1.0];
}

+ (instancetype)eggshellColor
{
    return [self colorWithR:252 G:230 B:201 A:1.0];
}

+ (instancetype)sandColor
{
    return [self colorWithR:222 G:182 B:151 A:1.0];
}

+ (instancetype)mudColor
{
    return [self colorWithR:70 G:45 B:29 A:1.0];
}

+ (instancetype)siennaColor
{
    return [self colorWithR:160 G:82 B:45 A:1.0];
}

+ (instancetype)dustColor
{
    return [self colorWithR:236 G:214 B:197 A:1.0];
}



@end
