//
//  BoysCell.h
//  LoadResouse
//
//  Created by zhugy on 2017/2/9.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoysModel.h"

@protocol PlayViewClickDelegeate <NSObject>

- (void)videoPlayClick: (BoysModel *)model;

@end

@interface BoysCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *playLonge;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (nonatomic, weak) id <PlayViewClickDelegeate>playDelegeate;
- (IBAction)playBtnClick:(UIButton *)sender;

- (void)setBoysCellWithModek:(BoysModel *)model;
@end
