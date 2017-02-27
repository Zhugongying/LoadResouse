//
//  JKCell.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "JKCell.h"

@implementation JKCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)fullCellWithModel:(CenterModel *)model {
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@""]];
    
    self.titleLable.text = model.title;
    self.articleLabel.text = [NSString stringWithFormat:@"%@章",model.article_count];
    self.updateLabel.text = model.update_time;
    self.readCountLable.text = [NSString stringWithFormat:@"%@人阅读",model.readerCount];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
