//
//  CSTabbarController.m
//  YLIFSdkDemo
//
//  Created by Apple on 2020/5/25.
//  Copyright © 2020 com.qujie.tech. All rights reserved.
//

#import "CSTabbarController.h"
#import "CSNewsController.h"
#import "CSVideoController.h"

@interface CSTabbarController ()

@end

@implementation CSTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBar *tabbar = [UITabBar appearance];
    tabbar.tintColor = UIColor.redColor;
    tabbar.barTintColor = UIColor.whiteColor;
    [tabbar setTranslucent:YES];
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    
    CSNewsController *newsVC = [[CSNewsController alloc]init];
    UIImage *Img = [UIImage imageNamed:@"icon_news_normal"];
    Img = [Img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [newsVC.tabBarItem setImage:Img];
    UIImage *selectImg = [UIImage imageNamed:@"icon_news_selected"];
    selectImg = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [newsVC.tabBarItem setSelectedImage:selectImg];
    newsVC.tabBarItem.title = @"新闻";
    [self addChildViewController:newsVC];
    
    CSVideoController *videoVC = [[CSVideoController alloc]init];
    UIImage *Img1 = [UIImage imageNamed:@"icon_video_normal"];
    Img1 = [Img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [videoVC.tabBarItem setImage:Img1];
    UIImage *selectImg1 = [UIImage imageNamed:@"icon_video_selected"];
    selectImg1 = [selectImg1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [videoVC.tabBarItem setSelectedImage:selectImg1];
    videoVC.tabBarItem.title = @"视频";
    [self addChildViewController:videoVC];
}


@end
