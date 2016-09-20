//
//  LoadDataBaisiControl.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/14.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "LoadDataBaisiControl.h"

#import "BaiSiBDJModel.h"


@implementation LoadDataBaisiControl
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{

    if ([super initWithDelegate:aDelegate]) {
        
        
        
    }

    return [super initWithDelegate:aDelegate];
}
- (NSString *)requestURL{


    

    return self.contentURL;
}
- (RequestMethod)requestMethod{
    
    return RequestMethodGET;
}

- (BOOL)parseContent:(NSString *)content{
    
    NSDictionary *contentDict=(NSDictionary *)content;
    
    NSArray *list=contentDict[@"list"];
    
    self.contentArr=[NSMutableArray array];
    for (NSDictionary *info in list) {
       
        BaiSiBDJModel *model=[[BaiSiBDJModel alloc] init];
        model.videoModelArr=[NSMutableArray array];
        
        [model setValuesForKeysWithDictionary:info];
        
        
        if (![model.type isEqualToString:@"text"]) {
            
            VideoModel *videoModel=[[VideoModel alloc] initWithDictInfo:info[model.type]];
        
            [model.videoModelArr addObject:videoModel];
        }
        
       
        
        
        [self.contentArr addObject:model];
        
    }
    
    
    
    
 
    return NO;
}

@end
