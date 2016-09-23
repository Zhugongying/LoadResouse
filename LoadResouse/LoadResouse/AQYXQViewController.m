//
//  AQYXQViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/23.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "AQYXQViewController.h"

@interface AQYXQViewController ()
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation AQYXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webLoad];
}

- (void)webLoad{

    self.webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH)];
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadStr]];
    
    [self.webView loadRequest:url];
//    self.webView.
    
    [self.view addSubview:self.webView];

    

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
