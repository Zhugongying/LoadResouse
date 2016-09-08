//
//  XTGNViewController.m
//  LoadResouse
//
//  Created by 朱共营 on 16/9/6.
//  Copyright © 2016年 Zhugy. All rights reserved.
//

#import "XTGNViewController.h"

#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>


typedef NS_ENUM(NSUInteger , SystemItemForIpnone) {

    SystemItemForIpnoneTEL=0,
    
    SystemItemForIpnoneMail,
    
    SystemItemForIpnoneSMS,
    
    SystemItemForIpnonePhoto,
    
    SystemItemForIpnoneCamera,
    
    SystemItemForIpnoneAddressBook,

};

@interface XTGNViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,ABPeoplePickerNavigationControllerDelegate>

@property (nonatomic) SystemItemForIpnone type;

@end

@implementation XTGNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
    [self loadDataResouse:@[@"电话",@"邮件",@"短信",@"照片",@"照相机",@"通讯录"]];
    self.tableView.backgroundColor=[UIColor whiteColor];
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.type=indexPath.row;
    
    
    switch (self.type) {
        case SystemItemForIpnoneTEL:
        {
            
            NSString *phoneNumber=@"13253009266";
            //    NSString *url=[NSString stringWithFormat:@"tel://%@",phoneNumber];//这种方式会直接拨打电话
            NSString *url=[NSString stringWithFormat:@"telprompt://%@",phoneNumber];//这种方式会提示用户确认是否拨打电话
            [self openUrl:url];
        }
            break;
        case SystemItemForIpnoneMail:
        {
            NSString *mailAddress=@"zhugy781@163.com";
            NSString *url=[NSString stringWithFormat:@"mailto://%@",mailAddress];
            [self openUrl:url];
        }
            break;
        case SystemItemForIpnoneSMS:
        {
            NSString *phoneNumber=@"13253009266";
            NSString *url=[NSString stringWithFormat:@"sms://%@",phoneNumber];
            [self openUrl:url];
        }
            break;
        case SystemItemForIpnonePhoto:
        {
            [self openPhoto];
        }
            break;
        case SystemItemForIpnoneCamera:
        {
            [self openCamera];
        }
            break;
        case SystemItemForIpnoneAddressBook:
        {
        
            [self openAddressBook];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
#pragma mark - 打开通讯录

- (void)openAddressBook{

    ABPeoplePickerNavigationController *nav=[[ABPeoplePickerNavigationController alloc] init];
    nav.peoplePickerDelegate=self;
    if (IS_AT_LEAST_IOS8) {
        nav.predicateForSelectionOfPerson=[NSPredicate predicateWithValue:false];
    }
    [self presentViewController:nav animated:YES completion:nil];
    


}
// Called after a person has been selected by the user.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person NS_AVAILABLE_IOS(8_0){

}

// Called after a property has been selected by the user.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier NS_AVAILABLE_IOS(8_0){


}

// Called after the user has pressed cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{

    [peoplePicker dismissViewControllerAnimated:YES completion:nil];

}


// Deprecated, use predicateForSelectionOfPerson and/or -peoplePickerNavigationController:didSelectPerson: instead.
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person NS_DEPRECATED_IOS(2_0, 8_0){

    return YES;
}

// Deprecated, use predicateForSelectionOfProperty and/or -peoplePickerNavigationController:didSelectPerson:property:identifier: instead.
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier NS_DEPRECATED_IOS(2_0, 8_0){
    return YES;
}

#pragma mark - 打开相册
- (void)openPhoto{
    UIImagePickerController *pickrImage=[[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        pickrImage.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        pickrImage.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:pickrImage.sourceType];
    }
    pickrImage.delegate=self;
    pickrImage.allowsEditing=NO;
    [self presentViewController:pickrImage animated:YES completion:nil];

}

#pragma mark - 打开照相机
- (void)openCamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    UIImage  *getimage;
//    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString*)kUTTypeImage]) {
//        getimage = [info objectForKey:UIImagePickerControllerEditedImage];
//        getimage = [getimage zoomOutImageInMaxWidth:100 MaxHeight:100];
//    }
//    [self dismissViewControllerAnimated:YES completion:nil];
//    self.cameraPhoto = getimage;
//    [self reloadTableViewWithRow:0];
//    
//    if (!self.modifyIconDataController) {
//        self.modifyIconDataController = [[PPModifyIconDataController alloc] initWithDelegate:self];
//    }
//    [self.modifyIconDataController requestWithImage:getimage];
//    self.modifyIconDataController.disableFailTips = YES;
//    
//    
//    
//    //本地记录选择更换的图片
//    NSData * imageData = [NSKeyedArchiver archivedDataWithRootObject:getimage];
//    NSUserDefaults * plist = [NSUserDefaults standardUserDefaults];
//    [plist setObject:imageData forKey:@"resetNewHeaderImage"];
//    [plist setObject:@"NO" forKey:@"passHeadImageOK"];
//    
//    [plist synchronize];
//    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    ModifyPersonCell * cell = [self.mainTableView cellForRowAtIndexPath:indexPath];
//    cell.checkHeader.hidden = NO;
//    cell.headerImage.image=getimage;
//    
//    
//    //zhu 通知我的首页覆盖已经上传的图片
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkCenterUserCenterChangeHeadImage object:nil];
//    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)openUrl:(NSString *)urlStr{
    
    NSURL *url=[NSURL URLWithString:urlStr];
    UIApplication *application=[UIApplication sharedApplication];
    if(![application canOpenURL:url]){
        NSLog(@"无法打开\"%@\"，请确保此应用已经正确安装.",url);
        return;
    }
    
    [[UIApplication sharedApplication] openURL:url];
    
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
