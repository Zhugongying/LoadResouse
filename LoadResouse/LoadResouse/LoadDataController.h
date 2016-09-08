//
//  LoadDataController.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>
#import <AFHTTPRequestOperation.h>

@class LoadDataController;
@class LoadDataControllerDelegate;

@protocol LoadDataControllerDelegate <NSObject>

- (void)loadDataFinishWithResouse:(LoadDataController *)controller;

- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error;

@end



@interface LoadDataController : NSObject
@property (nonatomic,weak)id <LoadDataControllerDelegate> ZhuDelegate;
@property (nonatomic,strong) AFHTTPRequestOperation *httpOperation;




@end
