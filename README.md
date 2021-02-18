# 有料信息流SDK-iOS平台接入文档
##示例demo地址：https://github.com/YLNewsSDK-iOS/sdkTest
## 一、添加sdk及三方依赖

### 使用cocoapods管理(升级cocoapods为cdn搜索及配置)（推荐使用）
1.Podfile文件：
```
pod 'YLNewsSDK'
```

## 二、初始化及使用方法
1.在接入时引入sdk头文件 #import <YLInfoFlowSDK/YLInfoFlowSDK.h>

2.强类型对象
```
@property(strong ,nonatomic)YLNewsSDK *yl_newssdk;
```

3.初始化方法
eg:

```
///第一步
///配置参数  此配置若无要求可不传
[YLNewsSDKModeManager shareManager].isHoverMode = YES;  //是否是悬停效果 默认为NO
[YLNewsSDKModeManager shareManager].isHaveTabbar = YES;   //是否有tabbar 默认为NO
[YLNewsSDKModeManager shareManager].isHaveNav = YES;  //是否有导航栏 默认为NO
[YLNewsSDKModeManager shareManager].isNeedRefreashButton = YES;  //是否需要刷新按钮 默认为NO
[YLNewsSDKModeManager shareManager].host_cus_navbar_height = @(navibarHeight); //设置导航栏高度
[YLNewsSDKModeManager shareManager].host_theme_color = @"0000FF";//动态修改主题色
```

```
///第二步
/// 入口方法
/// @param appid appid
/// @param apikey apikey
/// @param tabType 信息流类型（新闻：YLNewsType；视频：YLVideoType）
/// @param city 当前城市：尽量不要为nil
/// @param hostVC 宿主控制器

self.yl_newssdk = [[YLNewsSDK alloc]initWithAppid:@"7c8b8eae081d36cb"
                                            andApikey:@"7030160a7c2e2bfefcab1d23eaf3641d"
                                           andTabType:YLNewsType
                                         andLocalCity:@"北京"
                                andHostViewController:self];
```

```
/// 第三步
/// 触发加载信息流方法
[self.yl_newssdk loadData];
```

4.针对悬停效果的回调--信息流拉到顶部时触发
eg:
```
self.yl_newssdk.newsListScrollToTopBlock = ^(NSDictionary *scrollToTopDic) {
        //通知信息流 此时宿主可根据自身需要控制信息流是否可滑动 yl_news_list_can_not_scroll：为不可滑动， yl_news_list_can_scroll：为可滑动 注：只可用此两个通知消息不可随意命名
        eg: 宿主APP 可根据自身滚动界面的位置进行相应操作
        [[NSNotificationCenter defaultCenter] postNotificationName:@"yl_news_list_can_not_scroll" object:nil];
    };

```

5.分享部分代码示例
```
    self.yl_newssdk.shareBlock = ^(NSDictionary *shareSourceDic) {
        NSLog(@"接收到分享内容 == %@",shareSourceDic);
        
    };

```

### 不使用cocoapods的情况（不推荐，配置的时候很容易出错）
1：需将示例demo中的YLNewsSDK文件夹下的framework及bundle资源文件拷贝进工程  
2：从穿山甲广告官网 (http://partner.toutiao.com) 对接中心下载最新的sdkdemo，将穿山甲sdk及bundle文件放到一个命名为BUAdSDK-UnionAD的文件夹并全部拷贝到工程中。
3：从微信开放平台和qq开放平台下载WechatOpenSDK和TencentOpenApiSDK,并将sdk拷贝到工程中

## 三、自定义配置规范
可在bundle资源文件下HostCustom.plist文件中进行配置，以下是配置字段说明（注：1：plist文件中字段Key及Type不可更改 ！！！只需对Value进行自定义。2：更新sdk时bundle文件又会恢复为默认值，因此可以创建保存同名plist文件用以覆盖bundle，避免重复修改配置）<br/>
```
TabTitleColor              //滚动标签条文字未选中颜色

TabTitleSelectColor        //滚动标签条文字选中颜色

TabTitleFont               //滚动标签条文字未选中大小

TabTitleSelectFont         //滚动标签条文字选中大小

NewsMenuViewHeight         //滚动标签条高度

TopTipBackColor            //更新提示背景颜色

TopTipTextColor            //更新提示文字颜色

ChooseCityTipBackColor     //选择城市提示背景颜色

ChooseCityTipTextColor     //选择城市提示文字颜色

DetailPageProgressColor    //详情页加载进度条颜色

NewsTitleFont              //新闻标题字体大小

NewsTitleColor             //新闻标题字体颜色

NewsAuthorFont             //新闻作者字体大小             

NewsAuthorColor            //新闻作者字体颜色 

NewsLeftRightSpacing       //信息流界面左右间距

NewsImageCornerRadius      //信息流界面图片圆角

DislikeTextColor           //dislike负反馈-原因按钮文字未选中颜色

DislikeTextSelectColor     //dislike负反馈-原因按钮文字选中颜色

DislikeRimColor            //dislike负反馈-原因按钮边框颜色

DislikeRimSelectColor      //dislike负反馈-原因按钮边框选中颜色

DislikeBackColor           //dislike负反馈-原因按钮背景未选中颜色

DislikeBackSelectColor     //dislike负反馈-原因按钮背景选中颜色

DislikeSubmitBackColor     //dislike负反馈-确定提交按钮背景颜色   

```
