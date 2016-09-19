//
//  LoadDataController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "LoadDataController.h"
#import <AFHTTPSessionManager.h>
#import <MBProgressHUD.h>

@interface LoadDataController ()

@end

@implementation LoadDataController
- (instancetype)initWithDelegate:(id<LoadDataControllerDelegate>)aDelegate{
    self=[super init];
    if (self) {
        self.ZhuDelegate=aDelegate;
        
        
        
    }
    return self;
}

- (instancetype)init{

    return [self initWithDelegate:nil];
}

#pragma mark - 要修改的的接口

- (BOOL)parseContent:(NSString *)content{

    return NO;
}
- (RequestMethod)requestMethod{


    return RequestMethodGET;
}

- (NSString *)requestURL{


    return nil;
}

- (NSDictionary *)requestDict{

    return nil;
}

#pragma mark -
- (void)requestWithArgs:(NSDictionary *)args{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.requestSerializer.timeoutInterval = 10;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain", nil];
    
//    NSURL *url=[NSURL URLWithString:[self requestURL]];
//    
//    NSURLRequest *requestUrl=[NSURLRequest requestWithURL:url];
    
    switch ([self requestMethod]) {
        case RequestMethodGET:
        {
            
            
            
           [manager GET:[self requestURL] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
               //打印下下载进度
                NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
           } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              
               [self parseContent:responseObject];
               
               if (self.ZhuDelegate&&[self.ZhuDelegate respondsToSelector:@selector(loadDataFinishWithResouse:)]) {
                   
                   [self.ZhuDelegate loadDataFinishWithResouse:self];
               }
               
               
               
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               
               NSLog(@"%@",error.userInfo);
               [self parseContent:(NSString *)error.userInfo ];
               if (self.ZhuDelegate&&[self.ZhuDelegate respondsToSelector:@selector(loadDataFinishWithResouse:)]) {
                   
                   [self.ZhuDelegate loadData:self failedWithEroor:error];
               }
               
           }];
            
            
//            NSURLSessionDownloadTask *task =[manager downloadTaskWithRequest:requestUrl progress:^(NSProgress * _Nonnull downloadProgress) {
//                 //打印下下载进度
//                NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
//                
//            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//                //下载地址
//                NSLog(@"默认下载地址:%@",targetPath);
//                //设置下载路径，通过沙盒获取缓存地址，最后返回NSURL对象
//                NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
//                return [NSURL URLWithString:filePath];
//                
//            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//                
//                
//                
//                //下载完成调用的方法
//                NSLog(@"下载完成：");
//                NSLog(@"%@--%@",response,filePath);
//            }];
//            
//            
//            [task resume];
            
        
        }
            break;
            
            
        case RequestMethodPOST:
        {
        
            [manager POST:[self requestURL] parameters:[self requestDict] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                //打印下上传进度
                NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //请求成功
                NSLog(@"请求成功：%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //请求失败
                NSLog(@"请求失败：%@",error);
            }];
            
            
            
            
            
            
        
        }
            break;
            
        default:
            break;
    }





}

@end
