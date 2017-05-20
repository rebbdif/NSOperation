//
//  AppDelegate.m
//  LectionNSOperation
//
//  Created by iOS-School-1 on 20.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    DemoViewController *dvc = [DemoViewController new];
    _window.rootViewController = dvc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
