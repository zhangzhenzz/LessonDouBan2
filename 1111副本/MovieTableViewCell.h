//
//  MovieTableViewCell.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/30.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MovieCell_Identifier @"MovieCell_Identifier"
@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubdateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end
