//
//  VideoButtonView.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VideoButtonViewDelegate <NSObject>

- (void)VideoButtonViewButtonClick:(UIButton *)btn;

@end

@interface VideoButtonView : UIView
@property (strong, nonatomic)  UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLable;
@property (weak, nonatomic) IBOutlet UISlider *progressView;
//@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *beginBtn;

@property (nonatomic, weak) id<VideoButtonViewDelegate>btnDelegate;

- (IBAction)beginBtnClick:(id)sender;

- (instancetype)initWithFrame:(CGRect)frame withNibName:(NSString *)nib;
@end
