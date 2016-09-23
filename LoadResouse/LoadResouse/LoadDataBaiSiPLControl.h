//
//  LoadDataBaiSiPLControl.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/22.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "LoadDataController.h"
#import "BaiSiBDJModel.h"
@interface LoadDataBaiSiPLControl : LoadDataController

@property (nonatomic, strong)BaiSiBDJModel *bsModel;

@property (nonatomic, strong)NSMutableArray *conmentArr;
@property (nonatomic, copy)NSString *loadUrl;

@property (nonatomic, copy)NSString *lastPageID;//当页最后一位id

@property (nonatomic, copy)NSString *conmentArrCount;//记录总数 判断刷新


@end
