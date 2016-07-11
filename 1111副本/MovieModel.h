//
//  MovieModel.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "BaseModel.h"
#import "EntriesModel.h"
@interface MovieModel : BaseModel
//大标题
@property(nonatomic,copy)NSString * title;
//正在上映的电引述
@property(nonatomic,copy)NSString * total;
//进入？？？什么鬼张正你个大傻比
@property(nonatomic,strong)MovieModel * entries;
@end
