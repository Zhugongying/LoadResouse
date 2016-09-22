//
//  BaiSiBDJCell.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BaiSiBDJCell.h"

@interface BaiSiBDJCell ()
@property (nonatomic,strong)BaiSiBDJModel *bsModel;
@property (nonatomic,strong)VideoModel *videoModel;

@end

@implementation BaiSiBDJCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)zanBtnClick:(id)sender {
}

- (IBAction)caiBtnClick:(id)sender {
    
}

- (IBAction)shareBtnClick:(id)sender {
    
    if (self.shearDelegate&& [self.shearDelegate respondsToSelector:@selector(showBaiSiBDJModel:witchVideoModel:)]) {
        
        [self.shearDelegate showBaiSiBDJModel:self.bsModel witchVideoModel:self.videoModel];
        
    }
    
    
}

- (IBAction)pLBtnClick:(id)sender {
    
    if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(showBaiSiBDJPLContenc:)]) {
        [self.shearDelegate showBaiSiBDJPLContenc:self.bsModel];
    }
    
}

- (void)showDataWithModel:(BaiSiBDJModel *)model{


    self.bsModel=model;
    self.videoModel=model.videoModelArr.lastObject;
    
    
    
    self.titleLable.text=model.text;
    [self.zanBtn setTitle:[NSString stringWithFormat:@"赞(%@)",model.up ] forState:UIControlStateNormal];
    [self.caiBtn setTitle:[NSString stringWithFormat:@"踩(%@)",model.down] forState:UIControlStateNormal];
    [self.shearBtn setTitle:[NSString stringWithFormat:@"分享(%@)",model.forward] forState:UIControlStateNormal];
    [self.plBtn setTitle:[NSString stringWithFormat:@"评论(%@)",model.comment] forState:UIControlStateNormal];

}


@end
