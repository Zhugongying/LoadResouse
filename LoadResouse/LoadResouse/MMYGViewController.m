//
//  MMYGViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/10/8.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "MMYGViewController.h"

@interface MMYGViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property float scrollViewSetY;
@end

@implementation MMYGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _scrollViewSetY=0;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH)];
    
    self.webView.scalesPageToFit=YES;
    self.webView.delegate=self;
    self.webView.scrollView.delegate=self;
    
    NSURLRequest *requesr=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.mumujz.com/mobile/"]] ;
//     NSURLRequest *requesr=[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://13253009266"]] ;
    
    
    [self.view addSubview:self.webView];
    self.webView.scrollView.bounces=NO;
    
    [self.webView loadRequest:requesr];
    
//    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hindenNavigationBar:)];
//    
//    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    
//    [self.webView.scrollView addGestureRecognizer:swipe];
    
}


- (void)hindenNavigationBar:(UISwipeGestureRecognizer *)swipe{


    if (swipe.direction==UISwipeGestureRecognizerDirectionUp) {
        
        
        
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionDown){
    
    
        
    
    }


}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
    if (scrollView.contentOffset.y - _scrollViewSetY > 0) {
        
        if (!(self.navigationController.navigationBarHidden==YES)) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }
        
    }else if(_scrollViewSetY - scrollView.contentOffset.y  >0){
        if (!(self.navigationController.navigationBarHidden==NO)) {
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }
    
    }
    
    
    _scrollViewSetY=scrollView.contentOffset.y;
    
    
    
//
//    NSLog(@"%@",scrollView.gestureRecognizers);
//    NSLog(@"%f",scrollView.contentOffset.y);
    
    


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
