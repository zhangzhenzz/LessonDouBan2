//
//  MyTableViewCell.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "MyHeaderTableViewCell.h"



@implementation MyHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.avatarImageView.layer.masksToBounds=YES;//允许设置圆角
    self.avatarImageView.layer.cornerRadius=self.avatarImageView.bounds.size.width/2.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
