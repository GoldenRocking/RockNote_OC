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

+(UIColor *)colorWithR:(CGFloat) red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

#pragma mark - Colors
// System Colors
+ (instancetype)infoBlueColor;
+ (instancetype)successColor;
+ (instancetype)warningColor;
+ (instancetype)dangerColor;

// Whites
+ (instancetype)antiqueWhiteColor;
+ (instancetype)oldLaceColor;
+ (instancetype)ivoryColor;
+ (instancetype)seashellColor;
+ (instancetype)ghostWhiteColor;
+ (instancetype)snowColor;
+ (instancetype)linenColor;

// Grays
+ (instancetype)black25PercentColor;
+ (instancetype)black50PercentColor;
+ (instancetype)black75PercentColor;
+ (instancetype)warmGrayColor;
+ (instancetype)coolGrayColor;
+ (instancetype)charcoalColor;

// Blues
+ (instancetype)tealColor;
+ (instancetype)steelBlueColor;
+ (instancetype)robinEggColor;
+ (instancetype)pastelBlueColor;
+ (instancetype)turquoiseColor;
+ (instancetype)skyBlueColor;
+ (instancetype)indigoColor;
+ (instancetype)denimColor;
+ (instancetype)blueberryColor;
+ (instancetype)cornflowerColor;
+ (instancetype)babyBlueColor;
+ (instancetype)midnightBlueColor;
+ (instancetype)fadedBlueColor;
+ (instancetype)icebergColor;
+ (instancetype)waveColor;

// Greens
+ (instancetype)emeraldColor;
+ (instancetype)grassColor;
+ (instancetype)pastelGreenColor;
+ (instancetype)seafoamColor;
+ (instancetype)paleGreenColor;
+ (instancetype)cactusGreenColor;
+ (instancetype)chartreuseColor;
+ (instancetype)hollyGreenColor;
+ (instancetype)oliveColor;
+ (instancetype)oliveDrabColor;
+ (instancetype)moneyGreenColor;
+ (instancetype)honeydewColor;
+ (instancetype)limeColor;
+ (instancetype)cardTableColor;

// Reds
+ (instancetype)salmonColor;
+ (instancetype)brickRedColor;
+ (instancetype)easterPinkColor;
+ (instancetype)grapefruitColor;
+ (instancetype)pinkColor;
+ (instancetype)indianRedColor;
+ (instancetype)strawberryColor;
+ (instancetype)coralColor;
+ (instancetype)maroonColor;
+ (instancetype)watermelonColor;
+ (instancetype)tomatoColor;
+ (instancetype)pinkLipstickColor;
+ (instancetype)paleRoseColor;
+ (instancetype)crimsonColor;

// Purples
+ (instancetype)eggplantColor;
+ (instancetype)pastelPurpleColor;
+ (instancetype)palePurpleColor;
+ (instancetype)coolPurpleColor;
+ (instancetype)violetColor;
+ (instancetype)plumColor;
+ (instancetype)lavenderColor;
+ (instancetype)raspberryColor;
+ (instancetype)fuschiaColor;
+ (instancetype)grapeColor;
+ (instancetype)periwinkleColor;
+ (instancetype)orchidColor;

// Yellows
+ (instancetype)goldenrodColor;
+ (instancetype)yellowGreenColor;
+ (instancetype)bananaColor;
+ (instancetype)mustardColor;
+ (instancetype)buttermilkColor;
+ (instancetype)goldColor;
+ (instancetype)creamColor;
+ (instancetype)lightCreamColor;
+ (instancetype)wheatColor;
+ (instancetype)beigeColor;

// Oranges
+ (instancetype)peachColor;
+ (instancetype)burntOrangeColor;
+ (instancetype)pastelOrangeColor;
+ (instancetype)cantaloupeColor;
+ (instancetype)carrotColor;
+ (instancetype)mandarinColor;

// Browns
+ (instancetype)chiliPowderColor;
+ (instancetype)burntSiennaColor;
+ (instancetype)chocolateColor;
+ (instancetype)coffeeColor;
+ (instancetype)cinnamonColor;
+ (instancetype)almondColor;
+ (instancetype)eggshellColor;
+ (instancetype)sandColor;
+ (instancetype)mudColor;
+ (instancetype)siennaColor;
+ (instancetype)dustColor;


@end
