//
//  ShearView.h
//  LoadResouse
//
//  Created by 朱共营 on 16/9/21.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol ShaarViewBtnClickDelegate <NSObject>

- (void)wxBtnShearClickType:(NSString *)type;

@end


@interface ShearView : UIView

@property (nonatomic, strong)UIButton *wxBtn;
@property (nonatomic, strong)UIButton *wxPYQBtn;
@property (nonatomic, strong)UIButton *qqBtn;
@property (nonatomic, strong)UIButton *cancelBtn;

@property (nonatomic,weak)id<ShaarViewBtnClickDelegate>shearDelegate;


//@property (nonatomic, strong)UIView *shearView;

- (instancetype)initWithFrame:(CGRect)frame;

@end
