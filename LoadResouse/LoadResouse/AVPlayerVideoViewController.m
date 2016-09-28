//
//  AVPlayerViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "AVPlayerVideoViewController.h"
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVPlayerItem.h>
#import <AVFoundation/AVPlayerLayer.h>

#import "VideoButtonView.h"


@interface AVPlayerVideoViewController ()<VideoButtonViewDelegate>
@property (nonatomic,strong)AVPlayer *player;
@property (nonatomic,strong)AVPlayerItem *playerItem;
@property (nonatomic,strong)VideoButtonView *videoButView;
@end

@implementation AVPlayerVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creadPlayerView];
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)creadPlayerView{
    
    NSInteger videoH=self.videoModel.poster_height.integerValue * kScreenSizeW/self.videoModel.poster_width.integerValue;
    
    
    NSURL *videoUrl=[NSURL URLWithString:self.videoUrlStr];
    
    
    self.playerItem=[AVPlayerItem playerItemWithURL:videoUrl];
    self.player=[AVPlayer playerWithPlayerItem:self.playerItem];

    AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame=CGRectMake(0, 64, kScreenSizeW, videoH);
    playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;
//    playerLayer.backgroundColor=[UIColor redColor].CGColor;
    [self.view.layer addSublayer:playerLayer];
    
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
    
    dispatch_after(time, dispatch_get_main_queue(), ^{
       
        [self.player play];
    });
   
   self.videoButView=[[VideoButtonView alloc] initWithFrame:CGRectMake(0, videoH+64, kScreenSizeW, 51) withNibName:@"VideoButtonView"];
    
   self.videoButView.btnDelegate=self;
    
    [self.view addSubview:self.videoButView];
    
    
}
- (void)addNot{

    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:&PlayerItemStatusContext];
    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:&PlayerItemLoadedTimeRangesContext];

}

- (void)VideoButtonViewButtonClick:(UIButton *)btn{
    
    
    if ([btn.titleLabel.text isEqualToString:@"开始"]) {
        [self.player pause];
        [btn setTitle:@"暂停" forState:UIControlStateNormal];
    }else{
    
        [self.player play];
        [btn setTitle:@"开始" forState:UIControlStateNormal];
    
    }
    

   


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
