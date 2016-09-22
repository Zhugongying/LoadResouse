//
//  BaiSiDJViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BaiSiDJViewController.h"
#import "BaiSiBDJCell.h"

#import "BaiSiBDJDataController.h"

#import "FenLeiViewController.h"
#import "LoadDataBaisiControl.h"
#import "BaiSiBDJModel.h"

#import "BSBDJTableViewCell.h"

#import "XQViewController.h"


#import <WXApi.h>
#import "ShearView.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


@interface BaiSiDJViewController ()<LoadDataControllerDelegate,BSBDJTableViewShearDelegate,UMSocialUIDelegate,BSBDJTableTextDelegate,ShaarViewBtnClickDelegate>

@property (nonatomic,strong)UICollectionView *chouseCollectView;
@property (nonatomic,strong)NSMutableArray *titleArrHeght;

@property (nonatomic,strong)LoadDataBaisiControl *contontDataController;

@property (nonatomic,strong)MBProgressHUD *hud;

@property (nonatomic, strong)ShearView *shearView;
@property (nonatomic,strong)BaiSiBDJModel *bsModel;
@property (nonatomic,strong)VideoModel *videoModel;

@property (nonatomic,strong)AVPlayerViewController *player;

@property (nonatomic, copy)NSString *loadUrl;

@end

@implementation BaiSiDJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self creatTableView];
    [self creatRegetCell];
    
    [self loadDataResouse:nil];
    [self creatBarBtnRight];
    [self oneLoadResouse];
     [self refreshTableView];
}
#pragma mark - 创建筛选按钮
- (void)creatBarBtnRight{

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"分类" style:UIBarButtonItemStylePlain target:self action:@selector(presenView)];
    
}

- (void)oneLoadResouse{
 self.contontDataController=[[LoadDataBaisiControl alloc] initWithDelegate:self];

  
    
    _contontDataController.contentURL=[NSString stringWithFormat:@"http://s.budejie.com/topic/list/jingxuan/1/%@",@"bs0315-iphone-4.3/0-20.json"];
    
    [_contontDataController.contentArr removeAllObjects];
    
    [_contontDataController requestWithArgs:nil];


}


- (void)presenView{

    FenLeiViewController * fenlei=[[FenLeiViewController alloc] init];
    
    
    typeof(self)mySelf=self;
    
    [fenlei requestOtherUrl:^(NSString *url ,NSString *titleStr) {
    
        self.hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        self.hud.mode=MBProgressHUDModeText;
        _hud.labelText=@"稍等。。。";
        _hud.margin=10.f;
        
        
        
        
        NSString *newUrl=url;
        
        if (![url hasSuffix:@"/"]) {
           
            newUrl=[NSString stringWithFormat:@"%@/",url];
        }
        
        
        self.title=titleStr;
        
        mySelf.loadUrl=newUrl;
        
       
        
        _contontDataController.contentURL=[NSString stringWithFormat:@"%@%@",newUrl,@"bs0315-iphone-4.3/0-20.json"];
    
        [_contontDataController requestWithArgs:nil];
    
    }];
    
    [self.navigationController pushViewController:fenlei animated:YES];
    

}

- (void)refreshHeadView{
    _contontDataController.contentURL=[NSString stringWithFormat:@"%@bs0315-iphone-4.3/%@-20.json",self.loadUrl,@"0"];
    
    [_contontDataController.contentArr removeAllObjects];
     [_contontDataController requestWithArgs:nil];

}
- (void)refreshFooterView{

 _contontDataController.contentURL=[NSString stringWithFormat:@"%@bs0315-iphone-4.3/%@-20.json",self.loadUrl,_contontDataController.npStr];
    [_contontDataController requestWithArgs:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (!self.titleArrHeght.count) {
        return 0;
    }
    
    return self.contontDataController.contentArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   BaiSiBDJModel *model=self.contontDataController.contentArr[indexPath.row];
    if ([model.type isEqualToString:@"text"]) {
        
        return 120;
        
        
    }
    
    
    
    CGFloat height=[NSString stringWithFormat:@"%@",self.titleArrHeght[indexPath.row]].floatValue;
    
    
    return height;
}
- (void)creatRegetCell{

    [self.tableView registerNib:[UINib nibWithNibName:@"BaiSiBDJCell" bundle:nil] forCellReuseIdentifier:@"BaiSiBDJCell"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    BSBDJTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BSBDJTableViewCell" forIndexPath:indexPath];
    BaiSiBDJModel *model=self.contontDataController.contentArr[indexPath.row];
    
    
    
    if ([model.type isEqualToString:@"text"]) {
        
       
        
        BaiSiBDJCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BaiSiBDJCell" forIndexPath:indexPath];
        
       
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        cell.shearDelegate=self;
        cell.backgroundColor=UIColorRGBA(0xcdc4b2, 1);
        [cell showDataWithModel:model];
        
        return cell;
        
        
    }
 
    
    
    
    BSBDJTableViewCell *cell=[BSBDJTableViewCell cellWithTableView:tableView];
    
    if (self.contontDataController.contentArr.count==0) {
        return nil;
    }
    cell.shearDelegate=self;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell showDataWithModel:model];
    

    return cell;


}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self hindenShearView];


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiSiBDJModel *model=self.contontDataController.contentArr[indexPath.row];
     VideoModel *videoModel=model.videoModelArr.firstObject;
    if ([model.type isEqualToString:@"video"]||[model.type isEqualToString:@"text"]) {
        
        
        if ([model.type isEqualToString:@"video"]) {
            
            self.player=[[AVPlayerViewController alloc] init];
            
            self.player.player=[AVPlayer playerWithURL:[NSURL URLWithString:videoModel.video.firstObject]];
            
            [self.player.player play];
            
            [self presentViewController:self.player animated:YES completion:nil];
            return;
            
            
            
        }
        
        
        
        
        
        XQViewController *xq=[[XQViewController alloc] init];
        
       
        
        
        xq.model=model;
        xq.xqStr=videoModel.video.firstObject;
        xq.videoModel=videoModel;
        [ self.navigationController pushViewController:xq animated:YES];
        
        
    }
    
}

#pragma mark - delegat
- (void)wxBtnShearClickType:(NSString *)type{

    if ([type isEqualToString:@"WXSceneSession"]) {
        
        
        [self cratShearBtnWithType:type];
        
        
    }else if([type isEqualToString:@"WXSceneTimeline"]){
        
        [self cratShearBtnWithType:type];
    
    
    }else if([type isEqualToString:@"WechatAuth_Err_Ok"]){
        
        
    }else if([type isEqualToString:@"CancelShearView"]){
        
        
        [self hindenShearView];
    }
    
    
}


- (void)hindenShearView{
    
    
    if (self.shearView && self.shearView.frame.origin.y<kScreenSizeH) {
        [UIView animateWithDuration:0.2 animations:^{
            self.shearView.frame=CGRectMake(0, kScreenSizeH, kScreenSizeW, 150);
        }];
    }
}

- (void)showBaiSiBDJPLContenc:(BaiSiBDJModel *)bsModel{

    XQViewController *xq=[[XQViewController alloc] init];
    
    
    VideoModel *videoModel=bsModel.videoModelArr.firstObject;
    
    xq.model=bsModel;
    xq.xqStr=videoModel.video.firstObject;
//    xq.videoModel=videoModel;
    [ self.navigationController pushViewController:xq animated:YES];


}

- (void)showBaiSiBDJModel:(BaiSiBDJModel *)BSModel witchVideoModel:(VideoModel *)videoModel{

    
    if (self.shearView&& self.shearView.frame.origin.y<kScreenSizeH) {
        
        return;
    }
    
    
    self.shearView=[[ShearView alloc] initWithFrame:CGRectMake(0, kScreenSizeH  , kScreenSizeW, 150)];
    
    self.shearView.shearDelegate=self;
    
    [self.view addSubview:self.shearView];
    
    [UIView animateWithDuration:0.2 animations:^{

        self.shearView.frame=CGRectMake(0, kScreenSizeH-150, kScreenSizeW, 150);
        
    } completion:^(BOOL finished) {
       
    }];
    
    self.bsModel=BSModel;
    self.videoModel=videoModel;
    

    
    
    
}
- (void)cratShearBtnWithType:(NSString *)type{

    
     SendMessageToWXReq *req=[[SendMessageToWXReq alloc] init];
    
    if ([type isEqualToString:@"WXSceneSession"]) {
        req.scene=WXSceneSession;
        
    }else if ([type isEqualToString:@"WXSceneTimeline"]){
    
        req.scene=WXSceneTimeline;
        
    }
    
    
    if ([_bsModel.type isEqualToString:@"text"]) {
        
       
        req.text=_bsModel.text;
        req.bText=YES;
//        req.scene=wxType;
        [WXApi sendReq:req];
        
        
        
    }else if ([_bsModel.type isEqualToString:@"video"]||[_bsModel.type isEqualToString:@"gif"]){
        WXMediaMessage *message=[WXMediaMessage message];
        message.title=_bsModel.text;
        message.description=@"🔫";
        
        
        WXWebpageObject *videoObject=[WXWebpageObject object];
        
        videoObject.webpageUrl=_bsModel.share_url;
        message.mediaObject=videoObject;
        
//        SendMessageToWXReq *req=[[SendMessageToWXReq alloc] init];
        
        req.bText=NO;
        req.message=message;
//        req.scene=wxType;
        
        [WXApi sendReq:req];
        
        
        
        
    }else if ([_bsModel.type isEqualToString:@"image"]){
        WXMediaMessage *message=[WXMediaMessage message];
        
        [message setThumbImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_videoModel.thumbnail_small.lastObject]]]];
        
        
        WXImageObject *imageObject=[WXImageObject object];
        
        
        
        imageObject.imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:_videoModel.medium.lastObject]];
        
        message.mediaObject=imageObject;
        
//        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        
        req.bText=NO;
        req.message=message;
//        req.scene=wxType;
        [WXApi sendReq:req];
        
        
        
    }
    


}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

- (void)loadDataFinishWithResouse:(LoadDataController *)controller{

    
    [self endReafreshFooterView];
    [self endReafreshHeadView];
    
    self.titleArrHeght =[NSMutableArray array];
    
    dispatch_queue_t queur=dispatch_queue_create(0, 0);
    
    dispatch_async(queur, ^{
       
        
       
        
        for (BaiSiBDJModel *model in self.contontDataController.contentArr) {
            
//            double heght=[self cellHeightWithContent:[NSString stringWithFormat:@"%@",model.text]];
            
            double heght;
            
            if ([model.type isEqualToString:@"text"]) {
                
                
              heght=100  ;
                
            }else{
            
             heght=[self cellHeightWithContent:model.text];
            }
            double imageHeight=[self cellImageHeight:model.videoModelArr.lastObject witchType:model.type];
            
            
            NSString *height=[NSString stringWithFormat:@"%f",heght+80+imageHeight];

            
            [self.titleArrHeght addObject:height];
            
           
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.hud hide:YES ];
            [self.tableView reloadData];
        });
        
        
        
    });

}

- (double)cellImageHeight:(VideoModel *)videomodel witchType:(NSString *)type{


    double imageHeight=(kScreenSizeW-20) *videomodel.height.doubleValue/videomodel.width.doubleValue;
    
    if ([type isEqualToString:@"image"]) {
        imageHeight+=40;
    }
    
    
    
    return imageHeight;


}

- (double)cellHeightWithContent:(NSString *)content{

//     CGSize size = CGSizeMake(kScreenSizeW-30,CGFLOAT_MAX);//LableWight标签宽度，固定的
//    CGSize labelsize = [content sizeWithFont:[UIFont systemFontOfSize:16.f] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    
    
    

    return [self contentSizeWith:content].height;

}

- (CGSize)contentSizeWith:(NSString *)content {
    
    
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
    

    
//    style.lineBreakMode = NSLineBreakByWordWrapping;
//    style.alignment = NSTextAlignmentLeft;
//    
//    NSDictionary * attributes = @{NSFontAttributeName : @16.f,
//                                  NSParagraphStyleAttributeName : style};
//    
//    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(kScreenSizeW-16, MAXFLOAT)
//                                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
//                                              attributes:attributes
//                                                 context:nil].size;
    return size;
}

- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{

    NSLog(@"失败！");
    [self.hud hide:YES];

    [self endReafreshFooterView];
    [self endReafreshHeadView];
    
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
