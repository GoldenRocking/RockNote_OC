//
//  AppDelegate.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "AppDelegate.h"
#import "NoteListViewController.h"
#import "UIColor+GKHex.h"
#import "GKConstants.h"
#import "GKNote.h"
//#import "GKNoteManager.h"
#import "GKNoteDBM.h"
#import "ThemeManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self addInitFileIfNeed];
    [self setThemeColor];
    NoteListViewController *controller = [[NoteListViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    
   // [[UINavigationBar appearance] setBarTintColor:[UIColor systemColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],NSForegroundColorAttributeName,
                                               nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)setThemeColor
{
    [[ThemeManager sharedTheme] SetDefaultTheme];
}

-(void)addInitFileIfNeed
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults objectForKey:@"hasInitFile"])
    {
        GKNote *note = [[GKNote alloc]initWithTitle:AboutTitle content:AboutText createdDate:[NSDate date] updateDate:[NSDate date]];
        [[GKNoteDBM sharedDataBase] addNewNote:note];
        [defaults setBool:YES forKey:@"hasInitFile"];
        [defaults synchronize];
        
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
