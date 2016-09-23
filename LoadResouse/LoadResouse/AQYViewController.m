//
//  AQYViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/22.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "AQYViewController.h"

#import "AQYLoadDataControl.h"
#import "AQYXQViewController.h"
@interface AQYViewController ()<LoadDataControllerDelegate,UISearchBarDelegate>
@property (nonatomic,strong)AQYLoadDataControl *aqyLoad;
@end

@implementation AQYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
//    [self loadData];
    [self loadSearchBar];
    
}

- (void)loadSearchBar{

    UISearchBar *serchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, kScreenSizeW, 40)];
    
    serchBar.barStyle=UIBarStyleDefault;
    serchBar.placeholder=@"爱奇艺我懂你！";
    serchBar.searchBarStyle=UISearchBarStyleProminent;
    serchBar.showsCancelButton=YES;
   
    
    serchBar.delegate=self;
    [self.view addSubview:serchBar];
    

}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{

    
//    [self.tableView removeFromSuperview];
    
    return NO;

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{

    [searchBar resignFirstResponder];
    searchBar.text=@"";
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    
    
   
    
    return YES;

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    NSLog(@"%@",searchBar.text);
    NSLog(@"%@",searchText);

    [self loadDataWith:searchText];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated{


    [self registerForKeyboardNotifications];
}

- (void)registerForKeyboardNotifications
{
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
}
//实现当键盘出现的时候计算键盘的高度大小。用于输入框显示位置
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"hight_hitht:%f",kbSize.height);
    
    
    [self creatTableView];
    
     self.tableView.frame=CGRectMake(0, 64+42, kScreenSizeW, kScreenSizeH-64-42-kbSize.height-1);
    
    
    //输入框位置动画加载
   
}
//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    //do something
    self.tableView.frame=CGRectMake(0, 64+42, kScreenSizeW, kScreenSizeH-64-42-1);
    
}

- (void)loadDataWith:(NSString *)searchStr{
    
    self.aqyLoad=[[AQYLoadDataControl alloc] initWithDelegate:self];
    
    self.aqyLoad.loadUrl=[NSString stringWithFormat:@"http://suggest.video.iqiyi.com/?if=mobile&rltnum=10&key=%@&uid=5CE94083-CF6B-492F-9AC1-2517D2C18445&ppuid=1203702851&platform=&version=7.7",[searchStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    [self.aqyLoad requestWithArgs:nil];
    
}

#pragma tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

  return   self.aqyLoad.contentArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }

    cell.textLabel.text=self.aqyLoad.contentArr[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    AQYXQViewController *aqy=[[AQYXQViewController alloc] init];
    
    
    aqy.loadStr=[NSString stringWithFormat:@"http://so.iqiyi.com/so/q_%@",[self.aqyLoad.contentArr[indexPath.row] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [self.navigationController pushViewController:aqy animated:YES];

    
    


}


#pragma mark - 网络加载代理
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{

}
- (void)loadDataFinishWithResouse:(LoadDataController *)controller{
    
    [self.tableView reloadData];
    


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
