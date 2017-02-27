//
//  JKContentLoadDataController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "JKContentLoadDataController.h"
#import "CenterModel.h"

@implementation JKContentLoadDataController
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate {
    self = [super initWithDelegate:aDelegate];
    if (self) {
        self.dataArr = [NSMutableArray array];
    }
    return self;
}
- (NSString *)requestURL {

    return self.loadUrl;
}

- (BOOL)parseContent:(NSString *)content {

    NSDictionary *dict = (NSDictionary*)content;
    NSArray *arr = dict[@"data"][@"data"];
    for (NSDictionary *subDict in arr) {
        CenterModel *model = [[CenterModel alloc] init];
        model.update_time = subDict[@"updated_at"];
        model.icon = subDict[@"logo_img"];
        model.article_count = subDict[@"article_count"];
        model.readerCount = subDict[@"uv"];
        model.title = subDict[@"name_cn"];
        model.contentUrl = subDict[@"author_url"];
        model.bgImage = subDict[@"background_img"];
        [self.dataArr addObject:model];
    }
    
    return NO;
}

@end
