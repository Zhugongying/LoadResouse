//
//  JKLoadDataController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "JKLoadDataController.h"
#import "JKModel.h"

@implementation JKLoadDataController
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate {
    self = [super initWithDelegate:aDelegate];
    if (self) {
        self.baseArr = [NSMutableArray array];
        self.reouseDict = [NSMutableDictionary dictionary];
    }
    return self;
}
- (NSString *)requestURL {
    return self.loadUrlStr;
}
- (BOOL)parseContent:(NSString *)content {
    NSDictionary *dict = (NSDictionary *)content;
    NSArray * dataArr = dict[@"data"];
    
    for (NSDictionary *baseDict in dataArr) {
        JKModel *model = [[JKModel alloc] init];
        model.baseName = baseDict[@"name_cn"];
        
        NSMutableArray *subArr = [NSMutableArray array];
        for (NSDictionary *subDict in baseDict[@"child_category"]) {
            SubJKModel *subModel = [[SubJKModel alloc] init];
            subModel.subName = subDict[@"name_cn"];
            subModel.changeID = subDict[@"id"];
            [subArr addObject:subModel];
        }
        [self.reouseDict setValue:subArr forKey:model.baseName];
        [self.baseArr addObject:model.baseName];
    }
    
    return NO;
}

@end
