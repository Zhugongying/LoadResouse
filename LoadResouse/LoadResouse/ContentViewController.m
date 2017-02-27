//
//  ContentViewController.m
//  LoadResouse
//
//  Created by zhugy on 2017/2/10.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

#import "ContentViewController.h"
#import <WebKit/WebKit.h>

@interface ContentViewController ()
@property (nonatomic, strong) RTLabel *rtLabel;
@property (nonatomic, strong) UIWebView * webView;
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH)];
    [self.webView loadHTMLString:@"# 给iOS开发者的Sketch入门教程\n\n![](http://cdn3.raywenderlich.com/wp-content/uploads/2015/10/delete.png)\n\n&gt;注意：这是一篇译文，如果你够装逼，完全可以浏览原文：[Sketch Tutorial for iOS Developers](http://www.raywenderlich.com/117609/sketch-indie-developers)\n&gt;如需转载，请注明出处。谢谢！！！\n&gt;转载地址：[http://www.rockerhx.com/2016/02/02/2016-02-02-Sketch-Tutorial-for-iOS-Developers/](http://www.rockerhx.com/2016/02/02/2016-02-02-Sketch-Tutorial-for-iOS-Developers/)\n\n作为一名iOS开发者，我经历过几个没有设计师的项目，结果就是，痛苦的一逼。\n做这种类型的项目，设计是非常重要的，特别是迭代设计。\n在每个项目最开始的时候，客户其实并不知道自己想要什么。直接堆码之前我们还是有点小小的设计知识更有助于你跟客户撕逼的时候占上风，其实我们只是想更完美，难道不是吗？\n\n---\n这里我更推荐的做法是，迭代原型，而不是先堆码，这才是一个合格码农该做的。\n但是怎样才能在没有设计师的前提下设计原型，那就必须用到[`Sketch`](http://www.sketchapp.com/)这货。\n[`Sketch`](http://www.sketchapp.com/)是创作`Logo`和`Icon`feel倍儿爽的工具。它是基于矢量图形的，这意味着你在调整图形大小的时候可以不用担心丢失画质。它包含`iPhone设备尺寸`的画板和一个内置的`UIKit模板`，你也可以用`Sketch`来创建迭代设计原型。另外，`Sketch`还是一个让程序汪能快速上手的工具。\n\n&gt;在本教程中，你可以学到：\n&gt;+ 使用UIKit模板创建一个模型。\n&gt;+ 使用矢量工具创建Icon。\n&gt;+ 通过组合基本形状制作Icon。\n&gt;+ 为Xcode导出图片素材资源。\n&gt;而最重要的，你能以开发者的身份来学习这份教程。准备好就可以升级了您的设计技能！Let's do it！\n" baseURL:nil];
    [self.view addSubview:self.webView];
    
    
    
//    self.rtLabel = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeW, kScreenSizeH)];
//    [self.view addSubview:self.rtLabel ];
//    self.rtLabel.text = @"# 给iOS开发者的Sketch入门教程\n\n![](http://cdn3.raywenderlich.com/wp-content/uploads/2015/10/delete.png)\n\n&gt;注意：这是一篇译文，如果你够装逼，完全可以浏览原文：[Sketch Tutorial for iOS Developers](http://www.raywenderlich.com/117609/sketch-indie-developers)\n&gt;如需转载，请注明出处。谢谢！！！\n&gt;转载地址：[http://www.rockerhx.com/2016/02/02/2016-02-02-Sketch-Tutorial-for-iOS-Developers/](http://www.rockerhx.com/2016/02/02/2016-02-02-Sketch-Tutorial-for-iOS-Developers/)\n\n作为一名iOS开发者，我经历过几个没有设计师的项目，结果就是，痛苦的一逼。\n做这种类型的项目，设计是非常重要的，特别是迭代设计。\n在每个项目最开始的时候，客户其实并不知道自己想要什么。直接堆码之前我们还是有点小小的设计知识更有助于你跟客户撕逼的时候占上风，其实我们只是想更完美，难道不是吗？\n\n---\n这里我更推荐的做法是，迭代原型，而不是先堆码，这才是一个合格码农该做的。\n但是怎样才能在没有设计师的前提下设计原型，那就必须用到[`Sketch`](http://www.sketchapp.com/)这货。\n[`Sketch`](http://www.sketchapp.com/)是创作`Logo`和`Icon`feel倍儿爽的工具。它是基于矢量图形的，这意味着你在调整图形大小的时候可以不用担心丢失画质。它包含`iPhone设备尺寸`的画板和一个内置的`UIKit模板`，你也可以用`Sketch`来创建迭代设计原型。另外，`Sketch`还是一个让程序汪能快速上手的工具。\n\n&gt;在本教程中，你可以学到：\n&gt;+ 使用UIKit模板创建一个模型。\n&gt;+ 使用矢量工具创建Icon。\n&gt;+ 通过组合基本形状制作Icon。\n&gt;+ 为Xcode导出图片素材资源。\n&gt;而最重要的，你能以开发者的身份来学习这份教程。准备好就可以升级了您的设计技能！Let's do it！\n";
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
