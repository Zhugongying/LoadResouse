//
//  PlayerViewController.m
//  ZGYDemo
//
//  Created by 朱共营 on 16/8/9.
//  Copyright © 2016年 user. All rights reserved.
//

#import "PlayerViewController.h"

#import <MediaPlayer/MPMoviePlayerController.h>

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatPlayer];
}
- (void)creatPlayer{

    MPMoviePlayerController *player=[[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://117.135.161.80:80/b942db4a570d3f9a3403e1811139a66a.m3u8?w=1&key=1992efd2fa288ba97a1f9da2288c8def&k=12aec128b338c5ad35825b6c03cc31dd-85ee-1470729063&segment=2dc12c84_2dc1c6e4_1470714663&bppcataid=38&type=phone.ios.sports&sv=3.0.1&platform=iphone4&ft=2&accessType=wifi&vvid=8DBDD5DF-C145-4CC7-92C4-571759CF20B8&video=true"]];
    player.scalingMode=MPMovieScalingModeAspectFit;
    
    [player play];

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
