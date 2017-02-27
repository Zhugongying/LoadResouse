//
//  CenterModel.h
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "FatherModel.h"

@interface CenterModel : FatherModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *article_count;
@property (nonatomic, copy) NSString *readerCount;
@property (nonatomic, copy) NSString *contentUrl;
@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *bgImage;

@end
