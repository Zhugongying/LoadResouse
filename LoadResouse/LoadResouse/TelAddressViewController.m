//
//  TelAddressViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/10/10.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "TelAddressViewController.h"

@interface TelAddressViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textfield;
@property (nonatomic,strong)RTLabel *rtLable;
@end

@implementation TelAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor floralWhite];
    [self creatTextField];
    
    [self creatRtLable];
    
    
    
}

- (void)creatTextField{

    self.textfield=[[UITextField alloc] initWithFrame:CGRectMake(0, 64, kScreenSizeW, 40)];
    
    self.textfield.delegate=self;
    self.textfield.backgroundColor=[UIColor beigeColor];
    self.textfield.placeholder=@"请输入手机号码！";
    self.textfield.keyboardType=UIKeyboardTypeNumberPad;
    self.textfield.borderStyle=UITextBorderStyleRoundedRect;
    self.textfield.keyboardAppearance=UIKeyboardAppearanceDark;
    self.textfield.returnKeyType=UIReturnKeySearch;
    
    [self.view addSubview:self.textfield];


}

- (void)creatRtLable{

    self.rtLable=[[RTLabel alloc] initWithFrame:CGRectMake(0, 120, kScreenSizeW, 160)];
    [self.view addSubview:self.rtLable];
    


}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (range.location >10) {
        
        return NO;
    }
    
    if (range.length==1 ) {
        
        self.rtLable.text=@"";
        return YES;
        
    }
    

    NSString *httpUrl = @"http://apis.baidu.com/apistore/mobilenumber/mobilenumber";
    NSString *httpArg = [NSString stringWithFormat:@"phone=%@%@",textField.text,string];
  
    [self request: httpUrl withHttpArg: httpArg];



    return YES;
}


-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"9b269aa2c4bfd26d1f981d357d5e4be2" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                               } else {
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HttpResponseCode:%ld", responseCode);
                                   NSLog(@"HttpResponseBody %@",responseString);
                                   
                                   
                                   
                                   NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                   
                                   NSString *str=dict[@"retMsg"];
                                   
                                   if ([str isEqualToString:@"success"]) {
                                       
                                       self.rtLable.text=[NSString stringWithFormat:@"手机号码：%@\n手机号码前七位：%@\n型号：%@-%@-%@-%@",
                                                          dict[@"retData"][@"phone"],
                                                          dict[@"retData"][@"prefix"],
                                                          dict[@"retData"][@"supplier"],
                                                          dict[@"retData"][@"province"],
                                                          dict[@"retData"][@"city"],
                                                          dict[@"retData"][@"suit"]];
                                       
                                       
                                       
                                   }
                                   
                                   
                               }
                           }];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    [self.view endEditing:YES];
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
