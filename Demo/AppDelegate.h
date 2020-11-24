//
//  AppDelegate.h
//  Demo
//
//  Created by falcon on 2020/11/24.
//

#import <UIKit/UIKit.h>
#import <APMobileFramework/APMobileFramework.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (strong, nonatomic) DFNavigationController *navigationController;

+ (AppDelegate *)sharedInstance;

@end

