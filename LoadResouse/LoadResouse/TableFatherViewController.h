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

@end
