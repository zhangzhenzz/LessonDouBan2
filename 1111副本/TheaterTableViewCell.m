//
//  TheaterTableViewCell.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/30.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "TheaterTableViewCell.h"

@implementation TheaterTableViewCell

-(void)setModel:(TheaterModel *)model{
    _model=model;
    self.cinemaNameLabel.text=model.cinemaName;
    self.addressLabel.text=model.address;
    self.telephoneLabel.text=model.telephone;
    NSLog(@"1");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
