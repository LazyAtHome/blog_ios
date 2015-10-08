//
//  Aspect-Window.m
//  rssreader
//
//  Created by zhuchao on 15/2/14.
//  Copyright (c) 2015年 zhuchao. All rights reserved.
//

#import <XAspect/XAspect.h>
#import "AppDelegate.h"
#import "BlogListViewController.h"
#import "BlogPostViewController.h"
#import "LoginViewController.h"
#import "Const.h"

#define AtAspect Window

#define AtAspectOfClass AppDelegate
@classPatchField(AppDelegate)

AspectPatch(-, void,application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UITabBarController* rootViewController = [[UITabBarController alloc]init];
    rootViewController.tabBar.tintColor = COLOR_MAIN;
    
    BlogListViewController* viewBlogViewController = [[BlogListViewController alloc]init];
    viewBlogViewController.tabBarItem.title = NSLocalizedString(@"View Blog", nil);
    viewBlogViewController.tabBarItem.image = [UIImage imageNamed:@"home_normal"];
    [rootViewController addChildViewController:viewBlogViewController];
    
    LoginViewController* loginViewController = [[LoginViewController alloc]init];
    loginViewController.tabBarItem.title = NSLocalizedString(@"Login", nil);
    loginViewController.tabBarItem.image = [UIImage imageNamed:@"my_normal"];
    [rootViewController addChildViewController:loginViewController];
    
    rootViewController.selectedIndex = 1;
    
    UINavigationController* rootNavigation = [[UINavigationController alloc]initWithRootViewController:rootViewController];
    rootNavigation.navigationBarHidden = YES;
    self.window.rootViewController = rootNavigation;
    [self.window makeKeyAndVisible];

    XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}
@end
#undef AtAspectOfClass

#undef AtAspect
