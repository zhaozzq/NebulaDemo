//
//  DTFrameworkInterface+iService.m
//  iService
//
//  Created by falcon on 2020/10/19.
//  Copyright © 2020 falcon. All rights reserved.
//

#import "DTFrameworkInterface+iService.h"
#import <MPNebulaAdapter/MPNebulaAdapterInterface.h>
#import <APMobileLBS/APMobileLBS.h>
#import <MPMgsAdapter/MPRpcInterface.h>
#import <APMap/APMap.h>
#import "ISBootLoader.h"
#import "TabBarController.h"
#import "ViewController.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation DTFrameworkInterface (iService)

- (void)application:(UIApplication *)application beforeDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [MPRpcInterface initRpc];
    // 初始化容器
    [MPNebulaAdapterInterface initNebula];
    
//    NSString *presetApplistPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"iServicePresetApps.bundle/h5_json.json"] ofType:nil];
//    NSString *presetAppPackagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"iServicePresetApps.bundle"] ofType:nil];
//    NSString *pluginsJsapisPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"ISCustomPlugins.bundle/Poseidon-UserDefine-Extra-Config.plist"] ofType:nil];
//
//    [MPNebulaAdapterInterface initNebulaWithCustomPresetApplistPath:presetApplistPath
//                                         customPresetAppPackagePath:presetAppPackagePath
//                                            customPluginsJsapisPath:pluginsJsapisPath];
    
}

- (void)application:(UIApplication *)application afterDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[MPNebulaAdapterInterface shareInstance].nebulaVeiwControllerClass = [ISH5WebController class];
    [MPNebulaAdapterInterface shareInstance].nebulaNeedVerify = NO;
    //[MPNebulaAdapterInterface shareInstance].nebulaCommonResourceAppList = @[@""];
    // 全量更新离线包
    [[MPNebulaAdapterInterface shareInstance] requestAllNebulaApps:^(NSDictionary *data, NSError *error) {
        NSLog(@"");
    }];
    
    UITabBarController *tabBarController = [self configTabBarController];
    [[[self bootLoader] createNavigationController] setViewControllers:@[tabBarController]];
    
}

- (UITabBarController *)configTabBarController {
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

- (DTBootLoader *)bootLoader {
    static ISBootLoader *_bootLoader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _bootLoader = [ISBootLoader new];
    });
    return _bootLoader;
}

- (BOOL)shouldWindowMakeVisable {
    return NO;
}

- (BOOL)shouldShowLauncher {
    return NO;
}

@end
#pragma clang diagnostic pop
