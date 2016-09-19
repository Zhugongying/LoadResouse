//
//  BaiSiBDJModel.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BaiSiBDJModel.h"

@implementation BaiSiBDJModel
/**
 *  
 */




@end
@implementation VideoModel

- (id)initWithDictInfo:(NSDictionary *)info{
    /**
     
     
     @property (nonatomic, copy)NSString *playfcount;
     @property (nonatomic, copy)NSString *height;
     @property (nonatomic, copy)NSString *width;
     @property (nonatomic, copy)NSString *duration;
     @property (nonatomic, copy)NSString *playcount;
     @property (nonatomic, strong)NSMutableArray *video;
     @property (nonatomic, strong)NSMutableArray *download;
     @property (nonatomic, strong)NSMutableArray *thumbnail;

     */
    
    self = [super init];

    if (self) {
        
        self.playfcount=info[@"playfcount"];
        self.height=info[@"height"];
        self.width=info[@"width"];
        self.duration=info[@"duration"];
        self.playcount=info[@"playcount"];
        self.video=info[@"video"];
        self.download=info[@"download"];
        self.thumbnail=info[@"thumbnail"];
        
        
        
    }
    
    return self;
}

@end