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

@interface BaiSiDJViewController ()<LoadDataControllerDelegate>

@property (nonatomic,strong)UICollectionView *chouseCollectView;
@property (nonatomic,strong)NSMutableArray *titleArrHeght;

@property (nonatomic,strong)LoadDataBaisiControl *contontDataController;

@property (nonatomic,strong)MBProgressHUD *hud;
@end

@implementation BaiSiDJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self creatTableView];
    [self creatRegetCell];
    
    [self loadDataResouse:nil];
    [self creatBarBtnRight];
}
#pragma mark - 创建筛选按钮
- (void)creatBarBtnRight{

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(presenView)];

}


- (void)presenView{

    FenLeiViewController * fenlei=[[FenLeiViewController alloc] init];
    
    
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
        
        
        self.contontDataController=[[LoadDataBaisiControl alloc] initWithDelegate:self];
        
        _contontDataController.contentURL=[NSString stringWithFormat:@"%@%@",newUrl,@"bs0315-iphone-4.3/0-20.json"];
    
        [_contontDataController requestWithArgs:nil];
    
    }];
    
    [self.navigationController pushViewController:fenlei animated:YES];
    

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
        
        [cell showDataWithModel:model];
        
        return cell;
        
        
    }
    
    
    BSBDJTableViewCell *cell=[BSBDJTableViewCell cellWithTableView:tableView];
    
    if (self.contontDataController.contentArr.count==0) {
        return nil;
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell showDataWithModel:model];

    return cell;


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiSiBDJModel *model=self.contontDataController.contentArr[indexPath.row];
    
    if ([model.type isEqualToString:@"video"]||[model.type isEqualToString:@"text"]) {
        
        XQViewController *xq=[[XQViewController alloc] init];
        
        VideoModel *videoModel=model.videoModelArr.firstObject;
        
        
        xq.model=model;
        xq.xqStr=videoModel.video.firstObject;
        [ self.navigationController pushViewController:xq animated:YES];
        
        
    }
    
}

- (void)loadDataFinishWithResouse:(LoadDataController *)controller{

    
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
            double imageHeight=[self cellImageHeight:model.videoModelArr.lastObject];
            
            
            NSString *height=[NSString stringWithFormat:@"%f",heght+80+imageHeight];

            
            [self.titleArrHeght addObject:height];
            
           
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.hud hide:YES ];
            [self.tableView reloadData];
        });
        
        
        
    });

}

- (double)cellImageHeight:(VideoModel *)videomodel{


    double imageHeight=(kScreenSizeW-20) *videomodel.height.doubleValue/videomodel.width.doubleValue;
    
    
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
