//
//  BaisiCell.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/14.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaiSiBDJModel.h"
@interface BaisiCell : UITableViewCell

@property (weak, nonatomic)  UIImageView *videoImageView;
@property (weak, nonatomic)  UIButton *caiBtn;
@property (weak, nonatomic)  UIButton *shearBtn;
@property (weak, nonatomic)  UIButton *plBtn;
@property (weak, nonatomic)  UILabel *titleLable;
@property (weak, nonatomic)  UIButton *zanBtn;
- (void)zanBtnClick:(id)sender;
- (void)caiBtnClick:(id)sender;
- (void)shareBtnClick:(id)sender;
- (void)pLBtnClick:(id)sender;

- (void)showDataWithModel:(BaiSiBDJModel *)model;


@end
