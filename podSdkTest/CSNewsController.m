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
    [YLNewsSDKModeManager shareManager].isNeedRefreashButton = NO;
    //创建newsSDK
    self.yl_newssdk = [[YLNewsSDK alloc]initWithAppid:@"7c8b8eae081d36cb"
                                            andApikey:@"7030160a7c2e2bfefcab1d23eaf3641d"
                                           andTabType:YLNewsType
                                         andLocalCity:@"上海"
                                andHostViewController:self];
    [self.yl_newssdk loadData];
    
    __weak typeof(self) weakSelf = self;
    
    self.yl_newssdk.shareBlock = ^(NSDictionary *shareSourceDic) {
        
        NSLog(@"接收到分享内容 == %@",shareSourceDic);
        //        UIViewController *avc = [[UIViewController alloc]init];
        //        [self presentViewController:avc animated:YES completion:nil];
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                       message:@"This is an alert."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
        }];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {}];
        [alert addAction:cancelAction];
        [alert addAction:defaultAction];
        [weakSelf presentViewController:alert animated:YES completion:nil];
    };
    
    
    
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
