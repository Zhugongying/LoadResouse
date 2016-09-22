//
//  ShearView.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/21.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "ShearView.h"

@implementation ShearView



- (instancetype)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if (self) {
        
        [self creatBtnFrame];
        
    }
    return self;
}

- (void)creatBtnFrame{

    
    

//    self.shearView=[[UIView alloc] initWithFrame:CGRectMake(0, kScreenSizeH-200, kScreenSizeW, 200)];
//    [self addSubview:self.shearView];
    
    self.wxBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.wxBtn setBackgroundImage:[UIImage imageNamed:@"微信"] forState:UIControlStateNormal];
    self.wxBtn.tag=1111;
    [self.wxBtn addTarget:self action:@selector(clickShearBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.wxBtn.frame=CGRectMake(10, (self.frame.size.height-25)/2, 50, 50);
    [self addSubview:self.wxBtn];
    
    self.wxPYQBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.wxPYQBtn setBackgroundImage:[UIImage imageNamed:@"朋友圈"] forState:UIControlStateNormal];
    self.wxPYQBtn.tag=1112;
    [self.wxPYQBtn addTarget:self action:@selector(clickShearBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.wxPYQBtn.frame=CGRectMake((kScreenSizeW-50)/2, (self.frame.size.height-25)/2, 50, 50);
    [self addSubview:self.wxPYQBtn];
    
    self.qqBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.qqBtn setBackgroundImage:[UIImage imageNamed:@"我的圈子（合并）"] forState:UIControlStateNormal];
    self.qqBtn.tag=1113;
    [self.qqBtn addTarget:self action:@selector(clickShearBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.qqBtn.frame=CGRectMake(kScreenSizeW-60, (self.frame.size.height-25)/2, 50, 50);
    [self addSubview:self.qqBtn];
    
    
    self.cancelBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelBtn.frame=CGRectMake(kScreenSizeW-50, 10, 40, 25);
    self.cancelBtn.tag=1114;
    [self.cancelBtn addTarget:self action:@selector(clickShearBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelBtn];
    
//
//    self.wxBtn=[UIButton buttonWithType:UIButtonTypeSystem];
//    [self.wxBtn setBackgroundImage:[UIImage imageNamed:@"维信"] forState:UIControlStateNormal];
//    self.wxBtn.tag=1111;
//    [self.wxBtn addTarget:self action:@selector(clickShearBtn:) forControlEvents:UIControlEventTouchUpInside];
//    self.wxBtn.frame=CGRectMake(10, (self.shearView.frame.size.height-25)/2, 50, 50);
//    [self.shearView addSubview:self.wxBtn];
    
    self.backgroundColor=UIColorRGBA(0xcae5ff, 1);
    

}
- (void)clickShearBtn:(UIButton *)btn{

    
    switch (btn.tag-1110) {
        case 1:
        {
            if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(wxBtnShearClickType:)]) {
                
                [self.shearDelegate wxBtnShearClickType:@"WXSceneSession"];
//                self.shearType=WXSceneSessiont;
            }
        }
            break;
        case 2:
        {
            if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(wxBtnShearClickType:)]) {
                
                [self.shearDelegate wxBtnShearClickType:@"WXSceneTimeline"];
//                self.shearType=WXSceneTimelinet;
            }
            
        }
            break;
        case 3:
        {
            if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(wxBtnShearClickType:)]) {
                
                [self.shearDelegate wxBtnShearClickType:@"WechatAuth"];
//                 self.shearType=WechatAuth;
            }
            
        }
            break;
        case 4:
        {
            if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(wxBtnShearClickType:)]) {
                
                [self.shearDelegate wxBtnShearClickType:@"CancelShearView"];
//                 self.shearType=CancelShearView;
            }
            
        }
            break;
            
        default:
            break;
    }
    


}

//- (void)setQqBtn:(UIButton *)qqBtn{
//
//    self.qqBtn=qqBtn;
//}
//- (void)setWxBtn:(UIButton *)wxBtn{
//    self.wxBtn=wxBtn;
//}
//- (void)setWxPYQBtn:(UIButton *)wxPYQBtn{
//    self.wxPYQBtn=wxPYQBtn;
//}
//- (void)setShearView:(UIView *)shearView{
//
//    self.shearView=shearView;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
