//
//  MovieDetailViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/7/1.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailRequest.h"
#import "MovieDetailModel.h"
@interface MovieDetailViewController ()
@property(nonatomic,strong)MovieDetailModel*detailModel;
@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *comments;
@property (weak, nonatomic) IBOutlet UILabel *pubcate;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *genresLabel;
@property (weak, nonatomic) IBOutlet UILabel *countries;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=self.model.title;
    
    MovieDetailRequest*request=[MovieDetailRequest new];
//    NSString*ID=[NSString  stringWithFormat:@"%ld",self.model.ID];
    [request movieDetailWithParameter:@{@"id":self.model.ID} success:^(NSDictionary *dic) {
        self.detailModel = [[MovieDetailModel alloc] init];
        [self.detailModel setValuesForKeysWithDictionary:dic];
        NSLog(@"%@",dic);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.comments.text=[NSString stringWithFormat:@"%ld",self.detailModel.comments_count];
            self.rating.text = [NSString stringWithFormat:@"%@",self.detailModel.rating[@"average"]];
            self.largeImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.images[@"large"]]]];
            self.pubcate.text = self.model.pubdate;
            self.durationLabel.text = [self.detailModel.durations lastObject];
            self.genresLabel.text = [self.detailModel.genres lastObject];
            
            self.countries.text = [self.detailModel.countries objectAtIndex:0];
            self.summaryLabel.text = self.detailModel.summary;
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error");
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
