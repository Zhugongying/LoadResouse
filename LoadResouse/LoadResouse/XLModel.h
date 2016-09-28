//
//  XLModel.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "FatherModel.h"

@interface XLModel : FatherModel
@property (nonatomic, copy)NSString *messageID;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *style;
@property (nonatomic, copy)NSString *detailUrl;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *messageBrief;
@property (nonatomic, copy)NSString *onlineTime;
@property (nonatomic, copy)NSString *thumbnailUrl;

@end
