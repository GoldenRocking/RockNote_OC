//
//  ThemeManager.h
//  RockyNote
//
//  Created by guoruiqing on 2017/3/16.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject

+(instancetype)sharedTheme;

-(void)SetDefaultTheme;
-(NSString *)GetCurrentThemeName;
-(UIColor *)SetNewTheme:(NSDictionary *)theme;

@end
