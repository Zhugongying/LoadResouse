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
    
    
    [fenlei requestOtherUrl:^(NSString *url) {
    
        self.hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        self.hud.mode=MBProgressHUDModeText;
        _hud.labelText=@"稍等。。。";
        _hud.margin=10.f;
        
        
        
        
        self.contontDataController=[[LoadDataBaisiControl alloc] initWithDelegate:self];
        
        _contontDataController.contentURL=[NSString stringWithFormat:@"%@%@",url,@"bs0315-iphone-4.3/0-20.json"];
    
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
    
   
    
    CGFloat height=[NSString stringWithFormat:@"%@",self.titleArrHeght[indexPath.row]].floatValue;
    
    
    return height;
}
- (void)creatRegetCell{

    [self.tableView registerNib:[UINib nibWithNibName:@"BaiSiBDJCell" bundle:nil] forCellReuseIdentifier:@"BaiSiBDJCell"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BaiSiBDJCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BaiSiBDJCell" forIndexPath:indexPath];
    
    if (self.contontDataController.contentArr.count==0) {
        return nil;
    }
    
    BaiSiBDJModel *model=self.contontDataController.contentArr[indexPath.row];
    
    [cell showDataWithModel:model];
 
    
    
    
    return cell;


}
- (void)loadDataFinishWithResouse:(LoadDataController *)controller{

    
    self.titleArrHeght =[NSMutableArray array];
    
    dispatch_queue_t queur=dispatch_queue_create(0, 0);
    
    dispatch_async(queur, ^{
       
        
       
        
        for (BaiSiBDJModel *model in self.contontDataController.contentArr) {
            
            double heght=[self cellHeightWithContent:model.text];
            
            
            
            double imageHeight=[self cellImageHeight:model.videoModelArr.lastObject];
            
            
            NSString *height=[NSString stringWithFormat:@"%f",heght+60+imageHeight];

            
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

     CGSize size = CGSizeMake(kScreenSizeW-30,CGFLOAT_MAX);//LableWight标签宽度，固定的
    CGSize labelsize = [content sizeWithFont:[UIFont systemFontOfSize:16.f] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    

    return labelsize.height;

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
