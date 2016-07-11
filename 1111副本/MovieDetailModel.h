//
//  MovieDetailModel.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "BaseModel.h"

@interface MovieDetailModel : BaseModel
@property (nonatomic , strong)NSDictionary *rating;//评分
@property (nonatomic , copy)NSString *summary;//简介
@property (nonatomic , strong)NSArray *genres;//分类
@property (nonatomic , strong)NSArray *countries;//国家
@property (nonatomic , strong)NSArray *durations;//时长
@property (nonatomic , assign)NSInteger useful_count;//评论数
@property(nonatomic,assign) NSInteger comments_count;
@end
