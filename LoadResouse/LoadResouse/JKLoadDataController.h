//
//  JKLoadDataController.h
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "LoadDataController.h"

@interface JKLoadDataController : LoadDataController
@property (nonatomic, copy) NSString *loadUrlStr;
@property (nonatomic, strong) NSMutableArray *baseArr;
@property (nonatomic, strong) NSMutableDictionary *reouseDict;
@end
