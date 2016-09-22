//
//  XQViewController.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/19.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "TableFatherViewController.h"

#import "BaiSiBDJModel.h"

@interface XQViewController : TableFatherViewController

@property (nonatomic, copy)NSString *xqStr;

@property (nonatomic, strong)BaiSiBDJModel *model;
@property (nonatomic, strong)VideoModel *videoModel;

@end
