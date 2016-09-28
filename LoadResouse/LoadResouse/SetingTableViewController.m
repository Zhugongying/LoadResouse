//
//  SetingTableViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/26.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "SetingTableViewController.h"

@interface SetingTableViewController ()

@end

@implementation SetingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title=@"设置";
    [self creatLeftBtn];
    [self loadDataResouse:@[@[@"字体大小"],@[@"清除缓存",@"关于我",@"当前版本"]]];
     [self creatTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return [self.dataResouse count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataResouse[section] count];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    cell.textLabel.text=self.dataResouse[indexPath.section][indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 20;
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
