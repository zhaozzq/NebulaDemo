//
//  AppDelegate.m
//  Demo
//
//  Created by falcon on 2020/11/24.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TabBarController.h"
#import <MPNebulaAdapter/MPNebulaAdapterInterface.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedInstance {
    if ([[NSThread currentThread] isMainThread]) {
        return (AppDelegate *)[UIApplication sharedApplication].delegate;
    } else {
        __block AppDelegate *delegate;
        dispatch_sync(dispatch_get_main_queue(), ^{
            delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        });
        return delegate;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    if (@available(iOS 13.0, *)) {
        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
    
    UITabBarController *tabBarController = [self configTabBarController];
    self.window.rootViewController = [[DFNavigationController alloc] initWithRootViewController:tabBarController];
    self.navigationController = (DFNavigationController *)self.window.rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    [[DTFrameworkInterface sharedInstance] manualInitMpaasFrameworkWithApplication:application launchOptions:launchOptions];
    
    return YES;
}

- (UITabBarController *)configTabBarController {
    
    //此处初始化 Nebula 容器返回 nill
    //在 DTFrameworkInterface+iService 内 application:afterDidFinishLaunchingWithOptions: 里初始化是有值的
    UIViewController *home = [[MPNebulaAdapterInterface shareInstance] createH5ViewController:@{
        @"url": @"https://tech.antfin.com/",
        @"readTitle": @YES,
    }];
    
    home.tabBarItem.title = @"首页";
    home.tabBarItem.image = [UIImage imageNamed:@"first"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"first"];
    
    ViewController *second = [ViewController new];
    second.tabBarItem.title = @"Second";
    second.tabBarItem.image = [UIImage imageNamed:@"second"];
    second.tabBarItem.selectedImage = [UIImage imageNamed:@"second"];
    
    
    UITabBarController *tabBarController = [TabBarController new];
    if (home) {
        tabBarController.viewControllers = @[home,second];
    } else {
        tabBarController.viewControllers = @[second];
    }
    return tabBarController;
}


@end
