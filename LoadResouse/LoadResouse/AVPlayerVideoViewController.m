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
    
//   [self interfaceOrientation:UIInterfaceOrientationLandscapeRight];
    
    [self creadPlayerView];
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)creadPlayerView{
    
    NSInteger videoH=self.videoModel.poster_height.integerValue * kScreenSizeW/self.videoModel.poster_width.integerValue;
    
    
    NSURL *videoUrl=[NSURL URLWithString:self.videoUrlStr];
    
    
    self.playerItem=[AVPlayerItem playerItemWithURL:videoUrl];
    self.player=[AVPlayer playerWithPlayerItem:self.playerItem];

    AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame=CGRectMake(2,2, kScreenSizeH-4, kScreenSizeW-4);
    playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;
//    playerLayer.backgroundColor=[UIColor redColor].CGColor;
    [self.view.layer addSublayer:playerLayer];
    
    
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
//    
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//       
//        [self.player play];
//    });
   
   self.videoButView=[[VideoButtonView alloc] initWithFrame:CGRectMake(0, kScreenSizeW-60, kScreenSizeH, 60) withNibName:@"VideoButtonView"];
    
   self.videoButView.btnDelegate=self;
    
    [self.view addSubview:self.videoButView];
    
    [self addNot];
    
}
- (void)addNot{

    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

  AVPlayerItem * newPlayerItem =(AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        
        
        [self updateProgressInfo];
        
        
    }else if ([keyPath isEqualToString:@"status"]){
    
        if (newPlayerItem.status == AVPlayerItemStatusReadyToPlay) {
            [self.player play];
        }else{
        
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"播放错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

- (void)updateProgressInfo{

    if (!self.player) {
        return;
    }
     __weak __typeof(self) weakSelf = self;
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSTimeInterval current = CMTimeGetSeconds(time);
        
        //视频的总时间
        NSTimeInterval total = CMTimeGetSeconds(weakSelf.player.currentItem.duration);
        
        weakSelf.videoButView.progressView.value=current/total;
        weakSelf.videoButView.playTimeLable.text=[NSString stringWithFormat:@"%@/%@",[weakSelf formatPlayTime:current],[weakSelf formatPlayTime: total]];
        
    }];

}
//将时间转换成00:00:00格式
- (NSString *)formatPlayTime:(NSTimeInterval)duration
{
    int minute = 0, hour = 0, secend = duration;
    minute = (secend % 3600)/60;
    hour = secend / 3600;
    secend = secend % 60;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hour, minute, secend];
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



#pragma mark 强制横屏//不知道为啥push的时候就不调用这个方法
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}
#pragma mark - 横屏

//强制转屏
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector  = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}


- (void)viewWillDisappear:(BOOL)animated{

    if (self.player && self.playerItem) {
        [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
        [self.playerItem removeObserver:self forKeyPath:@"status" context:nil];
        
        self.playerItem =nil;
        self.player = nil;
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
