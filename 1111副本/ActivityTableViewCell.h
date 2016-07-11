//
//  ActivityTableViewCell.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/30.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

#define ActivityTableViewCell_Identifier @"ActivityTableViewCell_Identifier"
@interface ActivityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *interestedNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *joinedNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property(nonatomic,strong)ActivityModel*model;
@end
