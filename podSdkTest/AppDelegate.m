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
#import "WXApi.h"
#import  <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    CSTabbarController *rootTabVC = [[CSTabbarController alloc]init];
    self.window.rootViewController = rootTabVC;

    [self.window makeKeyAndVisible];
    
    //初始化穿山甲
    [BUAdSDKManager setAppID:@"5029264"];
    
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{

    //分微信和qq
//    [TencentOAuth HandleOpenURL:url];
    
    NSString *string =[url absoluteString];
    if ([string hasPrefix:@"wx8b0b139d1103eaa0"]){
//        return [WXApi handleOpenURL:url delegate:self];
        
    }else if ([string hasPrefix:@"tencent1107926553"]){
        return[TencentOAuth HandleOpenURL:url];
    }

    return YES;

}



@end
