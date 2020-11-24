//
//  DTBootPhase+iService.m
//  iService
//
//  Created by falcon on 2020/10/20.
//  Copyright © 2020 falcon. All rights reserved.
//

#import "DTBootPhase+iService.h"
#import <NebulaSDK/NebulaSDK.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
@implementation DTBootPhase (iService)

+ (DTBootPhase *)setupNavigationController {
    return [DTBootPhase phaseWithName:@"setupNavigationController" block:^{
        UINavigationController *navController = [[[DTFrameworkInterface sharedInstance] bootLoader] createNavigationController];
        DTContextGet().navigationController = navController;
    }];
}

@end
#pragma clang diagnostic pop
