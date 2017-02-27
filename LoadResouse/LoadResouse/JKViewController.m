//
//  JKViewController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "JKViewController.h"
#import "JKLoadDataController.h"
#import "JKModel.h"
#import "JKCountentViewController.h"

@interface JKViewController ()<UITableViewDelegate, UITableViewDataSource, LoadDataControllerDelegate>
@property (nonatomic, strong) UITableView *baseTableView;
@property (nonatomic, strong) UITableView *subTableView;
@property (nonatomic, strong) JKLoadDataController *jkLoadDataController;
@property (nonatomic, strong) NSMutableArray *baseArr;
@property (nonatomic, strong) NSMutableDictionary *resoutDict;
@property (nonatomic, strong) NSMutableArray *subArr;

@end

@implementation JKViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"极客网";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self creatTableView];
    _jkLoadDataController = [[JKLoadDataController alloc] initWithDelegate:self ];
    _jkLoadDataController.loadUrlStr = @"http://wiki.jikexueyuan.com/apis/1/project/group?api_key=sEc5qE9f&api_sig=81971dcf8eab8dfc54b51b975b9b31ca&channel=AppStore&from=2-10.0.2-4.4.3&nonce=6313408&timestamp=1486696564";
    [_jkLoadDataController requestWithArgs:nil ];
}

- (void)creatTableView {
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenSizeW *2/ 5, kScreenSizeH - 64) style:UITableViewStylePlain];
    self.subTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenSizeW * 2/5, 64, kScreenSizeW *3 /5, kScreenSizeH - 64) style:UITableViewStylePlain];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    self.subTableView.delegate = self;
    self.subTableView.dataSource = self;
    self.baseTableView.tableFooterView = [[UIView alloc] init];
    self.subTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.baseTableView];
    [self.view addSubview:self.subTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == _baseTableView) {
        
        return self.baseArr.count;
    }
    return [self.subArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    if (tableView == _baseTableView) {
        cell.textLabel.text = self.baseArr[indexPath.row];
    } else {
        SubJKModel *model = self.subArr[indexPath.row];
        
        cell.textLabel.text = model.subName;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _baseTableView) {
       
        NSString *key = self.baseArr[indexPath.row];
        self.subArr = self.resoutDict[key];
        
        [self.subTableView reloadData];
        
    }
    if (tableView == _subTableView) {
        SubJKModel *model = self.subArr[indexPath.row];
        JKCountentViewController *jk =[[JKCountentViewController alloc] init];
        jk.loadID = model.changeID;
        jk.title = model.subName;
        [ self.navigationController pushViewController:jk animated:YES];
    }
}


- (void)loadDataFinishWithResouse:(LoadDataController *)controller {

    self.baseArr = self.jkLoadDataController.baseArr;
    self.resoutDict = self.jkLoadDataController.reouseDict;
    self.subArr = self.resoutDict[self.baseArr.firstObject];
    
    [self.baseTableView reloadData];
    [self.subTableView reloadData];
    
    [self.baseTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    
}

- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error {

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
