//
//  TheaterTableViewCell.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/30.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheaterModel.h"
#define TheatreTableViewCell_Identifier @"TheatreTableViewCell_Identifier"
@interface TheaterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cinemaNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *telephoneLabel;
@property(nonatomic, strong)TheaterModel*model;
@end
