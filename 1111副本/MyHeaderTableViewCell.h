//
//  MyTableViewCell.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MyHeaderTableViewCell_Identifier @"MyHeaderTableViewCell_Identifier"

@interface MyHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end
