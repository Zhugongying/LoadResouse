//
//  AQYViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/22.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "AQYViewController.h"

#import "AQYLoadDataControl.h"

@interface AQYViewController ()<LoadDataControllerDelegate>
@property (nonatomic,strong)AQYLoadDataControl *aqyLoad;
@end

@implementation AQYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}


- (void)loadData{

    self.aqyLoad=[[AQYLoadDataControl alloc] initWithDelegate:self];
    
    [self.aqyLoad requestWithArgs:nil];
    
    

}
- (void)loadData:(LoadDataController *)controller failedWithEroor:(NSError *)error{

}
- (void)loadDataFinishWithResouse:(LoadDataController *)controller{


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