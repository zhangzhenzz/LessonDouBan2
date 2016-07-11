//
//  RegisterViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"
@interface RegisterViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property(nonatomic,strong)UIImage*selectedImage;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.userInteractionEnabled=YES;
    self.imageView.image=[UIImage imageNamed:@"2image"];
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectPhoto)];
    [self.imageView addGestureRecognizer:tap];

}

-(void)selectPhoto{
//    UIAlertController*alertC=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:0];
    UIImagePickerController*imagePickController=[[UIImagePickerController alloc] init];
    imagePickController.delegate=self;
    imagePickController.allowsEditing=YES;
    imagePickController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickController animated:YES completion:^{
        
    }];
    
//    UIAlertAction*OKAction=[UIAlertAction action
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage*temp=[info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image=temp;
    self.selectedImage=temp;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)registerAction:(UIButton *)sender {
    RegisterRequest*request=[[RegisterRequest alloc]init];
    [request registerRequstWithUsername:self.usernameField.text password:self.passwordField.text avator:self.selectedImage success:^(NSDictionary *dic) {
        NSLog(@"success=%@",dic);
        
        
        NSString*code=[[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1005"]) {
            NSString*avatar=[[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString*userId=[[dic objectForKey:@"data"] objectForKey:@"userId"];
        //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] synchronize];//不写的话可能不会立即保存
            //界面消失
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        
        
    } failure:^(NSError *error) {
        NSLog(@"failure=%@",error);
    }];
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
