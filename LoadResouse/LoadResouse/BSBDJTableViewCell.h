//
//  BSBDJTableViewCell.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/19.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaiSiBDJModel.h"



@protocol BSBDJTableViewShearDelegate <NSObject>

- (void)showBaiSiBDJModel:(BaiSiBDJModel *)BSModel witchVideoModel:(VideoModel *)videoModel;

- (void)showBaiSiBDJPLContenc:(BaiSiBDJModel *)bsModel ;

@end

@interface BSBDJTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *headImageView;
@property (nonatomic, strong)UIImageView *videoImage;
@property (nonatomic, strong)UILabel *titleLable;

@property (nonatomic, strong)UIButton *zanBtn;
@property (nonatomic, strong)UIButton *caiBtn;
@property (nonatomic, strong)UIButton *shearBtn;
@property (nonatomic, strong)UIButton *plBtn;

@property (nonatomic, weak)id<BSBDJTableViewShearDelegate>shearDelegate;

- (void)showDataWithModel:(BaiSiBDJModel *)model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

