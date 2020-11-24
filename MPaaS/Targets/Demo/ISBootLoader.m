//
//  ZQBootLoader.m
//  iService
//
//  Created by falcon on 2020/10/20.
//  Copyright © 2020 falcon. All rights reserved.
//

#import "ISBootLoader.h"
#import "AppDelegate.h"

@implementation ISBootLoader

- (UINavigationController *)createNavigationController {
    return [AppDelegate sharedInstance].navigationController;
}

- (UIWindow *)createWindow {
    return [AppDelegate sharedInstance].window;
}
@end
