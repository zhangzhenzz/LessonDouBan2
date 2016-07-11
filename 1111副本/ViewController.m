//
//  ViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ViewController.h"
#import "ActivityRequest.h"
#import "MovieRequest.h"
#import "ActivityModel.h"
#import "MovieModel.h"
#import "TheaterModel.h"
#import "TheaterRequest.h"
#import "ActivityDetailRequest.h"
#import "MovieDetailRequest.h"
#import "EntriesModel.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *activities;
@property (nonatomic, strong) NSMutableArray *movies;
@end


//第一天 领机器 没事
//2 给服务器地址 用户名 "你去把代码弄下来吧" 就一句话
//代码克隆(切出)到本地
//新机器 Xcode
//上午让你看看 下午就让你改bug了...
//UIBUG
//数据层不要动 这是底层



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movies=[NSMutableArray array];
    
    // Github 开源的优秀网站
    // NSData 传二进制数据
    // 有demo
    // 试
//    [self requestActivityData];//永远不要写重复代码
    [self requestMovieData];
//    [self requestTheatreData];
//    [self requestActivityDetailDataWith:@"26865955"];
//    [self requestMovieDetailDataWith:@"10604893"];
    

}
-(void)requestMovieDetailDataWith:(NSString *)ID{
    MovieDetailRequest*request=[[MovieDetailRequest alloc]init];

    [request movieDetailWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"success=%@",dic);
    } failure:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}

-(void)requestActivityDetailDataWith:(NSString *)ID{
    ActivityDetailRequest*request=[[ActivityDetailRequest alloc] init];
    [request activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"success %@",dic);
    } failure:^(NSError *error) {
        NSLog(@"failure %@",error);
    }];
}

-(void)requestTheatreData{
    TheaterRequest*theatre=[[TheaterRequest alloc] init];
    [theatre theaterRequestWithParameters:nil success:^(NSDictionary *dic) {
        NSLog(@"success=%@",dic);
    } failure:^(NSError *error) {
        NSLog(@"failure=%@",error);
    }];
}


-(void)requestMovieData{
    MovieRequest*movie=[[MovieRequest alloc] init];
    [movie movieRequestWithParameters:nil success:^(NSDictionary *dic) {
//        NSLog(@"success=%@",dic);
        NSArray *tempMovies=[dic objectForKey:@"entries"];
        __weak typeof(self) weakSelf = self;
        for (NSDictionary*tempDic in tempMovies) {
            EntriesModel*model=[[EntriesModel alloc]init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.movies addObject:model];
        }
        NSLog(@"%@",self.movies);
    } failure:^(NSError *error) {
        NSLog(@"failure=%@",error);
    }];

}
     
-(void)requestActivityData{
    self.activities=[NSMutableArray array];
    //url也可以搞成https
    ActivityRequest*activity=[[ActivityRequest alloc] init];
    [activity activityRequestWithParameter:nil success:^(NSDictionary *dic) {
        __weak typeof(self) weakSelf = self;
//        NSLog(@"success=%@",dic);
        NSArray *events=[dic objectForKey:@"events"];
        for (NSDictionary *tempDic in events) {
            ActivityModel *model=[[ActivityModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            //这是在block里面 所以尽量不要用self
            [weakSelf.activities addObject:model];
        }
        NSLog(@"activities=%@",weakSelf.activities);
    } failure:^(NSError *error) {
        NSLog(@"failure=%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
