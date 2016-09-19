//
//  BaiSiBDJCell.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BaiSiBDJCell.h"

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
}

- (IBAction)pLBtnClick:(id)sender {
}

- (void)showDataWithModel:(BaiSiBDJModel *)model{


    self.titleLable.text=model.text;
    [self.zanBtn setTitle:[NSString stringWithFormat:@"赞(%@)",model.up ] forState:UIControlStateNormal];
    [self.caiBtn setTitle:[NSString stringWithFormat:@"踩(%@)",model.down] forState:UIControlStateNormal];
    [self.shearBtn setTitle:[NSString stringWithFormat:@"分享(%@)",model.forward] forState:UIControlStateNormal];
    [self.plBtn setTitle:[NSString stringWithFormat:@"评论(%@)",model.comment] forState:UIControlStateNormal];

    VideoModel *videoModel=model.videoModelArr.firstObject;
    
    
    UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:videoModel.thumbnail.firstObject]]];
    
    self.videoImageView.image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    CGRect rect;
    
    rect=self.titleLable.frame;
    rect.size.height=[self titleHeight:model.text];
    rect.size.width=kScreenSizeW-20;
    self.titleLable.frame=rect;
    
    
    rect=self.videoImageView.frame;
    if (![model.type isEqualToString:@"text"]) {
        
        rect.size.height= (kScreenSizeW-16)*videoModel.height.integerValue/videoModel.width.integerValue;
        rect.origin.y=self.titleLable.frame.origin.y+self.titleLable.frame.size.height + 15;
        
    }else{
    
        rect.size.height=0.f;
    
    }
    rect.size.width=kScreenSizeW-16;
    self.videoImageView.frame = rect;
    

    
    CGFloat btnW=(kScreenSizeW-50)/3;
    
    rect=self.zanBtn.frame;
    rect.origin.y=self.videoImageView.frame.origin.y+self.videoImageView.frame.size.height +10;
    rect.origin.x=10;
    rect.size.width=btnW;
    self.zanBtn.frame=rect;
    

    rect=self.caiBtn.frame;
    rect.origin.x=20+btnW;
    rect.size.width=btnW;
    self.caiBtn.frame=rect;
    
    rect =self.shearBtn.frame;
    rect.origin.x=30+btnW;
    rect.size.width=btnW;
    self.shearBtn.frame=rect;
    
    rect=self.plBtn.frame;
    rect.origin.x=40+btnW;
    rect.size.width=btnW;
    self.plBtn.frame=rect;
    
    
    
    
    

}
- (CGFloat)titleHeight:(NSString *)conten{

    CGSize size = CGSizeMake(kScreenSizeW-30,CGFLOAT_MAX);//LableWight标签宽度，固定的
    CGSize labelsize = [conten sizeWithFont:[UIFont systemFontOfSize:16.f] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    
    
    return labelsize.height;

}

@end
