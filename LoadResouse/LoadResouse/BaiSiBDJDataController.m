//
//  BaiSiBDJDataController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/8.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BaiSiBDJDataController.h"
#import "TitleModel.h"

@implementation BaiSiBDJDataController

- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{


    self=[super initWithDelegate:aDelegate];
    if (self) {
        self.dataSouseArr=[NSMutableArray array];
        
        
        
    }
    return self;

}

- (NSString *)requestURL{


    return @"http://s.budejie.com/public/list-appbar/bs0315-iphone-4.3/";

}

- (RequestMethod)requestMethod{

    return RequestMethodGET;
}

- (BOOL)parseContent:(NSString *)content{


    NSDictionary *dict=(NSDictionary *)content;
    
   
    if (dict[@"menus"]) {
        for (NSDictionary *subDict in dict[@"menus"]) {
             TitleModel *titleModel=[[TitleModel alloc] init];
            
            titleModel.titleList=[NSMutableArray array];
            [titleModel setValuesForKeysWithDictionary:subDict];
            
            for (NSDictionary *subTitleDict in subDict[@"submenus"]) {
                
                HeadTileModel *headModel=[[HeadTileModel alloc] init];
                
                [headModel setValuesForKeysWithDictionary:subTitleDict];
                
                [titleModel.titleList addObject:headModel];
                
            }
            
            [self.dataSouseArr addObject:titleModel];
            
            
        }
        
        return YES;
    }
    
    


    return NO;
}

@end
