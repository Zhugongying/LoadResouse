//
//  TableFatherViewController.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableFatherViewController : UIViewController

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataResouse;

- (void)creatTableView;
- (void)loadDataResouse:(NSArray *)arr;
- (void)creatLeftBtn;
- (void)creatRegetCell;//自定义cell


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;


- (void)refreshTableView;
- (void)refreshHeadView;
- (void)refreshFooterView;

- (void)endReafreshHeadView;
- (void)endReafreshFooterView;


@end
