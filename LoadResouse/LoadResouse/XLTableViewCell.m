//
//  XLTableViewCell.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "XLTableViewCell.h"
#import "NSObject+SBData.h"
@implementation XLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)showDataWithModel:(XLModel *)model{


//    dispatch_queue_t queue=dispatch_queue_create("loadXunLei.com", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//       
//        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnailUrl]]];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//           
//            self.headImageView.image=image;
//        });
//        
//    });

    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnailUrl]];
    self.titleLable.text=model.title;
    self.contenLable.text=model.messageBrief;
    self.timeLable.text=[NSObject dateTypeCompearForNowTime:model.onlineTime];


   
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
