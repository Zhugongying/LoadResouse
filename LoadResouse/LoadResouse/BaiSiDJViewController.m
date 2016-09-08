//
//  BaiSiDJViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BaiSiDJViewController.h"
#import "BaiSiBDJCell.h"

@interface BaiSiDJViewController ()

@end

@implementation BaiSiDJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTableView];
    [self creatRegetCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (void)creatRegetCell{

    [self.tableView registerNib:[UINib nibWithNibName:@"BaiSiBDJCell" bundle:nil] forCellReuseIdentifier:@"BaiSiBDJCell"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BaiSiBDJCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BaiSiBDJCell" forIndexPath:indexPath];
    
    return cell;


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
