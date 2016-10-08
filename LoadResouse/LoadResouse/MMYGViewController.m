//
//  MMYGViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/10/8.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "MMYGViewController.h"

@interface MMYGViewController ()
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation MMYGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSURLRequest *requesr=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.mumujz.com/mobile/"]] ;
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:requesr];
    
    
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
