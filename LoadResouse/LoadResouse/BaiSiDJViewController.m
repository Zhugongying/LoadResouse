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


@interface BaiSiDJViewController ()<LoadDataControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *chouseCollectView;
@property (nonatomic,strong)NSMutableArray *titleArr;

@end

@implementation BaiSiDJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    [self.navigationController pushViewController:fenlei animated:YES];
    

}

- (void)loadDataResouse:(NSArray *)arr{
    
    BaiSiBDJDataController *bsData=[[BaiSiBDJDataController alloc] initWithDelegate:self];
    
    [bsData requestWithArgs:nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return 160;
}
- (void)creatRegetCell{

    [self.tableView registerNib:[UINib nibWithNibName:@"BaiSiBDJCell" bundle:nil] forCellReuseIdentifier:@"BaiSiBDJCell"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BaiSiBDJCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BaiSiBDJCell" forIndexPath:indexPath];
    
    return cell;


}
- (void)loadDataFinishWithResouse:(LoadDataController *)controller{


}
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{



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
