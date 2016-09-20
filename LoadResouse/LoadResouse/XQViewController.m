//
//  XQViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/19.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "XQViewController.h"

#import <RTLabel.h>

@interface XQViewController ()
@property (nonatomic ,strong)UIWebView *webview;
@end

@implementation XQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    if ([self.model.type isEqualToString:@"text"]) {
        
        [self creatRTLabel ];
    }else{
    
        [self creatWebView ];
    }
}
- (void)creatWebView{


    self.webview=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH)];
    
    NSURL *url=[NSURL URLWithString:self.xqStr];
    
   [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:self.webview ];
    

}

- (void)creatRTLabel{
    
    
    if (self.webview) {
        [self.webview removeFromSuperview];
    }
    
    RTLabel *rtLable=[[RTLabel alloc] initWithFrame:CGRectMake(10, 64, kScreenSizeW-20, kScreenSizeH)];
    
    [rtLable setText:self.model.text];
    rtLable.font=[UIFont systemFontOfSize:16];
    [self.view addSubview:rtLable];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
