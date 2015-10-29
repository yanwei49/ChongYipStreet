//
//  AppDelegate.m
//  ChongYipStreet
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "AppDelegate.h"
#import "YWCommendViewController.h"
#import "YWTribuneViewController.h"
#import "YWSubjectViewController.h"
#import "YWMineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UITabBarController *_tabBarC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createTabBar];
    
    return YES;
}

- (void)createTabBar {
    _tabBarC = [[UITabBarController alloc] init];
    _tabBarC.tabBar.tintColor = [UIColor redColor];
    self.window.rootViewController = _tabBarC;
    
    NSArray *vcNames = @[@"YWCommendViewController", @"YWTribuneViewController", @"YWSubjectViewController", @"YWMineViewController"];
    NSArray *vcTitles = @[@"推荐", @"论坛", @"项目", @"我"];
    NSArray *vcImages = @[@"light_normal.png", @"message_normal.png", @"home_normal.png", @"user_normal.png"];
    NSArray *vcSelectImages = @[@"light_select.png", @"message_select.png", @"home_select.png", @"user_select.png"];
    for (NSInteger i=0; i<vcNames.count; i++) {
        [self createChildViewControllerWithVCName:vcNames[i] title:vcTitles[i] imageName:vcImages[i] selectImageName:vcSelectImages[i]];
    }
}

- (void)createChildViewControllerWithVCName:(NSString *)vcName title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    id vc = [[NSClassFromString(vcName) alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    [_tabBarC addChildViewController:nav];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
