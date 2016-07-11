//
//  ActivityModel.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "BaseModel.h"
#import "OwnerModel.h"


@interface ActivityModel : BaseModel
//model一定要加注释 最后谁都会忘
//活动分类
//为什么是copy
@property (nonatomic, copy) NSString *subcategory_name;
//图片
@property (nonatomic, copy) NSString *image;
//活动信息(网页版)
@property (nonatomic, copy) NSString *adapt_url;

@property (nonatomic, copy) NSString *loc_name;
//活动发布者
@property (nonatomic, strong) OwnerModel *user;
//购票网址
@property (nonatomic, copy) NSString *alt;
//活动ID
@property (nonatomic, copy) NSString *ID;//防止重复
//类别
@property (nonatomic, copy) NSString *category;
//标题
@property (nonatomic, copy) NSString *title;
//评论个数
@property (nonatomic, assign) NSInteger wisher_count;
//是否有票
@property (nonatomic, assign) BOOL *has_ticket;
//内容
@property (nonatomic, copy) NSString *content;
//是否可以邀请
@property (nonatomic, copy) NSString *can_invite;
//相册
@property (nonatomic, copy) NSString *album;
//参与人数
@property (nonatomic, assign) NSInteger participant_count;
//标签
@property (nonatomic, copy) NSString *tags;
//大图
@property (nonatomic, copy) NSString *image_hlarge;
//图们
@property (nonatomic, strong) NSArray *photos;
//开始时间
@property (nonatomic, copy) NSString *begin_time;
//价格范围
@property (nonatomic, copy) NSString *price_range;
//地理坐标
@property (nonatomic, copy) NSString *geo;
//图
@property (nonatomic, copy) NSString *image_lmobile;
//类别
@property (nonatomic, copy) NSString *category_name;
//登录id
@property (nonatomic, copy) NSString *loc_id;
//结束时间
@property (nonatomic, copy) NSString *end_time;
//地址
@property (nonatomic, copy) NSString *address;





@end
