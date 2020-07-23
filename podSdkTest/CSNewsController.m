//
//  CSNewsController.m
//  YLIFSdkDemo
//
//  Created by Apple on 2020/5/25.
//  Copyright © 2020 com.qujie.tech. All rights reserved.
//

#import "CSNewsController.h"
#import "ComHeader.h" //这是测试demo的 和sdk的同名 但不是同一个
#import <YLInfoFlowSDK/YLInfoFlowSDK.h>
#import "WXApi.h"



@interface CSNewsController ()

@property(strong ,nonatomic)YLNewsSDK *yl_newssdk;

@end

@implementation CSNewsController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [YLNewsSDKModeManager shareManager].isHoverMode = NO;
    [YLNewsSDKModeManager shareManager].isHaveTabbar = YES;
    [YLNewsSDKModeManager shareManager].isHaveNav = NO;
    [YLNewsSDKModeManager shareManager].isNeedRefreashButton = YES;
    [YLNewsSDKModeManager shareManager].WXShareAPPID = @"wx8b0b139d1103eaa0";
    //    [YLNewsSDKModeManager shareManager].QQShareAPPID = @"tencent1107926553";
    [YLNewsSDKModeManager shareManager].QQShareAPPID = @"1107926553";//不可带tencent
    
    //创建newsSDK 正式服
    self.yl_newssdk = [[YLNewsSDK alloc]initWithAppid:@"7c8b8eae081d36cb"
                                            andApikey:@"7030160a7c2e2bfefcab1d23eaf3641d"
                                           andTabType:YLNewsType
                                         andLocalCity:@"上海"
                                andHostViewController:self];
    //测试服
//    self.yl_newssdk = [[YLNewsSDK alloc]initWithAppid:@"ec6cf846cb1e96c4"
//                andApikey:@"3d74eedb9161f4c4f39731bf9d786c72"
//               andTabType:YLNewsType
//             andLocalCity:@"上海"
//    andHostViewController:self];
    
    [self.yl_newssdk loadData];
    
   
    
    self.yl_newssdk.newsListScrollToTopBlock = ^(NSDictionary *scrollToTopDic) {
        //通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"yl_news_list_can_scroll" object:nil];
    };
    
    
    
    [self performSelector:@selector(tongzhi) withObject:nil afterDelay:10];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
}

- (void)tongzhi{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"yl_news_list_can_scroll" object:nil];//到顶通知父视图改变状态
}


@end
