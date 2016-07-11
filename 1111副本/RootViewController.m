//
//  RootViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"
@interface RootViewController ()<DouBanTabBarDelegate>
@property(nonatomic,strong)DouBanTabBar*dbTabBar;
@end

@implementation RootViewController
//略有异常 没有出现平时的方法
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tabBar.hidden=YES;
    
    
    UIButton*button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"paper"] forState:UIControlStateNormal];
    //background是个复合视图
    [button1 setImage:[UIImage imageNamed:@"paperH"] forState:UIControlStateSelected];
    [self changeButton:@"活动" a:button1];
    
//    [button1 setTitle:@"zz" forState:(UIControlStateNormal)];
//    [button1 setTitle:@"aaa" forState:(UIControlStateNormal)];
    
    UIButton*button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"videoH"] forState:UIControlStateSelected];
    
    UIButton*button3=[UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:[UIImage imageNamed:@"2image"] forState:UIControlStateNormal];
    [button3 setImage:[UIImage imageNamed:@"2imageH"] forState:UIControlStateSelected];
    
    UIButton*button4=[UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [button4 setImage:[UIImage imageNamed:@"personH"] forState:UIControlStateSelected];
    [self changeButton:@"电影" a:button2];
    [self changeButton:@"影院" a:button3];
    [self changeButton:@"我的" a:button4];
    
    self.dbTabBar=[[DouBanTabBar alloc] initWithItems:@[button1,button2,button3,button4] frame:CGRectMake(0, WindowHeight-49, WindownWidth, 49)];
//    self.dbTabBar.frame=CGRectMake(0, 300, 414, 49);
    [self.view addSubview:self.dbTabBar];
    self.dbTabBar.douBanDelegate=self;
}
-(void)douBanItemDidClicked:(DouBanTabBar *)tabBar{
    self.selectedIndex=tabBar.currentSelected;
}

-(void)changeButton:(NSString *)string
                  a:(UIButton *)button{
    [button setTitle:string forState:(UIControlStateNormal)];
    button.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 15, 0);
    button.titleEdgeInsets=UIEdgeInsetsMake(0, -60, -30, 0);
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    button.titleLabel.font=[UIFont systemFontOfSize:13];
}

@end
