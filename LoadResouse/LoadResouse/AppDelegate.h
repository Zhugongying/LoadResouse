//
//  AppDelegate.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import <MBProgressHUD.h>
#import <KSCrash/KSCrashInstallationStandard.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,RESideMenuDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)netWorkDetailStatus;
@end

