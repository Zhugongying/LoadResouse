//
//  XLLoadDataController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "XLLoadDataController.h"
#import "XLModel.h"
#import "XLVideoModel.h"
@implementation XLLoadDataController
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{

    self=[super initWithDelegate:aDelegate];
    if (self) {
        
        self.xlDataArr=[NSMutableArray array];
        
        
    }
    return self;

}
- (RequestMethod)requestMethod{

    return RequestMethodGET;
}
- (NSString *)requestURL{


    return self.xlrequestUrl;
}
- (BOOL)parseContent:(NSString *)content{
    
    NSDictionary *list=(NSDictionary *)content;
    
    for (NSDictionary *subDict in list[@"messageList"]) {
        
        XLModel *model=[[XLModel alloc] init];
        
        [model setValuesForKeysWithDictionary:subDict];
        
        [self.xlDataArr addObject:model];
        
    }
    
    if (list[@"video_info"]) {
        self.videoArr=[NSMutableArray array];
        
        XLVideoModel *model=[[XLVideoModel alloc] init];
        
        [model setValuesForKeysWithDictionary:list[@"video_info"]];
        
        [self.videoArr addObject:model];
        
        return YES;
        
    }
    
    

    return NO;
}
@end
