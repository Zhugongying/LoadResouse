//
//  BoysLoadDataController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/9.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "BoysLoadDataController.h"
#import "BoysModel.h"

@implementation BoysLoadDataController
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{
    
    self=[super initWithDelegate:aDelegate];
    if (self) {
        self.dataSouseArr=[NSMutableArray array];

        
    }
    return self;
    
}
- (NSString *)requestURL{
    return self.contentUrl;
}

- (RequestMethod)requestMethod{
    
    return RequestMethodGET;
}

- (BOOL)parseContent:(NSString *)content{
    
    NSDictionary *dict=(NSDictionary *)content;
    NSArray *result = dict[@"result"];

    self.dataSouseArr = [NSMutableArray array];
    
    for (NSDictionary *newDict in result) {
        BoysModel *model = [[BoysModel alloc] init];
        NSDictionary *subDict = newDict[@"channel"];
        model.playCount = subDict[@"stat"][@"vcntNice"];
        model.picUrl = subDict[@"pic"][@"base"];
        model.picType = subDict[@"pic"][@"m"];
        model.videoStr = subDict[@"stream"][@"base"];
        model.title = subDict[@"ext"][@"ft"];
        model.time = subDict[@"ext"][@"finishTimeNice"];
        model.playLonge = subDict[@"ext"][@"lengthNice"];
        
        [self.dataSouseArr addObject:model];
    }
    
    return NO;
}


@end
