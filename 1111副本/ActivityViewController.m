//
//  ActivityViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityRequest.h"
#import "ActivityDetailViewController.h"
#import "ActivityModel.h"
@interface ActivityViewController()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray*dataArray;
@end

@implementation ActivityViewController

-(void)viewDidLoad{
    [self.tableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identifier];
    
    ActivityRequest*request=[[ActivityRequest alloc]init];
    __weak typeof(self) weakSelf = self;
    [request activityRequestWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"activity=%@",dic);
        weakSelf.dataArray=dic[@"events"];//如果是一个一个加 记得用初始
        //异步回调 等数据请求完毕的时候我们再在主线程刷新页面
        //此处用同步 会卡死 因为在主线程添加同步任务 根据先进先出 这个任务会放在主线程的最后去执行 ("队列阻塞") 那么程序不运行完(被杀死) 这个同步任务就不会被执行 下面的也不会被执行
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    
    } failure:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}

//必须实现的两个方法 面试考默写

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identifier];
    ActivityModel*model=[[ActivityModel alloc]init];
    [model setValuesForKeysWithDictionary:self.dataArray[indexPath.row]];
//    [cell setModel:model];
    cell.model=model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 215;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityModel*model=[[ActivityModel alloc]init];
    [model setValuesForKeysWithDictionary:self.dataArray[indexPath.row]];
    
    [self performSegueWithIdentifier:@"activityDetail" sender:model];
}
//一种storyBoard传值方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        ActivityDetailViewController*detailVC=segue.destinationViewController;
        detailVC.model=sender;
    }
}

@end
