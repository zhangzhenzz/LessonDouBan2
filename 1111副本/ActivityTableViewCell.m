//
//  ActivityTableViewCell.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/30.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//MVC的封装
//setter方法
-(void)setModel:(ActivityModel *)model{
    _model=model;
    self.titleLabel.text=model.title;
    self.dateLabel.text=[NSString stringWithFormat:@"%@ - %@",model.begin_time,model.end_time];
    self.addressLabel.text=model.address;
    self.activityTypeLabel.text=model.category_name;
    self.interestedNumberLabel.text=[NSString stringWithFormat:@"%ld",model.wisher_count];
    self.joinedNumberLabel.text=[NSString stringWithFormat:@"%ld",model.participant_count];
    [self.imageV setImageWithURL:[NSURL URLWithString:model.image]];
}

@end
