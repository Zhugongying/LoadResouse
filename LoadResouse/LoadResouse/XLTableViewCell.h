//
//  XLTableViewCell.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLModel.h"
@interface XLTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contenLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

- (void)showDataWithModel:(XLModel *)model;

@end
