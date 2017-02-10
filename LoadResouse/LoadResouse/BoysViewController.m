//
//  BoysViewController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/9.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "BoysViewController.h"
#import "BoysModel.h"
#import "BoysCell.h"
#import "BoysLoadDataController.h"
#import "AQYXQViewController.m"


@interface BoysViewController () <LoadDataControllerDelegate, PlayViewClickDelegeate>
@property (nonatomic, strong) NSMutableArray *resourtArr;
@property (nonatomic, strong) BoysLoadDataController *contontDataController;
@end

@implementation BoysViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 250;
    [self.tableView registerNib:[UINib nibWithNibName:@"BoysCell" bundle:nil] forCellReuseIdentifier:@"BoysCell"];
    _contontDataController = [[BoysLoadDataController alloc] initWithDelegate:self];
    
    [_contontDataController requestWithArgs:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _resourtArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BoysCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BoysCell" forIndexPath:indexPath];
    cell.playDelegeate = self;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BoysModel *model = self.resourtArr[indexPath.row];
    [cell setBoysCellWithModek:model];
    
    return cell;
}

- (void)videoPlayClick:(BoysModel *)model {
//    AQYXQViewController *web = [[AQYXQViewController alloc] init];
//    web.loadStr = model.videoStr;
//    [self.navigationController pushViewController:web animated:YES];
}

- (void)loadDataFinishWithResouse:(LoadDataController *)controller {
    self.resourtArr = self.contontDataController.dataSouseArr;
    
    [self.tableView reloadData];
    
}

- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error {

}

@end
