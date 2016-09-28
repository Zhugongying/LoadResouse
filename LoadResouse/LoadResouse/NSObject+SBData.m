//
//  NSObject+SBData.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "NSObject+SBData.h"

@implementation NSObject (SBData)
+ (NSString *)dateTypeCompearForNowTime:(NSString *)date{
    
    NSTimeInterval now= [[NSDate date] timeIntervalSince1970];
    double distanceTime = now - date.doubleValue;
    NSString *distanceStr;
    
    NSDate *beDate=[NSDate dateWithTimeIntervalSince1970:date.doubleValue];
    NSDateFormatter *df =[[NSDateFormatter alloc] init];
    
    
    [df setDateFormat:@"M月d日"];
    NSString * lastDay=[df stringFromDate:beDate];
    
    if (distanceTime<60*60 ) {
        
        distanceStr = [NSString stringWithFormat:@"%.f分钟前",distanceTime/60];
    }else if (distanceTime<24*60*60){
        
        distanceStr = [NSString stringWithFormat:@"%.f小时",distanceTime/60/60];
    }else if (distanceTime >24*60*60){
        
        distanceStr = [NSString stringWithFormat:@"%@",lastDay];
        
    }
    
    return distanceStr;
}
@end
