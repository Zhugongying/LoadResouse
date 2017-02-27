//
//  JKContentLoadDataController.h
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "LoadDataController.h"

@interface JKContentLoadDataController : LoadDataController

@property (nonatomic, copy) NSString *loadUrl;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end
