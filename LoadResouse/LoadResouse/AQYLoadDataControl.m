//
//  AQYLoadDataControl.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/22.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "AQYLoadDataControl.h"

@implementation AQYLoadDataControl

- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{

    self=[super initWithDelegate:aDelegate];
    if (self) {
        
    }
    return self;
}

- (NSString *)requestURL{


    return @"http://suggest.video.iqiyi.com/?if=mobile&rltnum=10&key=%E7%88%B1%E5%8F%B8%E6%9C%BA&uid=5CE94083-CF6B-492F-9AC1-2517D2C18445&ppuid=1203702851&platform=&version=7.7";
    
//    return @"http://iface2.iqiyi.com/views/3.0/vip_home?app_gv=&net_ip=%7B%22country%22:%22%E4%B8%AD%E5%9B%BD%22,%22province%22:%22%E4%B8%8A%E6%B5%B7%22,%22city%22:%22%E4%B8%8A%E6%B5%B7%22,%22cc%22:%22%E7%A7%BB%E5%8A%A8%22,%22area%22:%22%E5%8D%8E%E4%B8%9C%22,%22timeout%22:0,%22respcode%22:0%7D&core=1&from_subtype=1&psp_vip=1&profile=%257B%2522group%2522%253A%25221%252C2%2522%257D&app_lm=cn&secure_p=iPhone&lang=zh_CN&cupid_v=3.0.006&dev_os=9.2&service_sort=&from_block=&psp_cki=a0dC6DAform3AOnDm3jtofNgHvcvm2XJWm3i5abw5BTW0m2l4Dzeq4aC108wLb8bq9WetyB31&page_st=suggest&from_rpage=&app_k=8e48946f144759d86a50075555fd5862&dev_ua=iPhone8,1&net_sts=1&scrn_sts=1&cupid_uid=5CE94083-CF6B-492F-9AC1-2517D2C18445&cust_count=&from_type=56&app_v=7.7&scrn_dpi=153600&app_t=0&platform_id=12&service_order=6500,6600,6000,1016&scrn_res=750*1334&req_sn=1474539586992&api_v=4.1&psp_status=3&psp_uid=1203702851&qyid=5CE94083-CF6B-492F-9AC1-2517D2C18445&secure_v=1&dev_hw=%7B%22cpu%22:%22%22,%22mem%22:%221621%22%7D&block=504091_vip_1&from_rseat=&pps=0&req_times=1";
}

- (RequestMethod)requestMethod{


    return RequestMethodGET;
}

- (BOOL)parseContent:(NSString *)content{


    return NO;
}
@end
