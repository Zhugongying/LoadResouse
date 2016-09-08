//
//  GlobalDefine.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

// 设备判断
#define IS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define VERTICAL_SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define VERTICAL_SCREEN_WIDTH  MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define IS_IPHONE_5     (IS_IPHONE && (VERTICAL_SCREEN_HEIGHT == 568.f))
#define IS_IPHONE_4     (IS_IPHONE && (VERTICAL_SCREEN_HEIGHT == 480.f))

// iOS版本判断
#define IS_PREV_TO_IOS7       (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
#define IS_AT_LEAST_IOS7     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_AT_LEAST_IOS8     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define KBaisibudejieDuanzi "http://s.budejie.com/topic/list/zuixin/29/bs0315-iphone-4.3/0-20.json"

#endif /* GlobalDefine_h */
