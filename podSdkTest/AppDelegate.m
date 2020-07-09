//
//  AppDelegate.m
//  podSdkTest
//
//  Created by Apple on 2020/7/6.
//  Copyright © 2020 com.qujie.tech. All rights reserved.
//

#import "AppDelegate.h"

#import "CSTabbarController.h"
#import <BUAdSDK/BUAdSDK.h>
#import <BUAdSDK/BUAdSDKManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    CSTabbarController *rootTabVC = [[CSTabbarController alloc]init];
    self.window.rootViewController = rootTabVC;

    [self.window makeKeyAndVisible];
    
    //初始化穿山甲
    [BUAdSDKManager setAppID:@"5030781"];
    

    return YES;
}



@end
