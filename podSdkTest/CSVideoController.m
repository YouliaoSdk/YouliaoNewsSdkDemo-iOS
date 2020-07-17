//
//  CSVideoController.m
//  YLIFSdkDemo
//
//  Created by Apple on 2020/5/25.
//  Copyright © 2020 com.qujie.tech. All rights reserved.
//

#import "CSVideoController.h"
#import "ComHeader.h"
#import <YLInfoFlowSDK/YLInfoFlowSDK.h>

@interface CSVideoController ()

@property(strong ,nonatomic)YLNewsSDK *yl_newssdk;

@end

@implementation CSVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [YLNewsSDKModeManager shareManager].isHoverMode = NO;
    [YLNewsSDKModeManager shareManager].isHaveTabbar = YES;
    [YLNewsSDKModeManager shareManager].isHaveNav = NO;
    [YLNewsSDKModeManager shareManager].isNeedRefreashButton = NO;
    [YLNewsSDKModeManager shareManager].WXShareAPPID = @"wx8b0b139d1103eaa0";
    [YLNewsSDKModeManager shareManager].QQShareAPPID = @"1107926553";
    
    //    self.yl_newssdk = [[YLNewsSDK alloc]initWithAppid:@"7c8b8eae081d36cb"
    //                                            andApikey:@"7030160a7c2e2bfefcab1d23eaf3641d"
    //                                           andTabType:YLVideoType
    //                                         andLocalCity:@"上海"
    //                                andHostViewController:self];
    //创建newsSDK
    self.yl_newssdk = [[YLNewsSDK alloc]initWithAppid:@"ec6cf846cb1e96c4"
                                            andApikey:@"3d74eedb9161f4c4f39731bf9d786c72"
                                           andTabType:YLVideoType
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
}


@end
