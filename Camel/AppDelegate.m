//
//  AppDelegate.m
//  Camel
//
//  Created by Nicholas Zhao on 15/5/19.
//  Copyright (c) 2015年 Nicholas Zhao. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "MainViewController.h"
#import "SideMenuViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) SideMenuViewController *sideMenuViewController;
@property (nonatomic, strong) MenuViewController *menuViewController;
@property (nonatomic, strong) MainViewController *mainViewController;

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.menuViewController = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
    
    self.mainViewController = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    
    
    self.sideMenuViewController = [[SideMenuViewController alloc] initWithMenuViewController:self.menuViewController mainViewController:[[UINavigationController alloc] initWithRootViewController:self.mainViewController]];
    self.sideMenuViewController.shadowColor = [UIColor blackColor];
    self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
    self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
    self.sideMenuViewController.delegate = self;
    self.window.rootViewController = self.sideMenuViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - SideMenuViewControllerDelegate

- (UIStatusBarStyle)sideMenuViewController:(SideMenuViewController *)sideMenuViewController statusBarStyleForViewController:(UIViewController *)viewController
{
    if (viewController == self.menuViewController) {
        return UIStatusBarStyleLightContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

- (void)sideMenuViewControllerWillOpenMenu:(SideMenuViewController *)sender {
    NSLog(@"willOpenMenu");
}

- (void)sideMenuViewControllerDidOpenMenu:(SideMenuViewController *)sender {
    NSLog(@"didOpenMenu");
}

- (void)sideMenuViewControllerWillCloseMenu:(SideMenuViewController *)sender {
    NSLog(@"willCloseMenu");
}

- (void)sideMenuViewControllerDidCloseMenu:(SideMenuViewController *)sender {
    NSLog(@"didCloseMenu");
}

@end
