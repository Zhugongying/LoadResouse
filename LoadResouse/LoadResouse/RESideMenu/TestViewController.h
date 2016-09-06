//
//  TestViewController.h
//  ZGYDemo
//
//  Created by 朱共营 on 16/7/29.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController
- (IBAction)beginBtn:(id)sender;
- (IBAction)stopBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lable;

@end
