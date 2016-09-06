//
//  TestViewController.m
//  ZGYDemo
//
//  Created by 朱共营 on 16/7/29.
//  Copyright © 2016年 user. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
{
    NSInteger _angle;
    BOOL _mark;

}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)beginBtn:(id)sender {
    
    _angle=0;
    _mark=NO;
    
    [self startAnimation];
    
    
    
    
}


-(void) startAnimation
{
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.01];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    
    
    self.lable.transform =  CGAffineTransformMakeRotation(_angle*(M_PI/180 ));
    [UIView commitAnimations];
}

-(void)endAnimation
{
    
    if (_mark==YES) {
         NSLog(@"%ld",_angle);
        [UIView animateWithDuration:2 animations:^{
            self.lable.transform = CGAffineTransformMakeRotation( (_angle)*(M_PI/180 ));
        } completion:^(BOOL finished) {
            self.lable.transform = CGAffineTransformMakeRotation(0);
        }];
        
        return;
    }
    
    
    
    
    _angle += 2;
    
    NSLog(@"%ld",_angle);
    [self startAnimation];
}



-(void )stopBtnNow{
    
//    _angle=2;
_mark=YES;
    
    NSLog(@"%ld",_angle);
    
    

}

- (IBAction)stopBtn:(id)sender {
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopBtnNow) userInfo:nil repeats:NO];
    
    
    
//    CABasicAnimation* rotationAnimation;
//    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//    rotationAnimation.duration = 0;
//    rotationAnimation.cumulative = YES;
//    rotationAnimation.repeatCount = _angle;
//    
//    [_lable.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    

    
    
    
}
@end
