//
//  XQViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/19.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "XQViewController.h"

#import <RTLabel.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import "LoadDataBaiSiPLControl.h"

@interface XQViewController ()<LoadDataControllerDelegate>
@property (nonatomic ,strong)AVPlayerViewController *playView;
@property (nonatomic ,strong)LoadDataBaiSiPLControl *PL;
@property (nonatomic ,strong)NSMutableArray *plHeight;
@end

@implementation XQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"评论";
    
    [self creatTableView];
    [self loadPLData];
    
   
    
    if ([self.model.type isEqualToString:@"text"]) {
        
        [self creatRTLabel ];
        
    }else{
    
        [self creatPlayVideoView ];
         self.tableView.frame=CGRectMake(0, 264, kScreenSizeW, kScreenSizeH-264);
    }
}

- (void)loadPLData{


    self.PL=[[LoadDataBaiSiPLControl alloc] initWithDelegate:self];
    self.PL.bsModel=self.model;
    
    [self.PL requestWithArgs:nil];
}
- (void)loadDataFinishWithResouse:(LoadDataController *)controller{

    self.plHeight=[NSMutableArray array];
    
    
    [self.tableView reloadData];
    
    dispatch_queue_t queue=dispatch_queue_create(0, 0);
    
    dispatch_async(queue, ^{
        
        
    });
    
    

}
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text=self.PL.conmentArr[indexPath.row];
  
    cell.textLabel.numberOfLines=0;
    
    cell.textLabel.textColor=UIColorRGBA(0x364715, 1);
    
    return cell;
    

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.PL.conmentArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return [self contentSizeWith:self.PL.conmentArr[indexPath.row]];
}

- (NSInteger)contentSizeWith:(NSString *)content {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:content];
    
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    
    style.lineSpacing=10;
    UIFont *font=[UIFont systemFontOfSize:16];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, content.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, content.length)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW-16, 1)];
    label.font=font;
    label.numberOfLines=0;
    label.attributedText=attributeString;
    CGSize size=[label sizeThatFits:CGSizeMake(kScreenSizeW-16, CGFLOAT_MAX)];
    
    
    
    return size.height;
}


- (void)creatPlayVideoView{

    self.playView=[[AVPlayerViewController alloc] init];
    self.playView.view.frame=CGRectMake(0, 64, kScreenSizeW, 200);
    self.playView.player=[AVPlayer playerWithURL:[NSURL URLWithString:self.xqStr]];
    [self.playView.player play];
    
    [self.view addSubview:self.playView.view];
    

}

- (void)creatRTLabel{
    
    
    
    
    
    
    RTLabel *rtLable=[[RTLabel alloc] initWithFrame:CGRectMake(10, 64, kScreenSizeW-20, [self contentSizeWith:self.model.text])];
    
    [rtLable setText:self.model.text];
    rtLable.font=[UIFont systemFontOfSize:16];
    [self.view addSubview:rtLable];
    
     self.tableView.frame=CGRectMake(0, rtLable.frame.size.height+64, kScreenSizeW, kScreenSizeH-rtLable.frame.size.height-64);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
