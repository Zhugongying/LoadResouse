//
//  JKModel.h
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "FatherModel.h"

@interface JKModel : FatherModel
@property (nonatomic, copy) NSString *baseName;

@end

@interface SubJKModel : FatherModel

@property (nonatomic, copy) NSString *subName;
@property (nonatomic, copy) NSString *changeID;
@end
