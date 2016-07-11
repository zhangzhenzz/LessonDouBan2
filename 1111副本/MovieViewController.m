//
//  MovieViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieRequest.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"
#import "EntriesModel.h"
#import "MovieDetailViewController.h"

@interface MovieViewController() <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray*dataArray;
@end

@implementation MovieViewController
-(void)viewDidLoad{
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MovieCell_Identifier];
    
    MovieRequest*request=[[MovieRequest alloc] init];
    [request movieRequestWithParameters:nil success:^(NSDictionary *dic) {
        self.dataArray=dic[@"entries"];
//        NSLog(@"%@",self.dataArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:MovieCell_Identifier];
    EntriesModel*model=[EntriesModel new];
    [model setValuesForKeysWithDictionary:self.dataArray[indexPath.row]];
    cell.titleLabel.text=model.title;
    cell.starsLabel.text=[NSString stringWithFormat:@"%ld",model.stars];
    cell.pubdateLabel.text=[NSString stringWithFormat:@"上映时间:%@",model.pubdate];
    cell.imageV.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.images[@"medium"]]]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EntriesModel*model=[EntriesModel new];
    [model setValuesForKeysWithDictionary:self.dataArray[indexPath.row]];
    [self performSegueWithIdentifier:@"movieDetail" sender:model];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"movieDetail"]) {
        MovieDetailViewController*movieDVC=segue.destinationViewController;
        movieDVC.model=sender;
    }
}


@end
