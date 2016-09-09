//
//  BaiSiBDJCell.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/7.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaiSiBDJCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
- (IBAction)zanBtnClick:(id)sender;
- (IBAction)caiBtnClick:(id)sender;
- (IBAction)shareBtnClick:(id)sender;
- (IBAction)pLBtnClick:(id)sender;

@end
