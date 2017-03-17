//
//  TextViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/10/13.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "TextViewController.h"
#import <Crashlytics/Crashlytics.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface TextViewController ()<CBCentralManagerDelegate>

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self forMaoPaoPaixu];
//    [self PaiXu];

//    [self setPaiXu];
    
//    [self localNotification];
    
    [self loadCresh];
}
- (void)loadCresh {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 100, 100, 30);
    [button setTitle:@"Crash" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(crashButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


}
- (IBAction)crashButtonTapped:(id)sender {
    CBCentralManager *center = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
    [center scanForPeripheralsWithServices:nil options:nil];
    
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {

}


- (void)localNotification{

    NSDate *now =[NSDate dateWithTimeIntervalSinceNow:6];
    NSCalendar *calendar =[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components =[calendar components:NSCalendarUnitDay fromDate:now];
    
    [components setWeekday:1];
    [components setHour:17];
    [components setMinute:01];
    [components setSecond:0];
    NSDate *setfireDate =[calendar dateFromComponents: components];
    
    
    UILocalNotification *localNotification =[[UILocalNotification alloc] init];
    
    if (localNotification != nil) {
        
        
        localNotification.fireDate =setfireDate;
        localNotification.repeatInterval = NSCalendarUnitDay; //循环次数
        localNotification.timeZone =[NSTimeZone defaultTimeZone];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification .alertBody = @"该起床了";
        localNotification.alertAction = @"打开";
        localNotification.hasAction = YES ;//显示额外的按钮
        localNotification.applicationIconBadgeNumber = 1 ;//app 右上觉的数字
        
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        localNotification.userInfo = infoDict;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        
    }

    
    

}


- (void)setPaiXu{

    NSArray *arr1=@[@(12),@(35),@(54),@(456),@(5),@(11),@(3),@(45),@(945),@(2)];
    
    NSSet *setNew=[NSSet setWithArray:arr1];
    
    NSLog(@"%@", [setNew allObjects]);
    
    NSArray *sourt=@[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    
    NSArray *newArr =[setNew sortedArrayUsingDescriptors:sourt];
    
    NSLog(@"%@", newArr);
    
    



}

- (void)PaiXu{


    NSArray *arr1=@[@(12),@(35),@(54),@(456),@(5),@(11),@(3),@(45),@(945),@(2)];
    
    NSMutableArray *arr=[NSMutableArray arrayWithArray:arr1];
    
    for (NSInteger i=0; i<arr.count-1; i++) {
        
        for (NSInteger j=i-1; j<i; j--) {
            
            if (arr[i]>arr[j]) {
                
                NSObject *tmp;
                tmp = arr[i];
                arr[i]=arr[j];
                arr[j]=tmp;
                
                NSLog(@"+++++++++++++++++++++++++++++++++");
                NSLog(@"*****%@",arr[i]);
                NSLog(@"*****%@",arr[j]);
                NSLog(@"*********************************");
                
                
            }
            
            
        }
    }


    NSLog(@"%@",arr);
    
    
}


- (void)forMaoPaoPaixu{

    NSArray *arr1=@[@(12),@(35),@(54),@(456),@(5),@(11),@(3),@(45),@(945),@(2)];
    
    NSMutableArray *arr=[NSMutableArray arrayWithArray:arr1];
    for (NSInteger i=[arr count]-1; i>=0; i--) {
        
        for (NSInteger j=0; j<i; j++) {
            
            NSLog(@"---------------------------------");
            NSLog(@"%@",arr[i]);
             NSLog(@"%@",arr[j]);
            NSLog(@"00000000000000000000000000000000000");
            if (arr[i]>arr[j]) {
                
                NSObject *tmp;
               tmp = arr[i];
                arr[i]=arr[j];
                arr[j]=tmp;
                
                NSLog(@"+++++++++++++++++++++++++++++++++");
                NSLog(@"*****%@",arr[i]);
                NSLog(@"*****%@",arr[j]);
                NSLog(@"*********************************");
                
                
            }
            
            
        }
        
    }
    
    NSLog(@"%@",arr);
    
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
