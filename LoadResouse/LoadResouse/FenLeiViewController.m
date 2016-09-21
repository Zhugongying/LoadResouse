//
//  FenLeiViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/9.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "FenLeiViewController.h"

#import "FenleiCell.h"
#import "MyHeadView.h"
#import "BaiSiBDJDataController.h"
#import "TitleModel.h"
@interface FenLeiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,LoadDataControllerDelegate>
{

    MBProgressHUD *_hud;
    
}
@property (nonatomic,strong)BaiSiBDJDataController *bsData;
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation FenLeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataResouse];
    [self creatCollectionView];
}

- (void)loadDataResouse{

    _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    _hud.color=[UIColor clearColor];
    _hud.labelText=@"加载中。。。";
    _hud.dimBackground=YES;
    
    
    
    _bsData=[[BaiSiBDJDataController alloc] initWithDelegate:self];
    
    [_bsData requestWithArgs:nil];
    
    
}


- (void)creatCollectionView{


    self.automaticallyAdjustsScrollViewInsets=YES;
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumLineSpacing=5;
    
    flowLayout.minimumInteritemSpacing=5;
    
    flowLayout.itemSize=CGSizeMake((kScreenSizeW-40)/3, 30);
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenSizeW, kScreenSizeH-64) collectionViewLayout:flowLayout];
    
    self.collectionView.backgroundColor=UIColorRGBA(0xf2f3f8f8, 1);
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    self.collectionView.scrollEnabled=YES;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"FenleiCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"FenLeiCell"];
    
    [self.collectionView registerClass:[MyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView_Head"];

//    [self.collectionView registerNib:[UINib nibWithNibName:@"UICollectionReusableView_Head" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
    
    [self.view addSubview:self.collectionView];
    


}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.bsData.dataSouseArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    TitleModel *mode=self.bsData.dataSouseArr[section];
    
    
    
    return [mode.submenus count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    FenleiCell *cell=(FenleiCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FenLeiCell" forIndexPath:indexPath ];
    
    
    TitleModel *mode=self.bsData.dataSouseArr[indexPath.section];
    
    HeadTileModel *headModel=mode.titleList[indexPath.row];
    
    cell.contentView.backgroundColor=UIColorRGBA(0xf5f5f5f5, 1);
    
    cell.fenLeiName.text=headModel.name;


    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
        
        TitleModel *mode=self.bsData.dataSouseArr[indexPath.section];
        
        
        MyHeadView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView_Head" forIndexPath:indexPath];
        headView.backgroundColor=UIColorRGBA(0xf1f1f1f1, 1);
    
        UILabel *nameLable=[[UILabel alloc] initWithFrame:CGRectMake(headView.bounds.origin.x+30, headView.bounds.origin.y, headView.bounds.size.width-30, headView.bounds.size.height)];
        
        nameLable.text=mode.name;
        
        [headView addSubview:nameLable];
        
        
        
        return headView;
        
    }
    


    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    TitleModel *mode=self.bsData.dataSouseArr[indexPath.section];
    
    HeadTileModel *headModel=mode.titleList[indexPath.row];
    
  
    NSString *titleStr=[NSString stringWithFormat:@"%@-%@",mode.name,headModel.name];
    
    
    _myBlock(headModel.url,titleStr);
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)requestOtherUrl:(FenLeiViewControllerBlockUrl)block{

    
    _myBlock=block;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(5, 5, 5, 5);

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake((kScreenSizeW-20)/3, 40);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(kScreenSizeW, 40);
}
- (void)loadDataFinishWithResouse:(LoadDataController *)controller{

    [self.collectionView reloadData];
    
    
    [_hud hide:YES afterDelay:1];
    

}
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{

    [_hud hide:YES];

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
