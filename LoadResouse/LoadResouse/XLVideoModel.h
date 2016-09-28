//
//  XLVideoModel.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "FatherModel.h"

@interface XLVideoModel : FatherModel
@property (nonatomic, copy)NSString *gcid;
@property (nonatomic, copy)NSString *channel_title;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *poster;
@property (nonatomic, copy)NSString *poster_width;
@property (nonatomic, copy)NSString *poster_height;
@property (nonatomic, copy)NSString *play_count;
@property (nonatomic, copy)NSString *channel_poster_url;
@property (nonatomic, copy)NSString *file_size;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, copy)NSString *comment_num;
@property (nonatomic, copy)NSString *duration;
@property (nonatomic, copy)NSString *thumbup_count;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *channel_icon_url;
@end
