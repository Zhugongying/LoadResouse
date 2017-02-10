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
#import "WebViewController.h"
#import "BoysLoadDataController.h"

@interface BoysViewController () <LoadDataControllerDelegate, PlayViewClickDelegeate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *resourtArr;
@property (nonatomic, strong) BoysLoadDataController *contontDataController;
@property (nonatomic, strong) UISegmentedControl *segmented;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *urlArr;
@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic) NSInteger page;
@end



@implementation BoysViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40 , kScreenSizeW, kScreenSizeH - 40) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    self.tableView.estimatedRowHeight = 250;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"BoysCell" bundle:nil] forCellReuseIdentifier:@"BoysCell"];
    [self loadDataResout:@"http://api.miaopai.com/m/cate2_channel.json?cateid=158&extend=1&os=ios&page=1&per=20type=news&vend=miaopai"];
    [self setSegment];
    [self refreshTableView];
    self.page = 1;
    self.baseUrl = @"http://api.miaopai.com/m/cate2_channel.json?cateid=158&extend=1&os=ios&per=20type=news&vend=miaopai";
}

- (void)setSegment{
    _titleArr = @[@"最新", @"舞蹈", @"女神", @"音乐", @"日系"];
    
    _urlArr = @[@"cateid=158&extend=1&os=ios&per=20type=news&vend=miaopai", @"os=ios&per=20&stpid=XqLH1jhWz5L1decQ&type=2&vend=miaopai", @"os=ios&per=20&stpid=NHTxkvi-vAWOgztC&type=2&vend=miaopai", @"os=ios&per=20&stpid=PPr93pHiTrOqgTns&type=2&vend=miaopai", @"os=ios&per=20&stpid=7yTmL6MJ9Rx0pFk~&type=2&vend=miaopai"];
    
    self.segmented = [[UISegmentedControl alloc] initWithItems:_titleArr];
    self.segmented.frame = CGRectMake(0, 64, kScreenSizeW, 40);
    [self.segmented addTarget:self action:@selector(didClickSegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmented];
    self.segmented.backgroundColor = [UIColor whiteColor];
    
    [self.segmented setSelectedSegmentIndex:0];
}

- (void)loadDataResout: (NSString *)url {
    _contontDataController = [[BoysLoadDataController alloc] initWithDelegate:self];
    
    _contontDataController.contentUrl = url;
    [_contontDataController requestWithArgs:nil];
}

- (void)didClickSegmentedControlAction: (UISegmentedControl*)seg {
    
    self.page = 1;
    NSString *url = _urlArr[seg.selectedSegmentIndex];
    
    NSString *loadUrl = [NSString stringWithFormat:@"%@%@", seg.selectedSegmentIndex == 0 ? @"http://api.miaopai.com/m/cate2_channel.json?" : @"http://api.miaopai.com/m/v2_topic.json?", url];
    self.baseUrl = loadUrl;
    [self loadDataResout:[NSString stringWithFormat:@"%@%@", loadUrl, @"&page=1"]];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}

- (void)videoPlayClick:(BoysModel *)model {
    WebViewController *web = [[WebViewController alloc] init];
    web.loadUrl = model.videoStr;
    [self.navigationController pushViewController:web animated:YES];
}

- (void)refreshFooterView {
    self.page++;
    NSString *url = [NSString stringWithFormat:@"%@&page=%ld", self.baseUrl, self.page];
    [self loadDataResout:url];
}

- (void)refreshHeadView {
    self.page = 1;
    NSString *url = [NSString stringWithFormat:@"%@&page=%ld", self.baseUrl, self.page];
    [self loadDataResout:url];
}

- (void)loadDataFinishWithResouse:(LoadDataController *)controller {
    [self endReafreshFooterView];
    [self endReafreshHeadView];
    if (self.page == 1) {
        self.resourtArr = self.contontDataController.dataSouseArr;
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    } else {
        for (BoysModel *model in self.contontDataController.dataSouseArr) {
            [self.resourtArr addObject:model];
        }
        [self.tableView reloadData];
    }
    
    
    
}

- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error {
    [self endReafreshFooterView];
    [self endReafreshHeadView];
}

@end
