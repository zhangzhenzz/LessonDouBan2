//
//  TheatreViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "TheatreViewController.h"
#import "TheaterTableViewCell.h"
#import "TheaterRequest.h"
#import "MovieRequest.h"
#import "TheatreMapViewController.h"
@interface TheatreViewController()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray*dataArray;
@end

@implementation TheatreViewController

-(void)viewDidLoad{
    [self.tableView registerNib:[UINib nibWithNibName:@"TheaterTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TheatreTableViewCell_Identifier];
    
    __weak typeof(self) weakself=self;
    TheaterRequest*request=[[TheaterRequest alloc] init];
    [request theaterRequestWithParameters:nil success:^(NSDictionary *dic) {
        
        NSLog(@"success");
        
        weakself.dataArray=dic[@"result"][@"data"];
        NSLog(@"==========%ld",weakself.dataArray.count);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error=%@",error);
        
//        NSLog(@"error");
        
    }];
    
//    MovieRequest*request=[MovieRequest new];
//    [request movieRequestWithParameters:nil success:^(NSDictionary *dic) {
//        NSLog(@"success");
//    } failure:^(NSError *error) {
//        NSLog(@"error");
//    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TheaterTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:TheatreTableViewCell_Identifier];
    TheaterModel*model=[[TheaterModel alloc]init];
    [model setValuesForKeysWithDictionary:self.dataArray[indexPath.row]];
    cell.model=model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TheatreMapViewController*mapVC=[TheatreMapViewController new];
    TheaterModel*model=[[TheaterModel alloc]init];
    [model setValuesForKeysWithDictionary:self.dataArray[indexPath.row]];
    mapVC.cityString=model.cityName;
    mapVC.addressString=model.address;
    [self.navigationController pushViewController:mapVC animated:YES];
}


@end
