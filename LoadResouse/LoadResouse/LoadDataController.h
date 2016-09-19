//
//  LoadDataController.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {

    RequestMethodGET,

    RequestMethodPOST,


}RequestMethod;


@class LoadDataController;
@class LoadDataControllerDelegate;

@protocol LoadDataControllerDelegate ;

@interface LoadDataController : NSObject
@property (nonatomic,weak)id <LoadDataControllerDelegate> ZhuDelegate;



#pragma mark - 需重写的回调

//设置请求的URL（不要带任何参数）
- (NSString *)requestURL;
//返回数据的解析
- (BOOL)parseContent:(NSString *)content;
- (RequestMethod)requestMethod;
- (NSDictionary *)requestDict;

- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate;


- (void)requestWithArgs:(NSDictionary *)args;


@end


@protocol LoadDataControllerDelegate <NSObject>

- (void)loadDataFinishWithResouse:(LoadDataController *)controller;

- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error;

@end