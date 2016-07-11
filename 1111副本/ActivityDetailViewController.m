//
//  ActivityDetailViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/30.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    self.timeLabel.text=[NSString stringWithFormat:@"%@--%@",self.model.begin_time,self.model.end_time];
    self.titleLabel.text=self.model.title;
    self.ownerLabel.text=self.model.user.name;
    self.categoryLabel.text=self.model.category_name;
    self.addressLabel.text=self.model.address;
    self.contentLabel.text=self.model.content;
    self.imageV.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.image]]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"活动详情";
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
