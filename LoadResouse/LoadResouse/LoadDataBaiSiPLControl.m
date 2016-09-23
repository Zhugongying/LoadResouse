//
//  LoadDataBaiSiPLControl.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/22.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "LoadDataBaiSiPLControl.h"
#import "PLModel.h"
@implementation LoadDataBaiSiPLControl
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{

    self=[super initWithDelegate:aDelegate];
    
    if (self) {
         self.conmentArr=[NSMutableArray array];
    }
    return self;

}

- (NSString *)requestURL{


//    NSString *url=[NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=dataList&appname=bs0315&asid=5CE94083-CF6B-492F-9AC1-2517D2C18445&c=comment&client=iphone&data_id=%@&device=ios&device&from=ios&hot=1&jbk=0&mac=&market=&openudid=aa7f3209088794a2a4fae5fff4d3e3a9e59a6a7e&page=1&per=50&udid=&ver=4.3",self.bsModel.idStr];
//    
    
    return self.loadUrl;
}

- (RequestMethod)requestMethod{

    return RequestMethodGET;
}

- (BOOL)parseContent:(NSString *)content{


    NSDictionary *info=(NSDictionary *)content;
    
    NSLog( @"%@",info);
    
    NSArray *infoArr=info[@"data"];
    
   
    
    for (NSDictionary *subInfo in infoArr) {
        
        if ([subInfo[@"voicetime"] isEqualToString:@"0"]) {
            

            [self.conmentArr addObject:subInfo[@"content"]];
        }
        
        
        
    }
    NSDictionary *lastInfo=infoArr.lastObject;
    
    self.lastPageID=lastInfo[@"id"];
    self.conmentArrCount=(NSString *)info[@"total"];
    
    
    
    return NO;
}





@end
