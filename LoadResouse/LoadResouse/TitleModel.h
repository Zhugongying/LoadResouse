//
//  TitleModel.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "FatherModel.h"

@interface TitleModel : FatherModel
/**
  {
 "url": "http://s.budejie.com/topic/list/zuixin/1/",
 "god_topic_type": "nan",
 "type": "topic",
 "entrytype": "28",
 "name": "全部"
 }
 */

@property (nonatomic, copy)NSString *name;
@property (nonatomic ,strong) NSMutableArray *submenus;
@property (nonatomic ,strong) NSMutableArray *titleList;



@end

@interface HeadTileModel : FatherModel

@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *god_topic_type;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *entrytype;



@end
