//
//  BSBDJTableViewCell.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/19.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "BSBDJTableViewCell.h"

#import <UIImage+MultiFormat.h>

@interface BSBDJTableViewCell ()
@property (nonatomic,strong)VideoModel *videoModel;
@property (nonatomic,strong)BaiSiBDJModel *model;
@end

@implementation BSBDJTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    static NSString *identifier=@"BaiSiBuDeJie";
    BSBDJTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[BSBDJTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    return cell;
    

}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self showUI];
    }
    return self;

}
- (void)showUI{

    
    self.contentView.backgroundColor=UIColorRGBA(0xf7f1f7, 1);
    
    //只是加载控件  因为还没有数据 无法判断数据的位置
    self.titleLable=[[UILabel alloc] init];
    self.titleLable.numberOfLines=0;
    [self.titleLable setTextAlignment:NSTextAlignmentLeft];
    self.titleLable.font=[UIFont systemFontOfSize:15];
    self.titleLable.backgroundColor=UIColorRGBA(0xf1f1f1, 1);
    [self.contentView addSubview:self.titleLable];


    
    self.headImageView=[[UIImageView alloc] init];
    [self.contentView addSubview:self.headImageView];
    
    self.videoImage=[[UIImageView alloc] init];
    self.videoImage.image=[UIImage imageNamed:@"video"];
    self.videoImage.hidden=YES;
    [self.contentView addSubview:self.videoImage];
    
    
    self.zanBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.zanBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.zanBtn.backgroundColor=UIColorRGBA(0xf1f1f1, 1);
    self.zanBtn.tag=10001;
    [self.zanBtn addTarget:self action:@selector(chouseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.zanBtn setTintColor:[UIColor blackColor]];
    
    self.caiBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.caiBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.caiBtn.backgroundColor=UIColorRGBA(0xf1f1f1, 1);
    self.caiBtn.tag=10002;
    [self.caiBtn addTarget:self action:@selector(chouseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.caiBtn setTintColor:[UIColor blackColor]];
    
    self.shearBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.shearBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.shearBtn.backgroundColor=UIColorRGBA(0xf1f1f1, 1);
    self.shearBtn.tag=10003;
    [self.shearBtn addTarget:self action:@selector(chouseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.shearBtn setTintColor:[UIColor blackColor]];
    
    self.plBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.plBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.plBtn.backgroundColor=UIColorRGBA(0xf1f1f1, 1);
    self.plBtn.tag=10004;
    [self.plBtn addTarget:self action:@selector(chouseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.plBtn setTintColor:[UIColor blackColor]];
    
    [self.contentView addSubview:self.zanBtn];
    [self.contentView addSubview:self.caiBtn];
    [self.contentView addSubview:self.shearBtn];
    [self.contentView addSubview:self.plBtn];
    
}
- (void)showDataWithModel:(BaiSiBDJModel *)model{
    
    self.videoModel=model.videoModelArr.firstObject;
    
    self.model=model;
    
    
    CGRect rect;
    
    rect=self.titleLable.frame;
    rect.size.height=[self titleHeight:model.text];
    rect.size.width=kScreenSizeW-20;
    rect.origin.x=10;
    rect.origin.y=5;
    self.titleLable.frame=rect;
    self.titleLable.text=model.text;
    
    dispatch_queue_t queue =dispatch_queue_create(0, 0);
    
    
    rect=self.headImageView.frame;
    if (![self.model.type isEqualToString:@"text"]) {
        
        if ([self.model.type isEqualToString:@"video"]) {
            dispatch_async(queue, ^{
                
                self.videoImage.hidden=NO;
                [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.videoModel.thumbnail.firstObject] placeholderImage:nil ];
//            [self.headImageView yy_setImageWithURL:[NSURL URLWithString:self.videoModel.thumbnail.firstObject] options:YYWebImageOptionProgressive];
            });
        }else if ([self.model.type isEqualToString:@"image"]){
            dispatch_async(queue, ^{
                self.videoImage.hidden=YES;
                [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.videoModel.download_url.firstObject] placeholderImage:nil ];
                
            });
        }else if ([self.model.type isEqualToString:@"gif"]){
        
            dispatch_async(queue, ^{
                self.videoImage.hidden=YES;;
                [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.videoModel.images.firstObject] placeholderImage:nil ];
                
//              // 渐进式加载，增加模糊效果和渐变动画 （见本页最上方的GIF演示）  
//                [self.headImageView yy_setImageWithURL:[NSURL URLWithString:self.videoModel.images.firstObject] options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];
                
                
            });
        
        }
        
        
    
        rect.size.height= (kScreenSizeW-16)*self.videoModel.height.integerValue/self.videoModel.width.integerValue;
        rect.origin.y=self.titleLable.frame.origin.y+self.titleLable.frame.size.height + 15;
        rect.origin.x=8;
        
    
    }else{

        rect.size.height=1.f;
        rect.origin.x=8;
    }
    rect.size.width=kScreenSizeW-16;
    self.headImageView.frame = rect;
    
    rect =self.videoImage.frame;
    
    rect.origin.x=(kScreenSizeW-60)/2;
    rect.origin.y=self.headImageView.frame.origin.y+(self.headImageView.frame.size.height-60)/2;
    rect.size.width=60;
    rect.size.height=60;
    self.videoImage.frame=rect;
    

    
    CGFloat btnW=(kScreenSizeW-50)/4;
    
    rect=self.zanBtn.frame;
    rect.origin.y=self.headImageView.frame.origin.y+self.headImageView.frame.size.height +10;
    rect.origin.x=10;
    rect.size.width=btnW;
    rect.size.height=40;
    self.zanBtn.frame=rect;

    
    rect=self.caiBtn.frame;
    rect.origin.y=self.zanBtn.frame.origin.y;
    rect.origin.x=20+btnW;
    rect.size.width=btnW;
    rect.size.height=40;
    
    self.caiBtn.frame=rect;
    
    rect =self.shearBtn.frame;
    rect.origin.y=self.zanBtn.frame.origin.y;
    rect.origin.x=30+btnW*2;
    rect.size.width=btnW;
    rect.size.height=40;
    self.shearBtn.frame=rect;
    
    rect=self.plBtn.frame;
    rect.origin.y=self.zanBtn.frame.origin.y;
    rect.origin.x=40+btnW*3;
    rect.size.width=btnW;
    rect.size.height=40;
    self.plBtn.frame=rect;
    
    
    [self.zanBtn setTitle:[NSString stringWithFormat:@"赞(%@)",model.up ] forState:UIControlStateNormal];
    [self.caiBtn setTitle:[NSString stringWithFormat:@"踩(%@)",model.down] forState:UIControlStateNormal];
    [self.shearBtn setTitle:[NSString stringWithFormat:@"分享(%@)",model.forward] forState:UIControlStateNormal];
    [self.plBtn setTitle:[NSString stringWithFormat:@"评论(%@)",model.comment] forState:UIControlStateNormal];
}
- (void)chouseBtnClick:(UIButton *)btn{

    switch (btn.tag-10000) {
        case 1://赞
        {
        
        }
            break;
        case 2://踩
        {
            
        }
            break;
        case 3://分享
        {
            
            if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(showBaiSiBDJModel: witchVideoModel:)]) {
                
                [self.shearDelegate showBaiSiBDJModel:self.model witchVideoModel:self.videoModel];
                
            }
            
        }
            break;
        case 4://评论
        {
            if (self.shearDelegate && [self.shearDelegate respondsToSelector:@selector(showBaiSiBDJPLContenc:)]) {
                [self.shearDelegate showBaiSiBDJPLContenc:self.model];
            }
            
            
        }
            break;
            
        default:
            break;
    }



}
- (CGFloat)titleHeight:(NSString *)conten{
    
//    CGSize size = CGSizeMake(kScreenSizeW-30,CGFLOAT_MAX);//LableWight标签宽度，固定的
//    CGSize labelsize = [conten sizeWithFont:[UIFont systemFontOfSize:16.f] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    

   
    
    return [self contentSizeWith:conten].height;
    
}
- (CGSize)contentSizeWith:(NSString *)content {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:content];
    
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    
    style.lineSpacing=10;
    UIFont *font=[UIFont systemFontOfSize:16];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, content.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, content.length)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW-16, 1)];
    label.font=font;
    label.numberOfLines=0;
    label.attributedText=attributeString;
    CGSize size=[label sizeThatFits:CGSizeMake(kScreenSizeW-16, CGFLOAT_MAX)];
    
    
   
    return size;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
