//
//  ThemeManager.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/16.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "ThemeManager.h"
#import "UIColor+GKHex.h"

@implementation ThemeManager
+(instancetype)sharedTheme{
    static id instance = nil;
    static dispatch_once_t onceToken = 0L;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;

}

-(void)SetDefaultTheme{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults objectForKey:@"currentTheme"])
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor violetColor]];
        [defaults setObject:@"violetColor" forKey:@"currentTheme"];
        [defaults synchronize];
    }else
    {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"plist"];
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
        
        NSMutableArray *colors = [data objectForKey:@"colors"];
        
        for (id object in colors)
        {
            if([[object objectForKey:@"name"] isEqualToString:[defaults objectForKey:@"currentTheme"]])
            {
                NSNumber *R = [object objectForKey:@"R"];
                NSNumber *G = [object objectForKey:@"G"];
                NSNumber *B = [object objectForKey:@"B"];
                UIColor *color = [UIColor colorWithR:[R floatValue] G:[G floatValue] B:[B floatValue] A:1.0];
                [[UINavigationBar appearance] setBarTintColor:color];
                break;
                
            }
        }
    }

}

-(NSString *)GetCurrentThemeName{
    NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentTheme"];
    return name;
}

-(UIColor *)SetNewTheme:(NSDictionary *)theme
{
    NSString *name = [theme objectForKey:@"name"];
    NSNumber *R = [theme objectForKey:@"R"];
    NSNumber *G = [theme objectForKey:@"G"];
    NSNumber *B = [theme objectForKey:@"B"];
    
    UIColor *color = [UIColor colorWithR:[R floatValue] G:[G floatValue] B:[B floatValue] A:1.0];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"currentTheme"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return color;
}
@end
