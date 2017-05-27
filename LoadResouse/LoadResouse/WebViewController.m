//
//  WebViewController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/9.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import <WebKit/WKWebView.h>
@interface WebViewController ()<WKUIDelegate, WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH) configuration:config];
    [self.view addSubview:self.webView];
    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:self.loadUrl]]];
    
    // Do any additional setup after loading the view.
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
