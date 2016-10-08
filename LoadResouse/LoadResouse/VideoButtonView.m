//
//  VideoButtonView.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "VideoButtonView.h"

@implementation VideoButtonView
@synthesize beginBtn,progressView;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame withNibName:(NSString *)nib{

    
    NSArray *nibArr=[[NSBundle mainBundle] loadNibNamed:nib owner:self options:nil];
    
    self=nibArr.firstObject;

    if (self) {
        self.frame=frame;
        
        CGRect Oframe;
        Oframe=self.playTimeLable.frame;
        Oframe.origin.x=frame.size.width-150;
        self.playTimeLable.frame=Oframe;
        
        Oframe=self.progressView.frame;
        Oframe.size.width=frame.size.width-self.playTimeLable.frame.size.width-100;
        self.progressView.frame=Oframe;
        
    }
    return self;

}

- (IBAction)beginBtnClick:(id)sender {
    
    if (self.btnDelegate && [self.btnDelegate respondsToSelector:@selector(VideoButtonViewButtonClick:)]) {
        
        [self.btnDelegate VideoButtonViewButtonClick:self.beginBtn];
        
    }
    
    
}
- (IBAction)backBtnClick:(id)sender {
    
    if (self.btnDelegate && [self.btnDelegate respondsToSelector:@selector(videoButtonBackClick)]) {
        
        [self.btnDelegate videoButtonBackClick];
        
    }
    
    
}
@end
