//
//  FenLeiViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/9.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "FenLeiViewController.h"

#import "FenleiCell.h"
#import "UICollectionReusableView_Head.h"
@interface FenLeiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{

    
    
}
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation FenLeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatCollectionView];
}

- (void)creatCollectionView{


    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumLineSpacing=5;
    
    flowLayout.minimumInteritemSpacing=5;
    
    flowLayout.itemSize=CGSizeMake((kScreenSizeW-40)/3, 30);
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH) collectionViewLayout:flowLayout];
    
    self.collectionView.backgroundColor=[UIColor whiteColor];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    self.collectionView.scrollEnabled=YES;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"FenleiCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"FenLeiCell"];
    
//    [self.collectionView registerClass:[UICollectionReusableView_Head class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView_Head"];

    [self.collectionView registerNib:[UINib nibWithNibName:@"UICollectionReusableView_Head" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView_Head"];
    
    [self.view addSubview:self.collectionView];
    


}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    FenleiCell *cell=(FenleiCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FenLeiCell" forIndexPath:indexPath ];
    
    
    
    cell.contentView.backgroundColor=[UIColor lightGrayColor];
    
    cell.fenLeiName.text=@"ssdssdsd";


    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView_Head *headView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView_Head" forIndexPath:indexPath];
        headView.backgroundColor=[UIColor redColor];
        return headView;
        
    }
    


    return nil;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(5, 5, 5, 5);

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
