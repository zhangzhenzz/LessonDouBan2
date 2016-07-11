//
//  LoginViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (IBAction)ClickLogin:(UIButton *)sender {
    
    [self login];
    
    
    
   
}

-(void)viewDidLoad{
   
}
- (void)login{
    LoginRequest *request=[[LoginRequest alloc] init];
    if ([self.usernameField.text length]==0) {
        NSLog(@"用户名为空");
    }else if([self.passwordField.text length]==0){
        NSLog(@"密码为空");
    }else{
    //判断时用正则表达式
    [request loginRequstWithUsername:self.usernameField.text password:self.passwordField.text success:^(NSDictionary *dic) {
        NSLog(@"success= %@",dic);
        
        //后台返回的是long OC是动态语言 运行的时候才是真正的类型
        //?:怎么弹出底下那个小框
        NSString *code=[[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1103"]) {
            NSString*avatar=[[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString*userId=[[dic objectForKey:@"data"] objectForKey:@"userId"];
            //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] synchronize];//不写的话可能不会立即保存
            [self dismissViewControllerAnimated:YES completion:nil];
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"消息" message:@"登录成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        UIAlertView*alert2=[[UIAlertView alloc]initWithTitle:@"消息" message:@"登录失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
        
        
    } failure:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
    }
}

@end
