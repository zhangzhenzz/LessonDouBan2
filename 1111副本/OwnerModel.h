//
//  OwnerModel.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel
//名
@property (nonatomic, copy) NSString *name;
//头像
@property (nonatomic, copy) NSString *avatar;
//
@property (nonatomic, copy) NSString *uid;
//交替
@property (nonatomic, copy) NSString *alt;
//类型
@property (nonatomic, copy) NSString *type;
//id
@property (nonatomic, copy) NSString *ID;
//大头像
@property (nonatomic, copy) NSString *large_avatar;
@end
