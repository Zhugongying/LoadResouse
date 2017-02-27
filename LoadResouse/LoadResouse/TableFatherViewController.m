//
//  TableFatherViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "TableFatherViewController.h"

#import <MJRefresh.h>
#import <UIScrollView+MJRefresh.h>
@interface TableFatherViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TableFatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)creatTableView{

    self.automaticallyAdjustsScrollViewInsets=NO;
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenSizeW, kScreenSizeH-64) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.tableFooterView=[[UIView alloc] init];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor=UIColorRGBA(0xfefefe, 0.7);
        
    self.tableView.backgroundView.alpha=0.5f;
    
    [self.view addSubview:self.tableView];
    
   
    
}

#pragma mark - MJRefreah

- (void)refreshTableView{

    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeadView)];
    
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterView)];

}
- (void)refreshHeadView{
    


}
- (void)refreshFooterView{
    


}

- (void)endReafreshHeadView{

    [self.tableView.mj_header endRefreshing];

}
- (void)endReafreshFooterView{
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - 

- (void)creatRegetCell{


}
- (void)loadDataResouse:(NSArray *)arr{

    self.dataResouse=[NSMutableArray arrayWithArray:arr];

}
#pragma mark - tableviewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataResouse.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text=self.dataResouse[indexPath.row];
    cell.alpha=0.5;
    cell.backgroundColor=[UIColor clearColor];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{


}
#pragma mark - 左侧按钮

- (void)creatLeftBtn{
    UIImage *image=[[UIImage imageNamed:@"left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.image = [UIImage imageNamed:@"Balloon"];
    [self.view addSubview:imageView];
    
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
