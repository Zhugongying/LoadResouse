//
//  BoysCell.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/9.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "BoysCell.h"

@interface BoysCell()
@property (nonatomic, strong) BoysModel * model;

@end

@implementation BoysCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setBoysCellWithModek:(BoysModel *)model {
    self.model = model;
    self.title.text = model.title;
    self.timeLable.text = model.time;
    
    NSString *requestUrlStr = [NSString stringWithFormat:@"%@%@", model.picUrl, model.picType];
    
    
    [self.picImage sd_setImageWithURL:[NSURL URLWithString:requestUrlStr] placeholderImage:[UIImage imageNamed:@"timg"]];
    self.playCount.text = model.playCount;
    self.playLonge.text = model.playLonge;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)playBtnClick:(UIButton *)sender {
    if (self.playDelegeate && [self.playDelegeate respondsToSelector:@selector(videoPlayClick:)]) {
        [self.playDelegeate videoPlayClick:self.model];
    }
    
}
@end
