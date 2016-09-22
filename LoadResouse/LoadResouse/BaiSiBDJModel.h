//
//  BaiSiBDJModel.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "FatherModel.h"

@interface BaiSiBDJModel : FatherModel
/**
 {
 "status": 2,
 "comment": "1",
 "bookmark": "0",
 "text": "一天，我和女朋友去公园  我手划破了 没有创可贴 女朋友灵机一动 从包里拿出卫生巾给我包上了\n后来有一天我和女朋友又去逛公园 我女朋友来月经了 没有带卫生巾 我灵机一动 从包里拿出了创可贴 ......",
 "up": "43",
 "share_url": "http://a.f.budejie.com/share/20478996.html?wx.qq.com",
 "down": 12,
 "forward": 0,
 "passtime": "2016-09-07 16:56:59",
 "type": "text",
 "id": "20478996"
 }
 */
@property (nonatomic, copy)NSString *comment;//评论
@property (nonatomic, copy)NSString *text;
@property (nonatomic, copy)NSString *up;
@property (nonatomic, copy)NSString *share_url;
@property (nonatomic, copy)NSString *down;//踩
@property (nonatomic, copy)NSString *passtime;
@property (nonatomic, copy)NSString *forward;
@property (nonatomic, copy)NSString *type;

@property (nonatomic, copy)NSString *idStr;

@property (nonatomic,strong)NSMutableArray *videoModelArr;



@end

@interface VideoModel : FatherModel

@property (nonatomic, copy)NSString *playfcount;
@property (nonatomic, copy)NSString *height;
@property (nonatomic, copy)NSString *width;
@property (nonatomic, copy)NSString *duration;
@property (nonatomic, copy)NSString *playcount;
@property (nonatomic, strong)NSMutableArray *video;
@property (nonatomic, strong)NSMutableArray *download;
@property (nonatomic, strong)NSMutableArray *thumbnail;
@property (nonatomic, strong)NSMutableArray *medium;
@property (nonatomic, strong)NSMutableArray *images;
@property (nonatomic, strong)NSMutableArray *thumbnail_small;
@property (nonatomic, strong)NSMutableArray *big;
@property (nonatomic, strong)NSMutableArray *download_url;
- (id)initWithDictInfo:(NSDictionary *)info;


@end


