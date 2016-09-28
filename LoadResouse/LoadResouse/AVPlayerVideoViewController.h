//
//  AVPlayerViewController.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLVideoModel.h"
@interface AVPlayerVideoViewController : UIViewController
@property (nonatomic, strong)NSString *videoUrlStr;
@property (nonatomic, strong)XLVideoModel *videoModel;
@end
