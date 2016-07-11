//
//  MyViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "MyHeaderTableViewCell.h"
#import "MyTableViewCell.h"
//#import ""

@interface MyViewController()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate>

//如果外面要调用 就写到.h
//如果内部使用 就写到.m
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSArray *titles;
@end


@implementation MyViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.myTableView reloadData];
}

-(void)viewDidLoad{
    [self addRightNavigationItem];
        self.automaticallyAdjustsScrollViewInsets=false;
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identifier];
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identifier];
    
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction:)];
    
    self.titles=@[@"我的活动",@"我的电影",@"清除缓存"];
}



-(void)shareAction:(UIBarButtonItem *)sender{
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    //    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
//    [UMSocialData setAppKey:UMengKey];
    
    //一定要会分享到微博,微信和QQ
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UMengKey
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina]
                                       delegate:self];
    
    
}




- (void)addRightNavigationItem{
    UIButton *btn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    //button与tableView
    [btn setTitle:@"登录" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(rightBarItemClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    //没有frame和添加至页面不显示
    btn.frame=CGRectMake(0, 0, 40, 30);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
- (void)rightBarItemClicked:(UIButton *)btn{
    NSLog(@"1");
    //跳转到登录界面
    UIStoryboard *mainsb=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoginViewController *loginVC=[mainsb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 136;
    }else{
        return 40;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    cell.textLabel.text=@"aaa";
//    return cell;; 
    if (indexPath.row==0) {
        MyHeaderTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identifier];
        cell.avatarImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85/%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"]]]]];
        //        cell.textLabel.text=@"aaa";
        return cell;
    }else{
        MyTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identifier];
        cell.titleLabel.text=self.titles[indexPath.row-1];
        if (indexPath.row==3){
            cell.detailLabel.text=[NSString stringWithFormat:@"%.2fK",[self getFilePath]];
//            @"1.6G";
        }
//        cell.detailLabel.text=@"";
        return cell;
    }
}

-(float)getFilePath{
    
    //文件管理
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
        
    }
    
    //单位MB
    
    return cacheFolderSize/1024;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==3) {
        [self removeCache];
        [tableView reloadData];
    }
}

//作业
-(void)removeCache{
    
}


@end
