//
//  ComHeader.h
//  YLInfoFlowSDK
//
//  Created by Apple on 2020/4/26.
//  Copyright © 2020 com.qujie.tech. All rights reserved.
//

#ifndef ComHeader_h
#define ComHeader_h

/// Width & Height
#define YLIFSCREEN_SIZE [UIScreen mainScreen].bounds.size
#define YLIFSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define YLIFSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define YLIFSTATUS_H    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?44:20) // 适配刘海屏状态栏
#define YLIFTABBAR_H    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) // 适配刘海屏底栏高度
#define YLIFBOTTOM_H    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)  // 适配刘海屏底部多出来的高度


///Color
#define YLIFRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0green:(g)/255.0blue:(b)/255.0alpha:1.0]
#define YLIFRGBAColor(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]




///Debug
#if DEBUG
#define YLLog(FORMAT, ...) fprintf(stderr,"function:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define YLLog(FORMAT, ...) nil
#endif


///是否为空
// String
#define kISNullString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
// Array
#define kISNullArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]])
// Dictionary
#define kISNullDict(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
// Object
#define kISNullObject(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))






#endif /* ComHeader_h */
