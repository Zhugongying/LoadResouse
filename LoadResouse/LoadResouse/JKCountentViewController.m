//
//  JKCountentViewController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "JKCountentViewController.h"
#import "JKCell.h"
#import "CenterModel.h"
#import "JKContentLoadDataController.h"
#import "ContentViewController.h"

@interface JKCountentViewController ()<LoadDataControllerDelegate>
@property (nonatomic, copy) JKContentLoadDataController *jkDataController;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic) NSInteger pageCount;
@end

@implementation JKCountentViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self creatTableView];
    [self refreshTableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"JKCell" bundle:nil] forCellReuseIdentifier:@"JKCell"];
    self.pageCount = 1;
    [self loadDataWithPage:self.pageCount];
}

- (void)loadDataWithPage: (NSInteger ) page {
    _jkDataController = [[JKContentLoadDataController alloc] initWithDelegate:self ];
    _jkDataController.loadUrl = [NSString stringWithFormat:@"%@&cate_id=%@&page=%ld", @"http://wiki.jikexueyuan.com/apis/1/project/list?from=2-10.0.2-4.4.3&page=1&per_page=10", self.loadID, page];
    [_jkDataController requestWithArgs:nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JKCell"];
    CenterModel *model = self.dataArr[indexPath.row];
    [cell fullCellWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 76;
}
- (void)refreshFooterView {
    self.pageCount ++;
    [self loadDataWithPage:self.pageCount];
}
- (void)refreshHeadView {
    self.pageCount = 1;
    [self loadDataWithPage:1];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CenterModel *model = self.dataArr[indexPath.row];
    ContentViewController *web = [[ContentViewController alloc] init];
//    web.loadUrl = model.contentUrl;
    [self.navigationController pushViewController:web animated:YES];
}

- (void)loadDataFinishWithResouse:(LoadDataController *)controller {
    
    if (self.pageCount == 1) {
        self.dataArr = _jkDataController.dataArr;
    } else {
        for (CenterModel * model in _jkDataController.dataArr) {
            [self.dataArr addObject:model];
        }
    }
    [self endReafreshHeadView];
    [self endReafreshFooterView];
    [self.tableView reloadData];
}
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error {
    [self endReafreshHeadView];
    [self endReafreshFooterView];
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
