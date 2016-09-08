//
//  MoreToolViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "MoreToolViewController.h"
#import "XTGNViewController.h"
#import "BaiSiDJViewController.h"
@interface MoreToolViewController ()

@end

@implementation MoreToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatLeftBtn];
    self.title = @"功能模块";
    [self creatTableView];
    [self loadDataResouse:nil];
}
- (void)loadDataResouse:(NSArray *)arr{
    
    self.dataResouse=[NSMutableArray arrayWithObjects:@"系统模块",@"百思不得姐", nil];
    [self.tableView reloadData];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            XTGNViewController *xtmk=[[XTGNViewController alloc] init];
            [self.navigationController pushViewController:xtmk animated:YES];
        
        
        }
            break;
            case 1:
        {
        
            BaiSiDJViewController *bdj=[[BaiSiDJViewController alloc] init];
            [self.navigationController pushViewController:bdj animated:YES];
        
        }
            
        default:
            break;
    }
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
