//
//  FenLeiViewController.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/9.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FenLeiViewControllerBlockUrl)(NSString *);

@interface FenLeiViewController : UIViewController

@property (nonatomic,copy)FenLeiViewControllerBlockUrl myBlock;

- (void)requestOtherUrl:(FenLeiViewControllerBlockUrl)block;

@end
