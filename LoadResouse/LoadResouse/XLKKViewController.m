//
//  XLKKViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/27.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "XLKKViewController.h"

#import "XLModel.h"
#import "XLLoadDataController.h"
#import "XLTableViewCell.h"

#import "AVPlayerVideoViewController.h"
#import "XLVideoModel.h"
@interface XLKKViewController ()<LoadDataControllerDelegate>
@property (nonatomic,strong)XLLoadDataController *xlData;
@end

@implementation XLKKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadDataXunLeiResouse];
    
    [self creatTableView];
    [self creatRegetCell];
}

- (void)creatRegetCell{

    [self.tableView registerNib:[UINib nibWithNibName:@"XLTableViewCell" bundle:nil] forCellReuseIdentifier:@"XLTableViewCell"];
    
}

- (void)loadDataXunLeiResouse{


    self.xlData=[[XLLoadDataController alloc] initWithDelegate:self];
    
    self.xlData.xlrequestUrl=@"http://m.sjzhushou.com/cgi-bin/msgList?device=iPhone8&C1&ios_ver=9.2&maxCount=10&partnerId=0x20800003&peerID=6b215cd2f2d1003V&peer_id=6b215cd2f2d1003V&productID=31&product_id=31&timestamp=1372886413&ver=5.12.1.2645&versionCode=51201";
    
    [self.xlData requestWithArgs:nil];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 113;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

  return self.xlData.xlDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    XLTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"XLTableViewCell" forIndexPath:indexPath];
    XLTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"XLTableViewCell" forIndexPath:indexPath];
    
    XLModel *model=self.xlData.xlDataArr[indexPath.row];
    
    [cell showDataWithModel:model];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    XLModel *model=self.xlData.xlDataArr[indexPath.row];
    
    NSArray *Arr=[model.detailUrl componentsSeparatedByString:@"&"];
    
    NSString *isVideo=[Arr[0] componentsSeparatedByString:@"="].lastObject;
    
    self.xlData.xlrequestUrl=[NSString stringWithFormat:@"http://interface.m.sjzhushou.com/hotresource/info?peerid=6b215cd2f2d1003V&movieid=%@&_=1473949569041",isVideo];
    
    [self.xlData requestWithArgs:nil];
    


}


- (void)loadDataFinishWithResouse:(LoadDataController *)controller{

   
    
    
    if (self.xlData.videoArr) {
        
        AVPlayerVideoViewController * av=[[AVPlayerVideoViewController alloc] init];
        
        XLVideoModel *model=self.xlData.videoArr.lastObject;
        
        av.videoUrlStr=model.url;
        
        av.videoModel=model;
        [self.navigationController pushViewController:av animated:YES];
        
        
        return;
    }
    
    
     [self.tableView reloadData];
    
}
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{


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
