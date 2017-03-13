//
//  AppDelegate.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LeftViewController.h"

#import <Reachability.h>
#import "WXApi.h"
#import <Foundation/Foundation.h>

#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

//#import <UMMobClick/MobClick.h>

@interface AppDelegate ()<WXApiDelegate,UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    UINavigationController *na=[[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    
    LeftViewController *left=[[LeftViewController alloc] init];
    
    RESideMenu *sideMenuViewController=[[RESideMenu alloc] initWithContentViewController:na leftMenuViewController:left rightMenuViewController:nil];
    
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    KSCrashInstallationStandard *installation = [KSCrashInstallationStandard sharedInstance];
    installation.url = [NSURL URLWithString:@"https://collector.bughd.com/kscrash?key=fc0c229d6fa40fa8096df25c92e8275b"];
    [installation install];
    [installation sendAllReportsWithCompletion:nil];
    
    [Fabric with:@[[Crashlytics class]]];
    
    self.window.rootViewController=sideMenuViewController;
    
    
    [WXApi registerApp:@"wx9e4f48a4d7ddb805"];
    
//    [UMSocialData setAppKey:@"57e0fb0de0f55a6a95000d46"];
//    [UMSocialWechatHandler setWXAppId:@"wx9e4f48a4d7ddb805" appSecret:@"9c7b8cacef06b10095d419c74acafa06" url:@"http://www.baidu.com"];
    
    // my  wx9e4f48a4d7ddb805  9c7b8cacef06b10095d419c74acafa06
    
    
 //pptv   wxa4b68300ec455c0c
    //b07327965857bea44e14c8c7f0ba88f0
    
//    
//    UMConfigInstance.appKey=@"57e0fb0de0f55a6a95000d46";
//    UMConfigInstance.channelId=@"App Store";
//    
//    [MobClick startWithConfigure:UMConfigInstance];
    
    
    
   
    // TODO: Move this to where you establish a user session
    [self logUser];

    
    
    
    [self netWorkDetailStatus];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void) logUser {
    // TODO: Use the current user's information
    // You can call any combination of these three methods
    [CrashlyticsKit setUserIdentifier:@"12345"];
    [CrashlyticsKit setUserEmail:@"user@fabric.io"];
    [CrashlyticsKit setUserName:@"Test User"];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{

//    BOOL result=[UMSocialSnsService handleOpenURL:url];
//    if (result == FALSE) {
//        //调用其他SDK，例如支付宝SDK等
//    }
//    return result;
    
    return [WXApi handleOpenURL:url delegate:self];

}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{



    return [WXApi handleOpenURL:url delegate:self];

}
- (void)onResp:(BaseResp *)resp{

    NSLog(@"okokokok");

}

- (void)netWorkDetailStatus{

    Reachability *reach=[Reachability reachabilityWithHostName:@"http://www.baidu.com"];
    
    BOOL isExistenceNetwork = YES;
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
        {
            isExistenceNetwork=NO;
            
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"当前无网络" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            
            [alertView show];
            
        
        
        }
            break;
        case ReachableViaWiFi:
        {
            isExistenceNetwork=YES;
            
        }
            break;
        case ReachableViaWWAN:
        {
            
            UIAlertView *aleartView=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"老哥！你在用流量呀！怪费钱咧！用WIFI？" delegate:self cancelButtonTitle:@"我是土豪!不" otherButtonTitles:@"我是屌丝！切", nil];
            
            [aleartView show];
            
            isExistenceNetwork=YES;
            
        }
            break;
            
        default:
            break;
    }
    


}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSLog(@"%ld",buttonIndex);
    
    if (buttonIndex==1) {
        
        if ([alertView.title hasPrefix:@"老哥！"]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
            
        }
        
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=INTERNET_TETHERING"]];
    }
    
    
    

}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{


    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:notification.alertTitle message:notification.alertBody delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
    
    

    NSDictionary *dic =[[NSDictionary alloc] init];
    
    dic = notification.userInfo ;
    
     NSLog(@"user info = %@",[dic objectForKey:@"key"]);
    
    application.applicationIconBadgeNumber -= 1;
    
    

}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//
//
//    return [WXApi handleOpenURL:url delegate:self];
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

    application.applicationIconBadgeNumber -= 1 ;

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
