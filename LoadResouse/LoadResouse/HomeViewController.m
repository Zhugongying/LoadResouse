//
//  HomeViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "HomeViewController.h"
#import <SDCycleScrollView.h>

#import "VideoCollectionViewCell.h"
#import "AQYViewController.h"
#import "XLKKViewController.h"
#import "MMYGViewController.h"
#import "TextViewController.h"
#import "BoysViewController.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *dataArr;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    [self creatLeftBtn];
    [self creatBannerView];
    
    [self creatColectionView];
    [self loadDataResouse];
}

- (void)creatLeftBtn{

    UIImage *image=[[UIImage imageNamed:@"left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
}

- (void)creatBannerView{

    NSArray *imageUrlArr=@[@"http://sr4.pplive.com/cms/34/76/6733a9c91345276ed628cc553a1b01d6.jpg",
                           @"http://sr3.pplive.com/cms/98/28/f621a44c9f444c063e70d6193f7dbce0.jpg",
                           @"http://sr2.pplive.com/cms/24/86/9be05fc140066b35f601555803a4d1ae.jpg",
                           @"http://sr4.pplive.com/cms/33/76/881f05ffee6e427bf75c43ed28d6f3f2.jpg",
                           @"http://sr2.pplive.com/cms/30/15/6b594536e5f9bef820d87707cb342be5.jpg",
                           @"http://sr1.pplive.com/cms/28/14/57035dff454d5933d18db8c74a62ff2a.jpg",];
    

    //加载网络图片
    
    //    SDCycleScrollView *sdcyScroller=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 35, kScreenSizeW, 200) imageNamesGroup:@[@"one",@"two"]];
    
    
    SDCycleScrollView *sdcyScroller =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 35, kScreenSizeW, 215) delegate:self placeholderImage:[UIImage imageNamed:@"one"]];
    
    sdcyScroller.imageURLStringsGroup=imageUrlArr;
    
    [self.view addSubview:sdcyScroller];


}
#pragma  mark - 轮播代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{


    NSLog(@"%ld",(long)index);
    
}

- (void)creatColectionView{

//    UICollectionViewLayout *layout=[[UICollectionViewLayout alloc] init];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumLineSpacing=1;
    
    flowLayout.minimumInteritemSpacing=1;
    
//    flowLayout.itemSize=CGSizeMake((kScreenSizeW-40)/3, 30);

    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    
    
    
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 255, kScreenSizeW, kScreenSizeH-255) collectionViewLayout:flowLayout];
    
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    
    self.collectionView.scrollEnabled=NO;
    self.collectionView.backgroundColor=UIColorRGBA(0xd6f1fd, 1);
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"VideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"VideoCollectionViewCell"];
    
    
    [self.view addSubview:self.collectionView];
}
- (void)loadDataResouse{

    self.dataArr=@[@{
                       @"image":@"aqy",
                       @"text":@"爱奇艺"
                       },
                   @{
                       @"image":@"xl",
                       @"text":@"迅雷",
                       },
                   @{
                       @"image":@"mmyg",
                       @"text":@"木木优购"
                       },
                   @{
                       @"image":@"",
                       @"text":@"测试"
                       },
                   @{
                       @"image": @"",
                       @"text": @"Boys"
                       },
                   @{
                       @"image": @"",
                       @"text": @"极客网"
                       }
                   
                   ];

    [self.collectionView reloadData];
    

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    VideoCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCollectionViewCell" forIndexPath:indexPath];
    
    

//    cell.backgroundColor=UIColorRGBA(0xffffff, 1);
    
    cell.headImageView.image=[UIImage imageNamed:self.dataArr[indexPath.row][@"image"]];
    cell.textLable.text=self.dataArr[indexPath.row][@"text"];
    
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(1, 1, 1, 1);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


    return CGSizeMake((kScreenSizeW-5)/4, 98);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0://爱奇艺
        {
            AQYViewController *aqy=[[AQYViewController alloc] init];
            aqy.title=@"爱奇艺";
            [self.navigationController pushViewController:aqy animated:YES];

        }
            break;
            
            case 1:
        {
        
            XLKKViewController *xl=[[XLKKViewController alloc] init];
            xl.title=@"迅雷";
            [self.navigationController pushViewController:xl animated:YES];
        
        }
            break;
            
        case 2:
        {
        
            MMYGViewController *mmyg=[[MMYGViewController alloc] init];
            [self.navigationController pushViewController:mmyg animated:YES];
            
            
        }
            break;
            case 3:
        {
            TextViewController *text=[[TextViewController alloc] init];
            
            [self.navigationController pushViewController:text animated:YES];
        
        }
            break;
            case 4:
        {
            BoysViewController *boy = [[BoysViewController alloc] init];
            [self.navigationController pushViewController:boy animated:YES];
        }
            
            
        default:
           
            
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
