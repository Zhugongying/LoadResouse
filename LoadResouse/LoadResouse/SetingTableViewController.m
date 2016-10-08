//
//  SetingTableViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/26.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "SetingTableViewController.h"
#import "SettingTableViewCell.h"
@interface SetingTableViewController ()
{

    float cacheNub;
    BOOL _loadOne;
}

@end

@implementation SetingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"设置";
    [self creatLeftBtn];
    [self loadDataResouse:@[@[@"字体大小"],@[@"清除缓存",@"关于我",@"当前版本"]]];
    
     [self creatTableView];
    [self creatRegetCell];
    
    cacheNub=[self clearCache];
    _loadOne=YES;
}
- (void)creatRegetCell{

    [self.tableView registerNib:[UINib nibWithNibName:@"SettingTableViewCell" bundle:nil] forCellReuseIdentifier:@"SettingTableViewCell"];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return [self.dataResouse count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataResouse[section] count];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    static NSString *cellID=@"Cell";
    
    SettingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SettingTableViewCell" forIndexPath:indexPath];

    if (indexPath.section==1&&indexPath.row==0 ) {
    
        cell.subTitleLable.text=[NSString stringWithFormat:@"%.2f M",cacheNub];
        
    }
    if (indexPath.section==1 && indexPath.row==2) {
        
        cell.subTitleLable.text=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    }
    
    cell.titleLable.text=self.dataResouse[indexPath.section][indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    
    if (indexPath.section==1 && indexPath.row==0) {
        
        [self removeedChace];
        
        cacheNub=0;
       
        NSArray *indexArr=[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:1]];
        
        [self.tableView reloadRowsAtIndexPaths:indexArr withRowAnimation:UITableViewRowAnimationFade];

       
    }
    

}

- (float)clearCache{

    NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    
    NSFileManager *filemanager=[NSFileManager defaultManager];
    
    float folderSize;
    if ([filemanager fileExistsAtPath:path]) {
        
        NSArray *childerFile=[filemanager subpathsAtPath:path];
        
        for (NSString *fileName in childerFile) {
            
            NSString *fullpath=[path stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizePath:fullpath];
        }
        
        NSArray *indexArr=[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:1]];
        
        [self.tableView reloadRowsAtIndexPaths:indexArr withRowAnimation:UITableViewRowAnimationFade];
    }
    
    
    
    return folderSize;

}
- (float)fileSizePath:(NSString *)path{

    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024/1024.0;
    }
    return 0;


}

- (void)removeedChace{

    NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFile=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFile) {
            NSString *sbsolutePath=[path stringByAppendingPathComponent:fileName];
            
            [fileManager removeItemAtPath:sbsolutePath error:nil];
        }
    }
    
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
